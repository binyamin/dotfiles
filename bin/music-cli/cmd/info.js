import { inspect } from "node:util";

import mm from "music-metadata";

function printTags(/** @type {mm.ICommonTagsResult} */ tags) {
    for(const tagname in tags.common) {
        console.log(tagname, "\n", inspect(tags[tagname]));
    }
    console.log(mm.ratingToStars(tags.rating))
}

async function run(filepath) {
    const tags = await mm.parseFile(filepath);
    printTags(tags.common)
}

export default run;
