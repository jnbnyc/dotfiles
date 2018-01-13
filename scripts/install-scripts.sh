#!/usr/bin/env bash

usrbin_dir=${HOME}/bin
scripts_dir=$(pwd)

[ -d "$usrbin_dir" ] || mkdir -pv $usrbin_dir


scripts_list=$(find $scripts_dir -type f -name "*.sh")

for each in $scripts_list; do
  script_exec=$(basename $each| sed 's@.sh@@g')
  [ -f $usrbin_dir/$script_exec ] || ln -sv $each $usrbin_dir/${script_exec}
done

rm -v $usrbin_dir/install-scripts
