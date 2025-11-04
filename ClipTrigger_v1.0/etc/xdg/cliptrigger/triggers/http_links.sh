if [[ "$content" =~ ^http ]];then

	# Handles Http Links

	#####################################################
	# Functions

	mpv_player() {
		mpv --force-window=yes --terminal=no --really-quiet --msg-level=all=no --ytdl-format='bestvideo[height<=480]+bestaudio/best' $* 2> /dev/null
	}
	ytdlp_video() {
		xterm -e yt-dlp -f "best[height<=1080]" $*
	}
	ytdlp_audio() {
		xterm -e yt-dlp -t mp3 --embed-thumbnail --add-metadata --metadata-from-title "%(title)s" --parse-metadata "title:%(title)s" --parse-metadata "uploader:%(artist)s" --output "%(title)s.%(ext)s" -f "best[height<=300]" $*
	}
	ytdlp_video_chapters() {
		ytdlp_video --split-chapters --exec rm $*
	}
	ytdlp_audio_chapters() {
		ytdlp_audio --split-chapters --exec rm $*
	}

	youtube_link() {
		local link action
		link="$1"
		debug "Found a Youtube Link: $link"
		action="No Action"
		if [ ! "$passive" ];then
			action="${ACTION_FOR_YOUTUBE_LINKS:-Open with mpv}"
			if [ ! "$ACTION_FOR_YOUTUBE_LINKS" ] && [ "$(which zenity)" ];then
				debug "Asking about YouTube Link: $link"
				action="$(zenity --list --title="Copied a YouTube Link" --text="What Would You Like To Do?" --column="Options" \
					"Open with mpv" \
					"Open with xdg-open" \
					"Download Video" \
					"Download Audio" \
					"Download Video Chapters" \
					"Download Audio Chapters"
				)"
			fi
			case "$action" in
				("Open with mpv")           mpv_player "$link" &;;
				("Open with xdg-open")      xdg-open "$link" &;;
				("Download Video")          ytdlp_video "$link" &;;
				("Download Audio")          ytdlp_audio "$link" &;;
				("Download Video Chapters") ytdlp_video_chapters "$link" &;;
				("Download Audio Chapters") ytdlp_audio_chapters "$link" &;;
				(*)                         action="No Action";;
			esac
			broadcast -c "green" "YouTube" "$action: $link"
		fi
		echo "$link" >> "$cache/http_links_youtube"
	}

	unknown_link() {
		local link
		link="$1"
		debug "Unknown Link: $link"
		broadcast -c "black" "Unknown Link" "$link"
	}

	#####################################################
	# Execution

	link="$content"
	site="$(echo "$link" | cut -d '/' -f 3)"

	case "$site" in
		(www.youtube.com) youtube_link "$link" &;;
		(youtu.be)        youtube_link "$link" &;;
		(*)               unknown_link "$link" &;;
	esac

	echo "$site|$link" >> "$cache/http_links"

	#####################################################
fi
