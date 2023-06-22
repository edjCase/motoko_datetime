import IANATimezoneData from "iana-tz-data" assert { type: 'json' };
import fs from "fs";

var depth = 0;
let nameMap = {};

function getPadding() {
    return "\t".repeat(depth);
};

function buildLine(t) {
    return getPadding() + t + "\n";
};

function buildList(listName, items, func) {
    let list = `${listName} = [`;
    if (items.length == 0) {
        return buildLine(list + `];`);
    };
    list = buildLine(list);
    depth += 1;
    for (let i = 0; i < items.length; i++) {
        let v = func(items[i]);
        list += `${v},\n`;
    };
    depth -= 1;
    list += buildLine(`];`);
    return list;
};


function buildRegion(regionId, region, parentRegionId, parentModuleName) {
    let moduleName = normalizeText(regionId);
    let fullRegionId;
    let fullModuleName;
    let prefix;
    if (!!parentRegionId) {
        parentRegionId = parentRegionId + "/";
        parentModuleName = parentModuleName + ".";
        fullRegionId = parentRegionId + regionId;
        fullModuleName = parentModuleName + moduleName;
        if (region.abbrs?.length > 0) {
            nameMap[fullRegionId] = fullModuleName;
        }
        prefix = `public `;
    }
    else {
        fullRegionId = regionId;
        fullModuleName = moduleName;
        prefix = "";
    }
    let obj = buildLine(prefix + `module ${moduleName} {`);
    depth += 1;

    let abbrs = region.abbrs || [];
    let untils = region.untils || [];
    let isdsts = region.isdsts || [];
    let offsets = region.offsets || [];
    delete region.abbrs;
    delete region.untils;
    delete region.isdsts;
    delete region.offsets;

    let indicies = Array.from({ length: abbrs.length }, (_, i) => i);
    if (indicies.length > 0) {
        obj += buildLine(`public let region : Types.Region = {`);
        depth += 1;
        obj += buildLine(`id = "${fullRegionId}";`);
        obj += buildList("timeZoneRules", indicies, (i) => {
            let obj = buildLine("{");
            depth += 1;
            obj += buildLine(`abbreviation = "${abbrs[i]}";`);
            obj += buildLine(`expiration = ${untils[i] == null ? "null" : "?" + untils[i]};`);
            obj += buildLine(`isDaylightsSavings = ${isdsts[i] ? "true" : "false"};`);
            let offset = -1 * Math.round(offsets[i] * 60); // Convert to seconds int from minutes float
            obj += buildLine(`offsetSeconds = ${offset};`);
            depth -= 1;
            obj += getPadding() + "}";
            return obj;
        });
        depth -= 1;
        obj += buildLine(`};`);
    };

    for (let innerRegionId in region) {
        let innerRegion = region[innerRegionId];
        obj += buildRegion(innerRegionId, innerRegion, fullRegionId, fullModuleName);
    }
    depth -= 1;
    obj += buildLine("};");
    return obj;
};




function buildFile(zoneId, zone, parentRegionId, parentModule) {
    let fileText = "";
    fileText += buildLine(`import Types "../Types";`);
    fileText += buildRegion(zoneId, zone, parentRegionId, parentModule);
    return fileText;
}

function normalizeText(t) {
    return t.replace(/\//g, "_").replace(/-/g, "_").replace(/\+/g, "__").replace(/ /g, "_");
}

try {
    fs.rmdirSync("timezones", { recursive: true });
} catch (e) { }

fs.mkdirSync("timezones");

let fileNames = [];
for (let zoneId in IANATimezoneData.zoneData) {
    let zone = IANATimezoneData.zoneData[zoneId];
    let moduleName = normalizeText(zoneId);
    fileNames.push(moduleName);
    let fileText = buildFile(zoneId, zone, "", "");
    let fileName = `timezones/${moduleName}.mo`;
    fs.writeFile(fileName, fileText, (err) => { });
};

let regionMapText = "";
for (let fileName of fileNames) {
    regionMapText += buildLine(`import ${fileName} "timezones/${fileName}";`);
};
regionMapText += buildLine(`module {`);
depth += 1;
regionMapText += buildList("public let regions", Object.keys(nameMap), (regionName) => {
    let moduleName = nameMap[regionName];
    return `\t\t${moduleName}.region`;
});
depth -= 1;
regionMapText += buildLine(`};`);

fs.writeFileSync("RegionList.mo", regionMapText, (err) => { }); 