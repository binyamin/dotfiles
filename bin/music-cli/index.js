#!/usr/bin/env nodejs

import minimist from "minimist";

import { panic, say } from "./utils.js";

import * as lib from "./cmd/index.js"

const argv = minimist(process.argv.slice(2))

say(argv)

const cmd = argv[0];

if(!cmd) panic("Specify a command") // short usage

if(cmd in lib) {
    // lib[cmd]()
} else {
    panic("Command not found") // short usage
}