#!/bin/bash

set -e;

printf "# original "
rg '@generated|yeccpre\.hrl' --files-without-match $@ | xargs _build/release/bin/erlfmt --require-pragma | wc -l

for i in {70..120}; do
    >&2 echo "Processing $i"
    printf "$i "
    rg '@generated|yeccpre\.hrl' --files-without-match $@ | xargs _build/release/bin/erlfmt --print-width $i | wc -l
done
