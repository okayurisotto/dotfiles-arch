enable_hist=0
enable_search_hist=0
is_loop=1
show_thumbnails=0

audio_player() {
  mpv --loop=inf --no-video "$@"
}

video_player() {
  mpv --loop=inf "$@"
}
