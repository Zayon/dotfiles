# dotfiles

`git clone git@github.com:Zayon/dotfiles.git ~/dotfiles`

## Install stuff

```
sudo pacman -S \
    git \
    i3 \
    i3lock \
    fish \
    stow \
    conky \
    termite \
    pcmanfm \
    playerctl \
    feh \
    arandr \
    imagemagick \
    pasystray \
    php \
```

### Use fish as default shell
`chsh -s /usr/bin/fish`

### Install omf
`curl -L https://get.oh-my.fish | fish`

## Configure stuff
```
cd ~/dotfiles

stow i3
stow fish
stow git
stow urxvt
```

## Firefox config

Clé | valeur | détails
----|--------|--------
`browser.tabs.closeWindowWithLastTab` | false | ...
`network.IDN_show_punycode` | true |  URL spoofing conerns
`extensions.pocket.enabled` | false | ...
`browser.ctrlTab.previews` | true | ctrl-tab between tabs
`telemetry` | false | everywhere

## Additionnal tool

### Youtube-dl

```
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

#### Use examples 

```
# Get album from bandcamp
youtube-dl --get-filename -o "%(autonumber)02d_%(title)s.%(ext)s" "url"

# Get music from youtube
youtube-dl -x --audio-format mp3 "url"
```

### Conky-Spotify

```
wget -O conky-spotify https://codeload.github.com/Madh93/conky-spotify/zip/master
unzip conky-spotify
rm conky-spotify
mv conky-spotify-master ~/.config/i3/conky-spotify
```

### Desktop apps

```
https://www.googleplaymusicdesktopplayer.com
https://www.spotify.com/fr/download/linux/
https://code.visualstudio.com/docs/?dv=linux64_deb
```

### Fonts

```
cd ~/.fonts
wget -O font-awesome http://fontawesome.io/assets/font-awesome-4.7.0.zip
unzip -j font-awesome
rm *ss font-awesome HELP-US-OUT.txt
```


