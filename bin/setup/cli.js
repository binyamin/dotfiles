#!/usr/bin/env node

import minimist from "minimist";
import shx from "shelljs";
import ora from 'ora';

shx.config.silent = true;

import * as runtimes from "./lib/runtimes.js";

const argv = minimist(process.argv.slice(2));
const ora_colors = ['black', 'red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white', 'gray'];

// Check if we're root
if(shx.exec("whoami") !== "root") {
    console.error("You must run this program with `sudo`!")
    process.exit(1);
}

function wait(ms) {
    return new Promise((resolve, _reject) => {
        setTimeout(resolve, ms);
    })
}

/**
 * 
 * @param {string} title name of section
 * @param {[string, (() => void)][]} list array of functions
 */
async function section(title="", list=[]) {
    const spinner = ora();
    spinner.prefixText = title;
    spinner.text = `[-/${list.length}] ---`;
    spinner.start();
    for(const idx in list) {
        const [fname, fn] = list[idx];
        spinner.color = ora_colors[idx];
        spinner.text = `[${Number(idx) + 1}/${list.length}] Installing ${fname}`;
        fn();
        fn.call();
    }
    spinner.text = "";
    spinner.succeed();
}

await section("Runtimes", Object.entries(runtimes));
// console.log(Object.entries(runtimes))
process.exit(0);