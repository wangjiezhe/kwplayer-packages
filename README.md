关于
====
这个项目用于存放kwplayer为各个发行版打好了的安装包, 推荐一般用户直接使用
这里的安装包, 因为这最简单, 也最不易出问题.

Debian系
=======
deb包里已经默认加入了Debian软件库中不存在的软件包, 比如python3-keybinder.

先下载kwplayer.deb, 可以直接双击就能安装这个deb包. 当然, 也可以在终端里安装:

    # dpkg -i kwplayer.deb
    # apt-get -f install


Fedora系
=======
Fedora 的打包工作是由 Wang Jiezhe (@wangjiezhe) 负责.

首先要安装好rpmfushion, 可以参考这篇文章:<http://blog.csdn.net/sabalol/article/details/9286073>

**建议安装方式:**

使用 dnf 并安装 dnf-plugins-core, 然后直接运行:

	# dnf copr enable wangjiezhe/kwplayer
	# dnf install kwplayer

即可.

或者直接到 <http://copr.fedoraproject.org/coprs/wangjiezhe/kwplayer/> 下载对应的
repo 文件放到 /etc/yum.repos.d/ 中, 然后运行

	# yum install kwplayer

**注: 因为有几个依赖包不在官方源内, 请使用上面的 repo 文件, 否则直接安装 rpm 包可能会出错**


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
