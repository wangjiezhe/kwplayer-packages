#!/bin/bash
# This shell script is used to build rpm for kwplayer
# Released by wangjiezhe <wangjiezhe@gmail.com>

if [ $# -ne 1 ]
then
	echo "Usage: `basename $0` release-number"
	exit 1
fi

release=$1
# sed -i 's/\-/\./g' $release

# replace these variables by your pathes
GIT=~/Downloads/github/wangjiezhe/kwplayer
SOURCES=~/rpmbuild/SOURCES
SPECS=~/rpmbuild/SPECS


mkdir -p $SOURCES/kwplayer-$release
cd $GIT/
cp -vr HISTORY LICENSE README.md setup.py kwplayer kuwo po share $SOURCES/kwplayer-$release
rm -rf $SOURCES/kwplayer-$release/kuwo/__pycache__/

cd $SOURCES/
tar -cvzf kwplayer-"$release".tar.gz kwplayer-$release
rm -rf kwplayer-$release

cd $SPECS/
rpmbuild -ba kwplayer.spec

