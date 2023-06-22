

export class MotokoWriter {
    constructor() {
        this.motoko = "";
        this.depth = 0;
    }


    getPadding() {
        return "\t".repeat(this.depth);
    };

    write(t, pad = true) {
        if (pad) {
            t = this.getPadding() + t;
        };
        this.motoko += t;
    };

    writeLine(t, pad = true) {
        this.write(t + "\n", pad);
    };

    writeList(listName, items, func) {
        if (items == null) {
            throw "items cannot be null for " + listName;
        };
        let line = `${listName} = [`;
        if (items.length == 0) {
            this.writeLine(line + `];`);
            return;
        };
        this.writeLine(line);
        this.depth += 1;
        for (let i = 0; i < items.length; i++) {
            func(items[i]);
            this.writeLine(`,`, false);
        };
        this.depth -= 1;
        this.writeLine(`];`);
    };
};