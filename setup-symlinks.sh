#!/bin/bash -x

CUR_DIR="$(pwd)"
SYMLINK_SOURCE_DIR="$1"

if [ ! -d "$SYMLINK_SOURCE_DIR" ]; then
    exit 1
fi

cd $SYMLINK_SOURCE_DIR

for i in `find . -type l`; do
    if [ -e "${CUR_DIR}/${i}" ]; then
        continue
    fi
    ln -sf $(realpath ${i}) ${CUR_DIR}/${i}
done
