#!/bin/bash
(ffmpeg -i "${1}" -vf "palettegen" -y ~/palette.png)  2>/dev/null
(ffmpeg -i "${1}" -i ~/palette.png -lavfi "fps=12,scale=900:-1:flags=lanczos [x]; [x][1:v] paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" -y "${1}".gif)  2>/dev/null
if [ -e '~/palette.png' ]; then
  rm ~/palette.png
fi
