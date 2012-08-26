#!/bin/sh
# Usage: colordump
# Dump 256 ansi colors to the terminal.

printf "How each ANSI color is displayed on your terminal:\n\n"

i=0
row=0
while [ $i -lt 255 ];
do
    newrow=$(expr $i / 10)
    test $newrow -ne $row && printf "\n"
    row=$newrow
    printf "\e[%dm %03d \e[0m" $i $i
    i=$(expr $i + 1)
done

printf '\n\n     e.g., "\\e[41mTEXT\\e[0m" '
printf "\e[41m(for TEXT like this)\e[0m\n"
