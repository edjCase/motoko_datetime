
import moment from "../moment/min/moment-with-locales.min.js";
import { MotokoWriter } from "./generate-common.js"
import fs from "fs";






function writeLocale(writer, localName, locale) {
    console.log(Object.keys(locale));
    writer.writeLine(`module ${localName} {`);
    writer.depth += 1;
    writer.writeLine(`public let locale : Types.Locale = {`);
    writer.depth += 1;
    writer.writeLine(`id = "${locale._abbr}";`);
    writer.writeList("weekdays", locale.weekdays(), (w) => {
        writer.write(`"${w}"`);
    });
    writer.writeList("weekdaysShort", locale.weekdaysShort(), (w) => {
        writer.write(`"${w}"`);
    });
    writer.writeList("weekdaysMin", locale.weekdaysMin(), (w) => {
        writer.write(`"${w}"`);
    });

    writer.writeList("months", locale.months(), (m) => {
        writer.write(`"${m}"`);
    });
    writer.writeList("monthsShort", locale.monthsShort(), (m) => {
        writer.write(`"${m}"`);
    });
    writer.writeLine(`firstDayOfWeek = ${locale.firstDayOfWeek()};`);
    writer.writeLine(`firstDayOfYear = ${locale.firstDayOfYear()};`);
    writer.writeLine(`timeFormat = "${locale.longDateFormat('LT')}";`);
    writer.writeLine(`dateFormat = "${locale.longDateFormat('L')}";`);
    writer.writeLine(`dateTimeFormat = "${locale.longDateFormat('LT')} ${locale.longDateFormat('L')}";`);
    writer.writeLine(`longDateFormat = "${locale.longDateFormat('L')}";`);
    writer.depth -= 1;
    writer.writeLine(`};`);
    writer.depth -= 1;
    writer.writeLine(`};`);

};


try {
    fs.rmdirSync("locales", { recursive: true });
} catch (e) { }

fs.mkdirSync("locales");

for (let localeId of moment.locales()) {
    let locale = moment.localeData(localeId);
    let localName = localeId.toUpperCase().replace('-', '_');
    let writer = new MotokoWriter();
    writer.writeLine(`import Types "../Types";`);
    writeLocale(writer, localName, locale);
    let fileName = `locales/${localName}.mo`;
    fs.writeFile(fileName, writer.motoko, (err) => { });
};