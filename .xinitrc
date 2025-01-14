export GDK_SCALE=1
export GDK_DPI_SCALE=1

#export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export QT_SCALE_FACTOR=1

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# set background image
feh --bg-scale /home/eva/configurations/desktop/desktop.jpg &

# apps to start
picom &
exec dunst &
#dwmstatus 2>&1 >/dev/null &

# wm or de
#exec dwm
i3
#startplasma-x11
#startxfce4
