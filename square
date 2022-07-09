#!/bin/bash

set -euo pipefail

outdir=squares
mkdir -p $outdir

for i in $(find . -name '*.jpg')
do
  echo "Squaring $i..."
  # https://legacy.imagemagick.org/Usage/thumbnails/#square
  convert $IMAGE \
          \( +clone -rotate 90 +clone -mosaic +level-colors white \) \
          +swap -gravity center -composite $outdir/$i
done
echo "Done"
