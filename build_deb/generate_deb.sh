#!/bin/sh

# Copyright (C) 2013 LiuLang <gsushzhsosgsu@gmail.com>

# Use of this source code is governed by GPLv3 license that can be found
# in the LICENSE file.

# Generate deb package from source.
# 1.3 - 2013.12.7
# update version automatically
# 1.2 - 2013.10.17
# move deb package to upper folder
# v1.1 - 2013.10.3
# move deb package to ../bin
# v1.0 -2013.9.4
# project inited.

usage() {
	echo "$0"
	echo 'This program need root permission'
}


DIR="fakeroot/"
PACKAGE=$(sed -n '/Package:/p' control | awk '{print $2}')
VERSION=$(sed -n '/Version:/p' control | awk '{print $2}')
DEB="${PACKAGE}-${VERSION}.deb"
if [ ! -d $DIR ]; then
	echo 'Error: no such directory!!!'
	usage
	exit 1
fi

cd $DIR
chown -R root:root .
find usr -type f | xargs chmod a+r
find usr -type d | xargs chmod a+rx
echo 'Permissions of files and folders in usr/ updated..'
find usr/bin -type f | xargs chmod a+x
echo 'All files in ./usr/bin executable..'

find usr -type f | xargs md5sum > DEBIAN/md5sums
echo 'MD5sums updated...'

find DEBIAN -type f | xargs chmod a+r
find DEBIAN -type d | xargs chmod a+rx
echo 'Permissions of files and folders in DEBIAN/ updated..'

cd ../

dpkg -b $DIR $DEB
echo 'DEB generated...'

rm -rf $DIR
echo "$DIR cleaned"

# That DEB package needs to be chowned to current user.
OWNER=$(stat -c%u "$0")
GROUP=$(stat -c%g "$0")
chown $OWNER:$GROUP $DEB
echo 'file owner and group owner changed..'

mv -vf $DEB ..
