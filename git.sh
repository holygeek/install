#!/bin/sh
make prefix=/usr/local \
    CC=clang \
    USE_LIBPCRE=YesPlease \
    NO_GETTEXT=YesPlease \
    install -j2 && \
    make prefix=/usr/local quick-install-doc
