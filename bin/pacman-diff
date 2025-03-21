#!/usr/bin/env bash

PACMANFILE=${1:-~/pacmanfile}

EXPECTED=$(cat "$PACMANFILE" | sed "/^\s*#/d;s/\s*#[^\"']*$//" | sort)
ACTUAL=$(pacman -Qqe | sort)

echo "# Extra packages"
comm -13 <(echo "$EXPECTED") <(echo "$ACTUAL") 
echo ""
echo "# Missing packages"
comm -23 <(echo "$EXPECTED") <(echo "$ACTUAL")
