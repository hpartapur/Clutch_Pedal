#!/bin/bash
echo If this is your first time working with clutch_pedal, please enter 0. Otherwise, enter 1
read installcheck
macinstall () {
open https://handbrake.fr/rotation.php?file=HandBrakeCLI-1.3.3.dmg
	sudo hdiutil attach HandBrakeCLI-1.3.3.dmg
	cp -r "/Volumes/HandBrakeCLI-1.3.3/HandBrakeCLI" ~/Downloads/
	echo
	echo
	echo If no error messages, SUCCESS! HandBrakeCLI is installed!
}
if [ installcheck==0 ]
then
	echo Enter 1 for Mac, 2 for other.
	read osnumber
	if [ osnumber==1 ]
	then
		macinstall


	elif [  osnumber==2 ]
	then
		open https://handbrake.fr/downloads2.php
		echo Even if you have already downloaded HandBrake before, download from this link according to your OS.
		echo Then Unzip the file.
		echo Once this is done, press any key to continue.
		read anykey
		sudo chmod +x ./HandBrakeCLI
		echo
		echo
		echo If no error messages, SUCCESS! HandBrakeCLI is installed!
	fi
else
	continue
fi

echo
echo
echo
echo Enter Path Name for your Exported File \(Example: /Desktop/myvideo.mp4, or /Downloads/14mi_raat/myvideo.mp4\)
read inputpath
echo
echo
echo Enter number of raat majlis \(Example: 14\)
read raatnumber
outputter="$raatnumber"mi_raat_web.mp4

./HandBrakeCLI -i $inputpath -o ~/Desktop/"$outputter" -e x264 -q 22.0 -r 25 -w 1920 -l 1080
echo HandBraked Video has been exported.
echo Encoding- x264
echo CRF-Quality: 25.0
echo Frame Rate: 22.0
echo 1080p