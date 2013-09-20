#!/bin/sh
make prefix=/usr/local \
    CC=clang \
    USE_LIBPCRE=YesPlease \
    NO_GETTEXT=YesPlease \
    install -j2 && \
    make quick-install-doc
