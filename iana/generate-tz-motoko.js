import moment from "moment-timezone/builds/moment-timezone-with-data.min.js";
import fs from "fs";
import { MotokoWriter } from "./generate-common.js"

let nameMap = {};



function buildRegion(writer, region, moduleName) {
    writer.writeLine(`public module ${moduleName} {`);
    writer.depth += 1;

    let abbrs = region.abbrs || [];
    let untils = region.untils || [];
    let offsets = region.offsets || [];

    let indicies = Array.from({ length: abbrs.length }, (_, i) => i);

    if (indicies.length > 0) {
        writer.writeLine(`public let region : Types.Region = {`);
        writer.depth += 1;
        writer.writeLine(`id = "${region.name}";`);
        writer.writeList("timeZoneRules", indicies, (i) => {
            writer.writeLine("{");
            writer.depth += 1;
            writer.writeLine(`abbreviation = "${abbrs[i]}";`);
            writer.writeLine(`expiration = ${untils[i] == null || untils[i] == Infinity ? "null" : "?" + untils[i]};`);
            let offset = -1 * Math.round(offsets[i] * 60); // Convert to seconds int from minutes float
            writer.writeLine(`offsetSeconds = ${offset};`);
            writer.depth -= 1;
            writer.write("}");
        });
        writer.depth -= 1;
        writer.writeLine(`};`);
    };

    writer.depth -= 1;
    writer.writeLine("};");
};




function normalizeText(t) {
    return t.replace(/\//g, "_").replace(/-/g, "_").replace(/\+/g, "__").replace(/ /g, "_");
}

try {
    fs.rmdirSync("timezones", { recursive: true });
} catch (e) { }

fs.mkdirSync("timezones");


let zones = moment.tz.names().reduce((zoneMap, name) => {
    let zoneInfo = moment.tz.zone(name);
    let parts = name.split("/");
    let topName = parts[0];
    if (!zoneMap[topName]) {
        zoneMap[topName] = [];
    }
    zoneMap[topName].push(zoneInfo);
    return zoneMap;
}, {});

let fileNames = [];
for (let zoneId in zones) {
    let subZones = zones[zoneId];
    let moduleName = normalizeText(zoneId);
    fileNames.push(moduleName);

    let writer = new MotokoWriter();
    writer.writeLine(`import Types "../Types";`);
    writer.writeLine(`module ${moduleName} {`);
    writer.depth += 1;
    for (let subZone of subZones) {
        let subZoneId = subZone.name.replace(zoneId + "/", "");
        let subModuleName = normalizeText(subZoneId);
        nameMap[subZoneId] = moduleName + "." + subModuleName;
        buildRegion(writer, subZone, subModuleName);
    };
    writer.depth -= 1;
    writer.writeLine(`}`);
    let fileText = writer.motoko;

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