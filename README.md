关于
====
这个项目用于存放kwplayer为各个发行版打好了的安装包, 推荐一般用户直接使用
这里的安装包, 因为这最简单, 也最不易出问题.


Debian系
=======
需要下载 python3-xlib_xx.deb, python3-keybinder_xx.deb, kwplayer_xx.deb 这
三个软件包. 直接双击就能安装deb包.

先安装python3-xlib, 之后是python3-keybinder, 最后是kwplayer.

当然, 也可以在终端里安装, 比如:

    # dpkg -i kwplayer_xx.deb
    # apt-get -f install


Fedora系
=======
Fedora 的打包工作是由 mosquito (@1dot75cm) 负责. 目前支持 fc19, fc20, fc21, fc22.
更多其他开源软件欢迎访问 [myrepo](https://copr.fedoraproject.org/coprs/mosquito/myrepo/) 主页进行查询.

*安装步骤:*

	# yum install dnf-plugins-core
	# dnf copr enable mosquito/myrepo    # 或直接到 myrepo 源主页, 下载对应 repo 文件到 /etc/yum.repos.d/ 中
	# dnf localinstall http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
	# dnf install kwplayer

**注: 因为有几个依赖包不在官方源内, 请添加 rpmfusion 源和 myrepo 源, 否则直接安装 rpm 包会出错**


RHEL系
======
RHEL 的打包工作也由 mosquito 负责. 目前支持 el7.
更多其他开源软件欢迎访问 [myrepo](https://copr.fedoraproject.org/coprs/mosquito/myrepo/) 主页进行查询.

*安装步骤:*

	# yum install epel-release
	# yum-config-manager --add-repo=https://copr.fedoraproject.org/coprs/mosquito/myrepo/repo/epel-$(rpm -E %?rhel)/mosquito-myrepo-epel-$(rpm -E %?rhel).repo
	# yum localinstall http://li.nux.ro/download/nux/dextop/el$(rpm -E %rhel)/x86_64/nux-dextop-release-0-2.el$(rpm -E %rhel).nux.noarch.rpm
	# yum install kwplayer


Arch Linux
==========
Arch Linux用户, 可以直接使用build_arch/PKGBUILD脚本来安装kwplayer, 它是由
MJsaka <qiuxuenan@gmail.com> 维护的. 使用时有什么问题, 可以直接联系他.
非常感谢他做的工作.


Gentoo
======
Gentoo的用户, 可下载build_gentoo下的ebuild, 放入本地的overlay, 执行
`ebuild kwplayer-*.ebuild manifest`, 然后`emerge kwplayer`安装. 
也可以直接下载tbz2包放入${PKGDIR}里, 然后`emerge -k kwplayer`安装.
使用时有什么问题, 请联系 MJsaka <qiuxuenan@gmail.com> .


打包时要包含的依赖包
===================
在制作一个发行版里的安装包时, 要包含以下依赖包. 不同发行版里的包名可能不尽相同:

* gnome-icon-theme-symbolic
* gstreamer1.0-libav 音频/视频的解码器
* gstreamer1.0-plugins-base
* gstreamer1.0-plugins-good
* gstreamer1.0-plugins-ugly
* gstreamer1.0-pulseaudio
* gstreamer1.0-x
* gir1.2-gstreamer-1.0,
* gir1.2-gst-plugins-base-1.0
* gir1.2-notify-0.7 - notify 的Gtk绑定.
* python3 
* python3-cairo
* python3-dbus
* python3-gi  -  gkt3的python3绑定
* python3-gi-cairo
* python3-ply - Lex, Yacc的python3实现, kwplayer用它来解析歌词

可选安装包, 安装它们后, kwplayer的功能更完善:

* mutagen - https://github.com/LordSputnik/mutagen, kwplayer用它来转化mp3标签
编码
* python3-xlib - https://github.com/LiuLang/python3-xlib, X的底层接口, 这个是从python-xlib迁移过来的, python3-keybinder需要这个包
* python3-keybinder https://github.com/LiuLang/python3-keybinder, 用于绑定
全局快捷键
* leveldb - 强大的NoSQL数据库(用于缓存数据), kwplayer用它来缓存列表
* python3-leveldb  -  leveldb的python3绑定
