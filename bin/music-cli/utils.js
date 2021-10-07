export function panic(msg) {
    console.error(msg);
    process.exit(127);
}

export function say(...msg) {
    console.log(...msg)
    process.exit(0);
}