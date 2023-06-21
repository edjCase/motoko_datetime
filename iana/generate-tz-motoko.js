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


function buildLocale(localeId, locale, parentLocaleId, parentModuleName) {
    let moduleName = normalizeText(localeId);
    let fullLocaleId;
    let fullModuleName;
    let prefix;
    if (!!parentLocaleId) {
        parentLocaleId = parentLocaleId + "/";
        parentModuleName = parentModuleName + ".";
        fullLocaleId = parentLocaleId + localeId;
        fullModuleName = parentModuleName + moduleName;
        if (locale.abbrs?.length > 0) {
            nameMap[fullLocaleId] = fullModuleName;
        }
        prefix = `public `;
    }
    else {
        fullLocaleId = localeId;
        fullModuleName = moduleName;
        prefix = "";
    }
    let obj = buildLine(prefix + `module ${moduleName} {`);
    depth += 1;

    let abbrs = locale.abbrs || [];
    let untils = locale.untils || [];
    let isdsts = locale.isdsts || [];
    let offsets = locale.offsets || [];
    delete locale.abbrs;
    delete locale.untils;
    delete locale.isdsts;
    delete locale.offsets;

    let indicies = Array.from({ length: abbrs.length }, (_, i) => i);
    if (indicies.length > 0) {
        obj += buildLine(`public let locale : Types.Locale = {`);
        depth += 1;
        obj += buildLine(`id = "${fullLocaleId}";`);
        obj += buildList("rules", indicies, (i) => {
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

    for (let innerLocaleId in locale) {
        let innerLocale = locale[innerLocaleId];
        obj += buildLocale(innerLocaleId, innerLocale, fullLocaleId, fullModuleName);
    }
    depth -= 1;
    obj += buildLine("};");
    return obj;
};




function buildFile(zoneId, zone, parentLocaleId, parentModule) {
    let fileText = "";
    fileText += buildLine(`import Types "../Types";`);
    fileText += buildLocale(zoneId, zone, parentLocaleId, parentModule);
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

let localeMapText = "";
for (let fileName of fileNames) {
    localeMapText += buildLine(`import ${fileName} "timezones/${fileName}";`);
};
localeMapText += buildLine(`module {`);
depth += 1;
localeMapText += buildList("public let locales", Object.keys(nameMap), (localeName) => {
    let moduleName = nameMap[localeName];
    return `\t\t${moduleName}.locale`;
});
depth -= 1;
localeMapText += buildLine(`};`);

fs.writeFileSync("LocaleList.mo", localeMapText, (err) => { }); 