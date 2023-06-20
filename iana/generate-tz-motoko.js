import IANATimezoneData from "iana-tz-data" assert { type: 'json' };
import fs from "fs";

let filename = 'Data.mo';


var depth = 0;

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


function buildLocale(localeId, locale) {
    let obj = buildLine(`{`);
    depth += 1;
    obj += buildLine(`id = "${localeId}";`);

    if (!!locale.abbrs) {
        let indicies = Array.from({ length: locale.abbrs.length }, (_, i) => i);
        obj += buildList("data", indicies, (i) => {
            let obj = buildLine("{");
            depth += 1;
            obj += buildLine(`abbr = "${locale.abbrs[i]}";`);
            obj += buildLine(`until = ${locale.untils[i] == null ? "null" : "?" + locale.untils[i]};`);
            obj += buildLine(`isdst = ${locale.isdsts[i] ? "true" : "false"};`);
            let offset = locale.offsets[i];
            let isFloat = !!(offset % 1);
            if (isFloat && offset < 0) {
                offset = Math.abs(offset);
            }
            obj += buildLine(`offset = ${offset};`); // TODO remove abs
            depth -= 1;
            obj += getPadding() + "}";
            return obj;
        });
        delete locale.abbrs;
        delete locale.untils;
        delete locale.isdsts;
        delete locale.offsets;
    } else {
        obj += buildLine(`data = [];`);
    }

    obj += buildList("locales", Object.keys(locale), (innerLocaleId) => {
        let innerLocale = locale[innerLocaleId];
        return buildLocale(innerLocaleId, innerLocale);
    });
    depth -= 1;
    obj += getPadding() + "}";
    return obj;
};






let fileText = "";
fileText += buildLine(`import Types "./Types";`);
fileText += buildLine("module {");
depth += 1;

fileText += buildList("public let data : [Types.Locale]", Object.keys(IANATimezoneData.zoneData), (zoneId) => buildLocale(zoneId, IANATimezoneData.zoneData[zoneId]));

depth -= 1;
fileText += buildLine(`};`);

fs.writeFile(filename, fileText, (err) => { });