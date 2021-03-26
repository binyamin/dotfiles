import * as shx from "shelljs"

/**
 * zsh & omz
 */

export function zsh() {
    shx.exec("apt install -y zsh git curl")

    // OMZ
    shx.exec(`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended`);

    // OMZ prompt theme
    shx.exec("zsh");
    shx.exec(`git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1`);
    shx.ln("-s", "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme", "$ZSH_CUSTOM/themes/spaceship.zsh-theme");
}

/**
 * Vim & vim-plug
 */
export function vim() {
    shx.exec("apt install -y curl vim");
    shx.exec("curl -fLo ~/.vim/autoload/plug.vim --create-dirs " +
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim");
}

/**
 * git
 */
export function git() {
    // Even if already installed, we need the latest version, so that .gitconfig
    // will work properly
    shx.exec("add-apt-repository ppa:git-core/ppa");
    shx.exec("apt-get update");
    shx.exec("apt install -y git");
}