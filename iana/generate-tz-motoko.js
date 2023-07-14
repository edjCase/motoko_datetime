import moment from "moment-timezone/builds/moment-timezone-with-data.min.js";
import fs from "fs";
import { MotokoWriter } from "./generate-common.js"

let nameMap = {};



function buildTzData(writer, data, moduleName) {
    writer.writeLine(`public module ${moduleName} {`);
    writer.depth += 1;

    let abbrs = data.abbrs || [];
    let untils = data.untils || [];
    let offsets = data.offsets || [];

    let indicies = Array.from({ length: abbrs.length }, (_, i) => i);

    if (indicies.length > 0) {
        writer.writeLine(`public let data : Types.TimeZoneData = {`);
        writer.depth += 1;
        writer.writeLine(`id = "${data.name}";`);
        writer.writeList("rules", indicies, (i) => {
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
        buildTzData(writer, subZone, subModuleName);
    };
    writer.depth -= 1;
    writer.writeLine(`}`);
    let fileText = writer.motoko;

    let fileName = `timezones/${moduleName}.mo`;
    fs.writeFile(fileName, fileText, (err) => { });
};

let tzDataListWriter = new MotokoWriter();
for (let fileName of fileNames) {
    tzDataListWriter.writeLine(`import ${fileName} "timezones/${fileName}";`);
};
tzDataListWriter.writeLine(`module {`);
tzDataListWriter.depth += 1;
tzDataListWriter.writeList("public let zoneData", Object.keys(nameMap), (tzName) => {
    let moduleName = nameMap[tzName];
    tzDataListWriter.write(`${moduleName}.data`);
});
tzDataListWriter.depth -= 1;
tzDataListWriter.writeLine(`};`);

let timeZoneListText = tzDataListWriter.motoko;
fs.writeFileSync("TimeZoneList.mo", timeZoneListText, (err) => { }); 