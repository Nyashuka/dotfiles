export XDG_CURRENT_DESKTOP=KDE
export XDG_SESSION_TYPE=x11

export GDK_SCALE=1
export GDK_DPI_SCALE=1

#export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export QT_SCALE_FACTOR=1

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
feh --bg-scale /home/eva/configurations/desktop/desktop.jpg &
picom &

exec dunst &

dwmstatus 2>&1 >/dev/null &
exec dwm
