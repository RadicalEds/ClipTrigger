# ClipTrigger
Triggers Modular Actions based on Clipboard Content
![Application Screenshot](https://media.discordapp.net/attachments/1434270963977031690/1435107896613671069/2025-11-03_21-22-43.png?ex=690ac3e1&is=69097261&hm=697e849b9e3bbc9186a7d2dd92a9be475fe7b278b0f9ea7c692481718e76d089&=&format=webp&quality=lossless)
![Example Youtube Trigger Zenity Menu Screenshot](https://media.discordapp.net/attachments/1434270963977031690/1435107897028776118/2025-11-03_21-16-04.png?ex=690ac3e1&is=69097261&hm=ec20f4f6a310f89f5ebef3ff91ddb742301fe24471e4fb2c2a8a5759ca8e2e20&=&format=webp&quality=lossless)

## Description
Actions, or "Triggers", are bash "snippets" placed within "~/.config/cliptrigger/triggers".   
Each file (ending with .sh), is sourced into the program, in filename order, everytime the clipboard is analysed.    

Sourcing them as "snippets" allows the trigger to have full access to our variables and functions.    
The `$content` variable will contain the clipboards current content (can be modified by previous triggers)    
The `broadcast` function is used to send event messages and notifications.   

We have included an example trigger file, it triggers on YouTube links and asks what you would like to do (requires mpv and yt-dlp).   

## Packaged For Debian
to build the deb file just run build.sh    
then to install the deb you run `sudo apt install ./debfile.deb`    

## Installing on any Other OS
if your on a different os, just copy cliptrigger to your PATH and create the directory "~/.config/cliptrigger/triggers/" (optionally copy the included triggers to this directory)
