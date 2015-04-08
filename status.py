# -*- coding: utf-8 -*-
from i3pystatus import Status
import platform

status = Status(standalone=True)

hostname = platform.node()
laptop = "oluja-probook"
activcol = "#303030"
inactivcol = "#AAAAAA"
warncol = "#CC0000"

status.register(
    "clock",
    format="%a %-d %b %X",
    color=activcol
)

if hostname == laptop:
    status.register(
        "pulseaudio",
        format="♪{volume}",
    )
else:
    status.register(
        "alsa",
        color=activcol,
        color_muted=inactivcol,
        format="♪{volume}",
    )

if hostname == laptop:
    status.register(
        "battery",
        format="{status} {remaining:%E%hh:%Mm} \[{percentage:.0f}%\]",
        color=activcol,
        alert=False,
        alert_percentage=5,
        status={
            "DIS": "Discharging:",
            "CHR": "Charging:",
            "FULL": "Battery",
        }
    )

status.register(
    "network",
    interface="eth0",
    format_up="{v4cidr}",
    color_down=inactivcol,
    color_up=activcol
)

if hostname == laptop:
    status.register(
        "wireless",
        interface="wlan0",
        color_up=activcol,
        color_down=inactivcol,
        format_up="{essid} {quality:03.0f}%"
    )

status.register(
    "mem",
    divisor=1073741824,
    color=activcol,
    warn_percentage=75,
    alert_percentage=90,
    format="RAM {used_mem:.1f}G[{percent_used_mem}%]"
)

status.register(
    "temp",
    format="{temp:.0f}°C",
    color=activcol
)

status.register(
    "mpd",
    format="MPD ♪{volume}: {status} {title}{artist} ",
    host='192.168.0.30',
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    }
)

status.run()
