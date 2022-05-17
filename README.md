# dotfiles

## Archlinux Installation

[Archlinux Installation gist](https://gist.github.com/Zayon/afc3d9fd83cbfc6e63ded6887eb9b5fc)

## Set up dotfiles

```
pacman -S git
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/Zayon/dotfiles.git $HOME/dotfiles-tmp
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
config checkout
config config status.showUntrackedFiles no
config restore .
rm $HOME/dotfiles-tmp
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
    plasma-desktop plasma-pm plasma-pa kscreen \
    pamixer powerdevil qt6-tools \
    breeze-gtk kde-gtk-config xdg-desktop-portal \
    dolphin gwenview \
    fish \
    i3-gaps \
    pipewire \
    picom \
    bluez bluez-utils bluedevil \
    ttf-jetbrains-mono \
    nnn \
    firefox \
    arandr \
    rofi \
    zathura zathura-pdf-mupdf \
    flameshot \
    openssh \
    playerctl \
    wget \
    redshift \
    feh \
    picom \
    pasystray pavucontrol \
    bat \
    exa \
    code \
    fzf \
    ncdu \
    ark \
    vlc \
    python python-dbus \
    docker \
    chromium \
    xdotool wmctrl \
    fzf git-delta \

```

## Use fish as default shell
`chsh -s /usr/bin/fish`

## Backlight

```
sudo pacman -S light

sudo gpasswd -a $USER video
sudo chmod g+w /sys/class/backlight/intel_backlight/brightness
sudo chgrp video /sys/class/backlight/intel_backlight/brightness
```

## Configure i3 + KDE

`sudo vim /usr/share/xsessions/plasma-i3.desktop`

```
[Desktop Entry]
Type=XSession
Exec=env KDEWM=/usr/bin/i3 /usr/bin/startplasma-x11
TryExec=/usr/bin/startplasma-x11
DesktopNames=KDE
Name=Plasma (i3)
Comment=Plasma with i3
```

## Install nnn's plugins

`curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh`

## Install more stuff (AUR)
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay polybar
yay keeweb
yay phpstorm
yay phpstorm-jre
yay slack-desktop
yay spotify
yay -S plasma5-applets-eventcalendar
yay git-interactive-rebase-tool
```

## Touchpad Gestures

```
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install (or sudo ./libinput-gestures-setup install)

libinput-gestures-setup service
systemctl --user enable libinput-gestures.service
```



## Syncthing

`sudo pacman -S syncthing`

`systemctl enable syncthing@$USER.service`

`systemctl start syncthing@$USER.service`

[Web GUI](http://127.0.0.1:8384/#)


## Firefox config

```
cd $HOME/.mozilla/firefox/<profile>/
ln -s $HOME/.config/firefox/user.js user.js
ln -s $HOME/.config/firefox/chrome chrome
```

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
