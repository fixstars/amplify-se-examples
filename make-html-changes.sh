#!/bin/bash -eu

for NBPATH in $(git diff --name-only HEAD^..HEAD | grep '.ipynb'); do
    DIR=html/$(echo ${NBPATH} | cut -d / -f 2-3)/
    OUTPUT=$(jupyter nbconvert --execute --embed-images --output-dir=$DIR --to html "$NBPATH")
    if [ -n "$OUTPUT" ]; then
        echo "[NbConvertApp] Converting notebook $NBPATH to html" 1>&2
        echo "$OUTPUT" 1>&2
    fi
done