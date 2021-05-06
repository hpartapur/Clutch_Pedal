#!/bin/bash
start https://handbrake.fr/rotation.php?file=HandBrakeCLI-1.3.3-win-x86_64.zip
sleep 5
cd ~/Downloads
Expand-Archive -LiteralPath '~\Downloads\HandBrakeCLI-1.3.3-win-x86_64.zip' -DestinationPath '~\Desktop\Clutch_Pedal'
cd ~/Desktop/Clutch_Pedal
