# !/bin/bash

while true 
do
    clear
    xdotool mousemove_relative 0-360 1
    fortune | cowsay -f tux
    sleep 10
done
