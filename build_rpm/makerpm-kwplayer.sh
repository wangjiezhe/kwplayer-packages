#!/bin/bash
# This shell script is used to build rpm for kwplayer
# Released by wangjiezhe <wangjiezhe@gmail.com>

if [ $# -ne 2 ]
then
	echo "Usage: `basename $0` release-number version"
	exit 1
fi

release=`echo $1 | sed 's/\-/\./g'`
version=$2

# Replace these variables by your pathes
GIT=~/Downloads/github/wangjiezhe/kwplayer
DEST=~/Downloads/github/wangjiezhe/kwplayer-packages

SOURCES=~/rpmbuild/SOURCES
SPECS=~/rpmbuild/SPECS
RPMS=~/rpmbuild/RPMS/noarch

mkdir -p $SOURCES/kwplayer-$release
cd $GIT/
cp -vr HISTORY LICENSE README.md setup.py kwplayer kuwo po share $SOURCES/kwplayer-$release
# rm -rf $SOURCES/kwplayer-$release/kuwo/__pycache__/

cd $SOURCES/
tar -cvzf kwplayer-"$release".tar.gz kwplayer-$release
rm -rf kwplayer-$release

cd $SPECS/
sed -i -e '/^Version/s/[0-9]+\.[0-9]+\.[0.9]+/$version/' kwplayer.spec
sed -i -e '/^Release/s/[0-9]+/$release/' kwplayer.spec
rpmbuild -ba kwplayer.spec
cp kwplayer.spec $DEST/build_rpm/

cd $RPMS/
cp kwplayer-"$release"-"$version".fc20.noarch.rpm $DEST/
