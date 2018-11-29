#!/bin/bash
touch /tmp/stop
</tmp/stop ffmpeg -y  -f x11grab -framerate 25 -video_size 1024x768 -i :99 -c:a libfdk_aac -c:v libx264 -preset ultrafast -crf 28 -refs 4 -qmin 4 -pix_fmt yuv420p -filter:v fps=25 video-${BUILD_NUMBER}.mp4 2>&1 >/dev/null
