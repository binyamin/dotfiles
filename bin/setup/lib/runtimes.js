import shx from "shelljs";

/**
 * Installs Node.js LTS via NVM
 */
export function nodejs() {
    console.log(this);
    if(!shx.which("git")) {
        shx.exec("apt install -y git");
    }

    if(!shx.which("nvm")) {
        // Set up NVM
        const nvm_dir="$HOME/.nvm";
        shx.exec(`git clone https://github.com/nvm-sh/nvm.git "${nvm_dir}"`);
        shx.cd(nvm_dir);
        shx.exec("git checkout \`git describe --abbrev=0 --tags --match \"v[0-9]*\" $(git rev-list --tags --max-count=1)\`");
        shx.exec(`. ${nvm_dir}/nvm.sh`);
    }

    // Install node
    shx.exec("nvm install lts/*");
    shx.exec("npm i -g npm");
}

/**
 * Installs python3 (pyenv optional, default: true)
 */
export function python3(pyenv=true) {
    if(pyenv) {
        // Install build dependencies
        shx.exec("apt-get update; apt-get install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev python-openssl git");
        
        // Run installer script
        shx.exec("curl https://pyenv.run | bash")
        shx.exec("$SHELL");
        shx.exec("pyenv install 3.9.2") // version subject to change
    } else {
        shx.exec("apt install -y python3 python3-pip python3-venv build-essential libssl-dev libffi-dev python3-dev");
    }
}

/**
 * Installs java
 */
export function java() {
    shx.exec("apt install -y default-jdk default-jre")
}