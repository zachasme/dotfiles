#!/usr/bin/env bash

expected=$(cat pacmanfile | grep -o '^[^#]*' | sort)
actual=$(pacman -Qqe | sort)

echo "# Missing packages"
comm -23 <(echo "$expected") <(echo "$actual")
echo ""
echo "# Extra packages"
comm -13 <(echo "$expected") <(echo "$actual") 

