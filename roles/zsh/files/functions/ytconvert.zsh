
ytconvert() {
        ffmpeg -i "$1" -c:v libx264 -crf 18 -preset slow -pix_fmt yuv420p -c:a copy "$2.mkv"
}