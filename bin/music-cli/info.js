import { inspect } from "node:util";

import minimist from "minimist";
import mm from "music-metadata";
import { panic } from "./utils";

const argv = minimist(process.argv.slice(2))

if(!argv._[0]) panic("provide a filename");

const tags = await mm.parseFile(argv._[0]);

for(const tagname in tags.common) {
    console.log(tagname, "\n", inspect(tags.common[tagname]));
}

process.exit(0);

