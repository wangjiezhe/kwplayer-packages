#!/bin/bash
# This shell script is used to build rpm for kwplayer
# Released by wangjiezhe <wangjiezhe@gmail.com>

if [ $# -ne 2 ]
then
	echo "Usage: `basename $0` version release"
	exit 1
fi

version=`echo $1 | sed "s/-/./g"`
release=$2

# Replace these variables by your pathes
GIT=~/Downloads/github/wangjiezhe/kwplayer
DEST=~/Downloads/github/wangjiezhe/kwplayer-packages

SOURCES=~/rpmbuild/SOURCES
SPECS=~/rpmbuild/SPECS
RPMS=~/rpmbuild/RPMS/noarch

mkdir -p $SOURCES/kwplayer-"$version"
cd $GIT/
cp -vr HISTORY LICENSE README.md setup.py kwplayer kuwo po share $SOURCES/kwplayer-"$version"
# rm -rf $SOURCES/kwplayer-$version/kuwo/__pycache__/

cd $SOURCES/
tar -cvzf kwplayer-"$version".tar.gz kwplayer-"$version"
rm -rf kwplayer-"$version"

cd $SPECS/
sed -i -e "/^Version/s/[0-9]\+\.[0-9]\+\.[0-9]\+/$version/" kwplayer.spec
sed -i -e "/^Release/s/[0-9]\+/$release/" kwplayer.spec
rpmbuild -ba kwplayer.spec
cp kwplayer.spec $DEST/build_rpm/
cp makerpm-kwplayer.sh $DEST/build_rpm/

cd $RPMS/
cp kwplayer-"$version"-"$release".fc20.noarch.rpm $DEST/
