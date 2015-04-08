#!/bin/bash

I3_ROOT_DIR="$(readlink -f $(dirname $0)/..)"

rm -rf ~/.i3
rm -rf ~/.gtkrc-2.0
rm -rf ~/.fehbg
rm -rf ~/.config/dunst

mkdir ~/.config/dunst

ln -s "${I3_ROOT_DIR}/" ~/.i3
ln -s "${I3_ROOT_DIR}/gtkrc-2.0" ~/.gtkrc-2.0
ln -s "${I3_ROOT_DIR}/fehbg" ~/.fehbg
ln -s "${I3_ROOT_DIR}/dunstrc" ~/.config/dunst/dunstrc
