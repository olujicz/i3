#!/bin/sh

#multiple screen setup
# [ -e ~/.screen_setup ] && source ~/.screen_setup

unclutter -root -visible &
# xautolock -time 10 -locker ~/.i3/bin/i3lock-wrapper &
xautolock -time 10 -locker slock &

#dbus instance
eval `dbus-launch --sh-syntax --exit-with-session`

start-pulseaudio-x11 &
rofi -key mod1+Tab -font "snap-12" -bc "#dcdccc" -fg "#dcdccc" -bg "#484848" -hlfg "#fff" -hlbg "#333333" -o 90 -term "rofi-term" &

#color temperature adjustment
redshift -l 54.35:18.65 -m randr -t 5500:4500 -g 0.75:0.75:0.75 &

#disks automounting
# udiskie &

#creating gpg agent
GPG_ENVFILE="$HOME/.gnupg/gpg-agent.env"
if [ -x $(which gpg-agent) ]; then
    eval "$(gpg-agent --enable-ssh-support --daemon --write-env-file "$GPG_ENVFILE")"
    export GPG_AGENT_INFO
fi

compton --config ~/.i3/compton.conf &

dunst & #notification
setxkbmap -option compose:rwin,lv3:ralt_switch,grp:alt_shift_toggle,grp_led:scroll rs,us latinyz, &
setxkbmap -option ctrl:nocaps &
xfce-power-manager &

#getting rid of gpg agent
[ -x $(which gpg-agent) ] && kill $(grep GPG_AGENT_INFO "$GPG_ENVFILE" | cut -d: -f 2) 2>/dev/null

true
