# dotfiles

```
pacman -S git stow
git clone git@github.com:Zayon/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow fish
stow git
stow termite
stow vscode
stow omf
stow pcmanfm
```

## Install stuff

```
sudo pacman -S \
    fish \
    i3 \
    conky \
    termite \
    pcmanfm \
    playerctl \
    arandr \
    pasystray \
    rofi \
    zathura zathura-pdf-mupdf \
    network-manager-applet \
    volumeicon \
    openssh \
```

### Use fish as default shell
`chsh -s /usr/bin/fish`

### Install omf
`curl -L https://get.oh-my.fish | fish`

## Install more stuff (AUR)
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay google-chrome
yay google-musicmanager
yay gpmdp
yay keeweb-desktop
yay neofetch
yay phpstorm
yay phpstorm-jre
yay postman-bin
yay slack-desktop
yay spotify
yay visual-studio-code
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

#### Fork Awesome

https://forkawesome.github.io/Fork-Awesome/cheatsheet/

```
cd ~/.fonts
wget -O fork-awesome (curl -s https://api.github.com/repos/ForkAwesome/Fork-Awesome/tags | grep zipball_url | cut -d '"' -f 4 | head -n 1)
unzip -j fork-awesome '*/fonts/*' -d .
rm fork-awesome *.svg
```
