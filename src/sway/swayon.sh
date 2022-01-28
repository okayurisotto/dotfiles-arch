export GDK_DPI_SCALE='1.5'
export QT_SCALE_FACTOR='1.5'
export WINIT_UNIX_BACKEND='x11'

swayidle -w \
  timeout 300 'swaylock' \
  before-sleep 'swaylock'

fcitx5 -rd &
mako &

sway
