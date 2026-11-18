#!/bin/bash
# usage: stopmo.sh in.mp4 out.mp4  -> steady film look: native frame rate, no jitter, soft grain, warm grade, vignette
IN=$1; OUT=$2
ffmpeg -v error -y -i "$IN" -filter_complex "\
[0:v]eq=contrast=0.96:saturation=0.9:gamma=1.02,\
colorchannelmixer=rr=1.03:bb=0.95,\
noise=alls=7:allf=t,\
vignette=PI/5[v]" -map "[v]" -an -c:v libx264 -crf 26 -preset slow -pix_fmt yuv420p -movflags +faststart "$OUT"
