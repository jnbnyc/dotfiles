#!/usr/bin/env bash

desktop_dir=${HOME}/Desktop
screenshots_dir=$desktop_dir/screenshots/$(date +%F)
[ -d "$screenshots_dir" ] || mkdir -pv $screenshots_dir

find $desktop_dir -maxdepth 1 -type f -name "Screen*png" -exec mv -v {} $screenshots_dir \;

echo "Done cleaning"
