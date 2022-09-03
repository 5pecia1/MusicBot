#!/bin/sh

# This will have this script check for a new version of JMusicBot every
# startup (and download it if the latest version isn't currently downloaded)
DOWNLOAD=true

download() {
    if [ $DOWNLOAD = true ]; then
        # URL=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest |
        #     grep -i browser_download_url.*\.jar |
        #     sed 's/.*\(http.*\)"/\1/')
        URL=$(echo https://github.com/jagrosh/MusicBot/releases/download/0.3.7/JMusicBot-0.3.7.jar |
            sed 's/.*\(http.*\)"/\1/')
        FILENAME=$(echo $URL | sed 's/.*\/\([^\/]*\)/\1/')
        if [ -f $FILENAME ]; then
            echo "Latest version already downloaded (${FILENAME})"
        else
            curl -L $URL -o $FILENAME
        fi
    fi
}

run() {
    java -Dnogui=true -jar $(ls -t JMusicBot* | head -1)
}

download
run
