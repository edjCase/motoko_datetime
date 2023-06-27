
import moment from "../moment/min/moment-with-locales.min.js";
import { MotokoWriter } from "./generate-common.js"
import fs from "fs";






function writeLocale(writer, localName, locale) {
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

    // Era
    writer.writeList(`eras`, locale.eras(), (e) => {
        writer.writeLine(`{`);
        writer.depth += 1;
        let start;
        let end;
        switch (e.until) {
            case (Infinity):
                start = e.since * 1_000;
                end = null;
                break;
            case (-Infinity):
                start = null;
                end = e.since * 1_000;
                break;
            default:
                start = e.since * 1_000;
                end = e.until * 1_000;
                break;
        }
        if (start !== null) {
            start = `?${start}`;
        }
        if (end !== null) {
            end = `?${end}`;
        }
        writer.writeLine(`start = ${start};`); // the start of the era
        writer.writeLine(`end = ${end};`); // the end of the era, can be +/-Infinity
        writer.writeLine(`offset = ${e.offset};`); // added to year to (mostly) avoid 0 era years
        writer.writeLine(`fullName = "${e.name}";`); // full name of era
        writer.writeLine(`narrowName = "${e.narrow}";`); // narrow name of era
        writer.writeLine(`abbreviatedName = "${e.abbr}";`);// abbreviated name of era
        writer.depth -= 1;
        writer.write(`}`);
    });

    // Meridiem
    writer.writeLine(`getMeridiem = func (hour : Nat, minute : Nat, isLower : Bool) : Text {`);
    writer.depth += 1;
    // TODO optimize
    writer.writeLine(`let (lower, upper) : (Text, Text) = switch ((hour, minute)) {`);
    writer.depth += 1;
    for (let hour = 0; hour < 24; hour++) {
        let minutesDiffer = false;
        let minutesTextList = [];
        for (let minute = 0; minute < 60; minute++) {
            let lower = locale.meridiem(hour, minute, true);
            let upper = locale.meridiem(hour, minute, false);
            if (minutesTextList.length >= 1) {
                let last = minutesTextList[minutesTextList.length - 1];
                if (last[0] !== lower || last[1] !== upper) {
                    minutesDiffer = true;
                }
            };
            minutesTextList.push([lower, upper]);
        }
        if (minutesDiffer) {
            for (let minute = 0; minute < 60; minute++) {
                let minutesText = minutesTextList[minute];
                writer.writeLine(`case ((${hour}, ${minute})) ("${minutesText[0]}", "${minutesText[1]}");`);
            }
        } else {
            let minutesText = minutesTextList[0];
            writer.writeLine(`case ((${hour}, _)) ("${minutesText[0]}", "${minutesText[1]}");`);
        };
    }
    writer.writeLine(`case (_) Prelude.unreachable();`);
    writer.depth -= 1;
    writer.writeLine(`};`);
    writer.writeLine(`if (isLower) lower else upper;`);
    writer.depth -= 1;
    writer.writeLine(`};`);

    // Ordinal    
    writer.writeLine(`getOrdinal = func (num : Nat) : Text {`);
    writer.depth += 1;

    let currentOrdinal = null;
    for (let day = 0; day < 366; day++) {
        let ordinal = locale.ordinal(day);
        if (!ordinal) {
            break;
        }
        let generic = ordinal.replace(day, "_~_");
        if (currentOrdinal == null) {
            currentOrdinal = {
                generic: generic,
                startDay: day
            };
        } else if (currentOrdinal.generic == generic) {
            continue;
        } else {
            // Change in suffix
            let firstDay = currentOrdinal.startDay;
            let days = day - firstDay;
            let expr;
            if (days > 1) {
                expr = `num > ${firstDay} and num < ${day}`;
            }
            else {
                expr = `num == ${firstDay}`;
            }
            writer.writeLine(`if (${expr}) {`);
            writer.depth += 1;
            writer.writeLine(`return Text.replace("${currentOrdinal.generic}", #text("_~_"), Nat.toText(num));`); // TODO better?
            writer.depth -= 1;
            writer.writeLine(`};`);
            currentOrdinal = {
                generic: generic,
                startDay: day
            };
        };
    }
    writer.writeLine(`Prelude.unreachable();`);
    writer.depth -= 1;
    writer.writeLine(`};`);
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
    writer.writeLine(`import Prelude "mo:base/Prelude";`);
    writer.writeLine(`import Text "mo:base/Text";`);
    writer.writeLine(`import Nat "mo:base/Nat";`);
    writeLocale(writer, localName, locale);
    let fileName = `locales/${localName}.mo`;
    fs.writeFile(fileName, writer.motoko, (err) => { });
};