
import moment from "../moment/min/moment-with-locales.min.js";
import { MotokoWriter } from "./generate-common.js"

let writer = new MotokoWriter();
for (let locale of moment.locales()) {
    writer.writeLine(`module ${locale} {`);
}