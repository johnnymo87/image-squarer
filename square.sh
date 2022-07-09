#!/bin/bash

set -euo pipefail

outdir=squares
mkdir -p $outdir

for image in $(find . -name '*.jpg')
do
  echo "Squaring $image..."
  # https://legacy.imagemagick.org/Usage/thumbnails/#square
  convert $image \
          \( +clone -rotate 90 +clone -mosaic +level-colors white \) \
          +swap -gravity center -composite $outdir/$image
done
echo "Done"
