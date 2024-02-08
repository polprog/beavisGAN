#!/bin/bash


if [ $# -lt 2 ]; then echo "$0 in_dir out_dir"; exit 1; fi

STRIP_PREFIX="BEAVIS_AND_BUTTHEAD_"
RATE="1/5"
SEEK="00:00:10.00"

input_dir="$1"
output_dir="$2"

for i in "$input_dir/"*D1*; do
    prefix=${i/"$STRIP_PREFIX"/}
    prefix=${prefix/"$1"/}
    prefix=$output_dir$prefix
    ffmpeg -i "$i" -r $RATE -ss $SEEK "${prefix}_%04d.png"
done
