#!/usr/bin/env bash
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)
ups=$((pac + aur))

if [[ "$ups" != "0" ]]; then
    echo "  $pac / $aur"
else
    echo " no updates"
fi
