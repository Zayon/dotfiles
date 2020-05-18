# Defined in - @ line 1
function camera --description 'alias camera=vlc v4l2:// :input-slave=alsa:// :v4l-vdev=/dev/video0'
	vlc v4l2:// :input-slave=alsa:// :v4l-vdev=/dev/video0 $argv;
end
