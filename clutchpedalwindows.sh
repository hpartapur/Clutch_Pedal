#!/bin/bash
echo "Enter file name with extension of your exported file."
echo "Make sure this file is in your ClutchPedal folder, and that there are no spaces in the file name."
$inputpath = Read-Host "Enter File Name here. "
$outputname = Read-Host "Create a name for your HandBraked Compressed Video with extension. Example: myvideocompressed.mp4"
./HandBrakeCLI.exe -i "$inputpath" -o "$outputname" -e x264 -q 27.0 -r 25 -w 1920 -l 1080
