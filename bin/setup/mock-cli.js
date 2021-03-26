#!/usr/bin/env node

import ora from "ora";

const ora_colors = ['black', 'red', 'green', 'yellow', 'blue', 'magenta', 'cyan', 'white', 'gray'];

function wait(ms) {
    return new Promise((resolve, reject) => {
        setTimeout(resolve, ms);
    })
}

async function section(title="", list=[]) {
    const spinner = ora();
    spinner.start();
    spinner.prefixText = title;
    spinner.text = `[-/${list.length}] ---`;
    for (const r in list) {
        spinner.color = ora_colors[r];
        spinner.text = `[${Number(r) + 1}/${list.length}] ${list[r]}`;
        await wait(750);
    }
    spinner.text = "";
    spinner.succeed();
}
await section("Runtimes", [
    // "Node.js (nvm)",
    // "Python3 (pyenv)",
    // "Java"
]);
await section("Developer Tools", [
    // "Git",
    // "Tilix (apt)",
    // "ZSH & OMZ",
    // "vim & vim-plug",
    // "yadm",
    // "docker",
    // "bat (apt)",
    // "gh cli",
    // "jq (apt)",
    // "printer-driver-gutenprint (apt)",
    // "protonvpn-cli",
    // "playerctl (apt)",
    // "imagemagick"
]);
await section("Apps", [
    // "Code-insiders (snap)",
    "Microsoft Edge Dev (browser)",
    // "Spotify (snap)",
    // "VLC (snap)",
    "Element",
    "Dropbox",
    "Keybase",
    "Obsidian (snap)",
    // "emote (snap)",
    // "flameshot (snap)",
    // "freac (snap)",
    "mpv",
    "beets",
    "zoom"
]);

await section("UI", [
    "Tela icons",
    "Qogir theme",
    "DockbarX for Xfce4",
    "fonts-firacode (apt)",
    "fonts-noto-color-emoji (apt)",
    "fonts-twemoji-svginot (apt)"
]);
console.log("Bootstrapping complete.");
await wait(500);
console.log(`\nNext Steps:
* Setup your dotfiles
* Eat candy`);