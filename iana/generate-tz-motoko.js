import IANATimezoneData from "iana-tz-data" assert { type: 'json' };
import fs from "fs";
import { MotokoWriter } from "./generate-common.js"

let nameMap = {};



function buildRegion(writer, regionId, region, parentRegionId, parentModuleName) {
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
    writer.writeLine(prefix + `module ${moduleName} {`);
    writer.depth += 1;

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
        writer.writeLine(`public let region : Types.Region = {`);
        writer.depth += 1;
        writer.writeLine(`id = "${fullRegionId}";`);
        writer.writeList("timeZoneRules", indicies, (i) => {
            writer.writeLine("{");
            writer.depth += 1;
            writer.writeLine(`abbreviation = "${abbrs[i]}";`);
            writer.writeLine(`expiration = ${untils[i] == null ? "null" : "?" + untils[i]};`);
            writer.writeLine(`isDaylightsSavings = ${isdsts[i] ? "true" : "false"};`);
            let offset = -1 * Math.round(offsets[i] * 60); // Convert to seconds int from minutes float
            writer.writeLine(`offsetSeconds = ${offset};`);
            writer.depth -= 1;
            writer.write("}");
        });
        writer.depth -= 1;
        writer.writeLine(`};`);
    };

    for (let innerRegionId in region) {
        let innerRegion = region[innerRegionId];
        buildRegion(writer, innerRegionId, innerRegion, fullRegionId, fullModuleName);
    }
    writer.depth -= 1;
    writer.writeLine("};");
};




function buildFile(zoneId, zone, parentRegionId, parentModule) {
    let writer = new MotokoWriter();
    writer.writeLine(`import Types "../Types";`);
    buildRegion(writer, zoneId, zone, parentRegionId, parentModule);
    return writer.motoko;
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

let regionMapWriter = new MotokoWriter();
for (let fileName of fileNames) {
    regionMapWriter.writeLine(`import ${fileName} "timezones/${fileName}";`);
};
regionMapWriter.writeLine(`module {`);
regionMapWriter.depth += 1;
regionMapWriter.writeList("public let regions", Object.keys(nameMap), (regionName) => {
    let moduleName = nameMap[regionName];
    regionMapWriter.write(`${moduleName}.region`);
});
regionMapWriter.depth -= 1;
regionMapWriter.writeLine(`};`);

let regionMapText = regionMapWriter.motoko;
fs.writeFileSync("RegionList.mo", regionMapText, (err) => { }); 