function alacritty-theme --argument theme
  # sed doesn't like symlinks, get the absolute path
  set -l config_path (realpath ~/.config/alacritty/alacritty.yml)

  sed -i "" -e "s#^colors: \*.*#colors: *$theme#g" $config_path

  echo "switched to $theme."
end
