<?php

$jsonFile = $_SERVER['HOME']. '/.config/Google Play Music Desktop Player/json_store/playback.json';

if (file_exists($jsonFile)) {
    $json = json_decode(file_get_contents($jsonFile), true);
    if ($json['playing']) {
        $icon = '';
        $artist = $json['song']['artist'];
        $album = $json['song']['album'];
        $title = $json['song']['title'];
        echo "$icon $artist - $album - $title";
        return;
    }
}

$icon = '';
$artist = exec($_SERVER['HOME'].'/.config/i3/conky-spotify/scripts/artist.sh');
$album = exec($_SERVER['HOME'].'/.config/i3/conky-spotify/scripts/album.sh');
$title = exec($_SERVER['HOME'].'/.config/i3/conky-spotify/scripts/title.sh');

if ($title != '') {
    echo "$icon $artist - $album - $title";
}
