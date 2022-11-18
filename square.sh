#!/bin/bash

set -euo pipefail

# Handle spaces in path and file names.
# https://unix.stackexchange.com/a/9499
IFS=$'\n'

# Make sure we've been called with an indir
# https://stackoverflow.com/a/3945952
if [ $# -ne 1 ]; then
  echo "Must be called with the path to the images!"
  exit 2
fi
indir=$1

pushd $indir

outdir=squares
mkdir -p $outdir

for image in $(find . -name '*.jpg' -o -name '*.png')
do
  echo "Squaring $image..."
  # https://legacy.imagemagick.org/Usage/thumbnails/#square
  convert $image \
          \( +clone -rotate 90 +clone -mosaic +level-colors white \) \
          +swap -gravity center -composite $outdir/$image
done

popd

echo "Done"
