#!/bin/sh

# Copyright (C) 2013 LiuLang <gsushzhsosgsu@gmail.com>

# Use of this source code is governed by GPLv3 license that can be found
# in the LICENSE file.

# v1.3 - 2013.12.6
# Fixed: Installed-Size is not compatibal to new Debian Package policy.
# v1.2 - 2013.10.21
# add other python3 libs
# v1.1 - 2013.10.17
# use $1 add source dir
# v1.0 - 2013.9.22
# project inited.

SRC="../.."
KW_SRC="$SRC/kuwomusic"
MUT_SRC="$SRC/mutagen/mutagen"
XLIB_SRC="$SRC/python3-xlib/Xlib"
KEYBIND_SRC="$SRC/python3-keybinder/keybinder"

if [ -d 'fakeroot' ]; then
	rm -rvf fakeroot
fi

PYLIB='fakeroot/usr/lib/python3/dist-packages/'

mkdir -vp fakeroot/usr/bin fakeroot/DEBIAN $PYLIB

cp -v "$KW_SRC/kwplayer" fakeroot/usr/bin/
cp -rvf "$KW_SRC/kuwo" $PYLIB/
cp -rvf "$MUT_SRC" $PYLIB/
cp -rvf "$XLIB_SRC" $PYLIB/
cp -rvf "$KEYBIND_SRC" $PYLIB/
cp -rvf "$KW_SRC/share" fakeroot/usr/share
find fakeroot -type d -iname '__pycache__' | xargs rm -rf

# Update package size.
usrSize=$(du -s fakeroot/usr | awk '{print $1}')
sed -i "s/Installed-Sized: .*$/Installed-Size: $usrSize/" control
cp -vf control fakeroot/DEBIAN/
