# INPUT=".gif"
# OUTPUT=".webm"
ffmpeg -i $INPUT -c:v libvpx-vp9 -b:v 0 -crf 40 $OUTPUT
