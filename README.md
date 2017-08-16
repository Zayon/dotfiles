# dotfiles

`git clone git@github.com:Zayon/dotfiles.git ~/dotfiles`

## Install stuff

```
sudo apt update

sudo apt install \
    git \
    i3 \
    fish \
    stow \
    conky \
    pasystray \
    php-cli \
    meld \
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

## Additionnal steps

### Tools

#### Youtube-dl
```
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

#### Conky-Spotify
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
