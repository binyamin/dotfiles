import * as shx from "shelljs"

/**
 * snaps
 */
export function snap() {
    shx.exec("snap install code-insiders --classic");
    shx.exec("snap install spotify vlc emote flameshot freac");
}

function setup_apt_repos() {
    // protonvpn
    shx.exec("wget -q -O - https://repo.protonvpn.com/debian/public_key.asc | sudo apt-key add - ");
    shx.exec("add-apt-repository 'deb https://repo.protonvpn.com/debian unstable main'");

    // github cli
    shx.exec("apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0");
    shx.exec("apt-add-repository https://cli.github.com/packages");
}

/**
 * apt packages
 */
export function apt() {
    setup_apt_repos();
    shx.exec("apt update");
    shx.exec("apt install -y tilix bat jq yadm playerctl printer-driver-gutenprint gh protonvpn imagemagick")
}
