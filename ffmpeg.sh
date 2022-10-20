#!/bin/bash

ffmpeg_rotate_counterclock_90() {
  ffmpeg -i $1 -vf "transpose=2" -acodec copy -vcodec h264 -crf 23 $2
}

