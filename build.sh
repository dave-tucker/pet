#! /bin/sh

set -e

# Deps
sudo dnf -y update
sudo dnf -y groupinstall "c-development"
sudo dnf -y install \
    git \
    git-email \
    emacs \
    curl \
    alacritty \
    mesa-dri-drivers \
    zsh \
    ripgrep \
    exa \
    neovim

# Starship
curl -sS https://starship.rs/install.sh | sh -s -- -f

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
source "$HOME/.cargo/env"
rustup toolchain install nightly -c rust-src
cargo install bpf-linker

# Codium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf -y update
sudo dnf install -y codium
