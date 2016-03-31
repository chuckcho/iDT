#!/usr/bin/env bash

VIDEODIR=/media/6TB/Videos/dextro-benchmark2
for f in `ls -S ${VIDEODIR}/*.mp4 | tac`
do
  EXT="${f##*.}"
  FILENOEXT="${f%.*}"
  FEATUREFILE=${FILENOEXT}.features.gz
  echo "Processing $f file..."
  ./release/DenseTrackStab $f | gzip > ${FEATUREFILE}
done
