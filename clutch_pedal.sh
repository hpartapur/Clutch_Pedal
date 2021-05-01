#!/bin/bash
mkdir -p ~/Desktop/Clutch_Pedal
cd ~/Desktop/Clutch_Pedal
echo If this is your first time working with clutch_pedal, please enter 0. Otherwise, enter 1
read installcheck
macinstall () {
open https://handbrake.fr/rotation.php?file=HandBrakeCLI-1.3.3.dmg
	cd ~/Downloads
	sudo hdiutil attach HandBrakeCLI-1.3.3.dmg
	cp -r "/Volumes/HandBrakeCLI-1.3.3/HandBrakeCLI" ~/Desktop/Clutch_Pedal
	#INSTALL IN APPLICATIONS
	echo
	echo
	echo If no error messages, SUCCESS! HandBrakeCLI is installed!
	echo Please run this program again by typing ./clutch_pedal into the terminal again, and entering 1 instead of 0.

}
osnumberer (){
	echo Enter 1 for Windows, 2 for Mac.
	read osnumber
}
success_message(){
	echo HandBraked Video has been exported to Desktop.
	echo Encoding- x264
	echo CRF-Quality: 25.0
	echo Frame Rate: 27.0
	echo 1080p
}
if [ $installcheck -eq 0 ]
then
	osnumberer
	if [ $osnumber -eq 2 ]
	then
		macinstall
	elif [ $osnumber -eq 1 ]
	then
		start https://handbrake.fr/rotation.php?file=HandBrakeCLI-1.3.3-win-x86_64.zip
		cd ~/Downloads
		Expand-Archive -LiteralPath '~\Downloads\HandBrakeCLI-1.3.3-win-x86_64.zip' -DestinationPath '~\Desktop\Clutch_Pedal'
		cd ~\Desktop\Clutch_Pedal
		echo Make sure your Exported File from Premiere Pro is in the Clutch_Pedal folder on the Desktop. If not, copy it to the Clutch_Pedal folder now.
		echo Enter Name of your Exported File from Premiere Pro \(Example: myvideo.mp4, or mymajlisvideo.mp4\)
		read inputpath
		echo
		echo
		echo Enter number of raat majlis \(Example: 14\)
		read raatnumber
		outputter="$raatnumber"mi_raat_web.mp4
		./HandBrake -i '~\Desktop\Clutch_Pedal\"$inputpath"' -o '~/Desktop/Clutch_Pedal/"$outputter"' -e x264 -q 27.0 -r 25 -w 1920 -l 1080
		echo If no error messages, SUCCESS! HandBrakeCLI is installed!
		echo Please run this program again by typing ./clutch_pedal into the terminal again, and entering 1 instead of 0.
	fi
elif [ $installcheck -eq 1 ]
then
	echo
	echo
	#OPENFINDERWKNDOW
	echo Make sure your Exported File from Premiere Pro is in the Clutch_Pedal folder on the Desktop. If not, copy it to the Clutch_Pedal folder now.
	echo Enter Name of your Exported File from Premiere Pro \(Example: myvideo.mp4, or mymajlisvideo.mp4\)
	read inputpath
	echo
	echo
	echo Enter number of raat majlis \(Example: 14\)
	read raatnumber
	outputter="$raatnumber"mi_raat_web.mp4

	./HandBrakeCLI -i $inputpath -o ~/Desktop/Clutch_Pedal/"$outputter" -e x264 -q 27.0 -r 25 -w 1920 -l 1080
	if [ $? -gt 0 ]
	then
		echo Something went wrong HandBraking your video
	elif [  $? -eq 0 ]
	then 
		success_message
		
	fi
else
	echo Something went wrong
fi





