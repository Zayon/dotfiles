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
    pcmanfm \
    firefox \
    mate mate-utils \
    arandr \
    rofi \
    zathura zathura-pdf-mupdf \
    network-manager-applet \
    openssh \
    playerctl \
    wget \
    redshift \
    feh \
    numlockx \
    xcompmgr \
    pulseaudio pulseaudio-alsa alsa-utils pasystray pavucontrol \
    bat \
    exa \
    ncdu \
    shotwell \
    vlc \
    ttf-jetbrains-mono \
    docker \
    chromium \
```

### Use fish as default shell
`chsh -s /usr/bin/fish`

## Install more stuff (AUR)
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S google-chrome
yay -S google-musicmanager
yay -S gpmdp
yay -S keeweb-desktop
yay -S phpstorm
yay -S phpstorm-jre
yay -S slack-desktop
yay -S spotify
yay -S visual-studio-code
```

## Firefox config

| Clé | valeur | détails |
| --- | ------ | ------- |
| `browser.tabs.closeWindowWithLastTab` | false | ... |
| `network.IDN_show_punycode` | true |  URL spoofing conerns |
| `extensions.pocket.enabled` | false | ... |
| `browser.ctrlTab.previews` | true | ctrl-tab between tabs |
| `telemetry` | false | everywhere |

## Additionnal tools

### Youtube-dl

```
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

#### Use examples

##### Get album from bandcamp
`youtube-dl --get-filename -o "%(autonumber)02d_%(title)s.%(ext)s" "URL"`

##### Get music from youtube
`youtube-dl -x --audio-format mp3 "URL"`

##### Get portion of youtube video
```
ffmpeg -i $(youtube-dl -f 22 --get-url "URL") \
    -ss 00:25:30 \ # Start of capture
    -t 00:02:10 \ # Duration of capture
    -c:v copy -c:a copy video.mp4
```

### Fonts

#### Fork Awesome

https://forkawesome.github.io/Fork-Awesome/cheatsheet/

```
cd ~/.fonts
wget -O fork-awesome (curl -s https://api.github.com/repos/ForkAwesome/Fork-Awesome/tags | grep zipball_url | cut -d '"' -f 4 | head -n 1)
unzip -j fork-awesome '*/fonts/*' -d .
rm fork-awesome *.svg
```
