#!/bin/bash


line=$(pactl list sinks | grep '^\s*Volume' | tail -n 1)
echo "$line" | sed  's/.* \([0-9][0-9]*\)%.*/\1%/'
