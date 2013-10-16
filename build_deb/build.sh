#!/bin/sh

# Copyright (C) 2013 LiuLang <gsushzhsosgsu@gmail.com>

# Use of this source code is governed by GPLv3 license that can be found
# in the LICENSE file.

# v1.1 - 2013.10.17
# use $1 add source dir
# v1.0 - 2013.9.22
# project inited.

SRC="$1"

if [ -d 'fakeroot' ]; then
	rm -rvf fakeroot
fi

PYLIB='fakeroot/usr/lib/python3/dist-packages/'
APP='kwplayer'

mkdir -vp fakeroot/usr/bin fakeroot/DEBIAN $PYLIB

cp -v "$SRC"/kwplayer fakeroot/usr/bin/
cp -rvf "$SRC"/kuwo $PYLIB/
rm -rvf $PYLIB/kuwo/__pycache__
cp -rvf "$SRC"/share fakeroot/usr/share
cp -vf control fakeroot/DEBIAN/
