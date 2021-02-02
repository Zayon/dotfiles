# dotfiles

## Archlinux Installation

https://gist.github.com/Zayon/afc3d9fd83cbfc6e63ded6887eb9b5fc

## Set up dotfiles

```
pacman -S git
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/Zayon/dotfiles.git ~/.dotfiles $HOME/dotfiles-tmp
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
config checkout
config config status.showUntrackedFiles no
config restore .
```

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

## Install stuff

```
sudo pacman -S reflector
sudo reflector --country France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -S \
    fish \
    i3-wm \
    termite \
    pcmanfm-gtk3 \
    nnn \
    firefox \
    mate mate-utils \
    arandr \
    rofi \
    zathura zathura-pdf-mupdf \
    network-manager-applet \
    openssh \
    playerctl \
    xarchiver \
    wget \
    redshift \
    feh \
    numlockx \
    xcompmgr \
    pulseaudio pulseaudio-alsa alsa-utils pasystray pavucontrol \
    bat \
    exa \
    fzf \
    ncdu \
    shotwell \
    vlc \
    ttf-jetbrains-mono \
    python python-dbus \
    docker \
    chromium \
```

### Use fish as default shell
`chsh -s /usr/bin/fish`

### Install nnn's plugins

`curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh`

## Install more stuff (AUR)
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay keeweb-desktop
yay phpstorm
yay phpstorm-jre
yay slack-desktop
yay spotify
yay siji
yay git-interactive-rebase-tool
```

## Firefox config

| Clé | valeur | détails |
| --- | ------ | ------- |
| `toolkit.legacyUserProfileCustomizations.stylesheets` | true | enable userChrome.css |
| `browser.tabs.closeWindowWithLastTab` | false | ... |
| `network.IDN_show_punycode` | true |  URL spoofing conerns |
| `extensions.pocket.enabled` | false | ... |
| `browser.ctrlTab.previews` | true | ctrl-tab between tabs |
| `telemetry` | false | everywhere |


## Network Manager config

```
#/etc/NetworkManager/conf.d/dns.conf

[main]
dns=none
```

Set FDN DNS

```
#/etc/resolv.conf

nameserver 80.67.169.12
nameserver 80.67.169.40
```