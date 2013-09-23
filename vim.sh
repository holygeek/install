#!/bin/sh
CC=clang ./configure \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --prefix=${1:-/usr/local} \
    --with-x \
    --with-features=huge &&
make -f Makefile -j3 install &&
echo SUCCESS
