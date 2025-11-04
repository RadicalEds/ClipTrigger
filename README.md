# ClipTrigger
Triggers Modular Actions based on Clipboard Content

## Description
Actions, or "Triggers", are bash "snippets" placed within "~/.config/cliptrigger/triggers".   
Each file (ending with .sh), is sourced into the program, in filename order, everytime the clipboard is analysed.    

Sourcing them as "snippets" allows the trigger to have full access to our variables and functions.    
The `$content` variable will contain the clipboards current content (can be modified by previous triggers)    
and the broadcast function is used to send event messages and notifications.   

We have included an example trigger file, it triggers on YouTube links and asks what you would like to do (requires mpv and yt-dlp).   

## Packaged For Debian
to build the deb file just run build.sh    
then to install the deb you run `sudo apt install ./debfile.deb`    

## Installing on any Other OS
if your on a different os, just copy cliptrigger to your PATH and create the directory "~/.config/cliptrigger/triggers/" (optionally copy the included triggers to this directory)
