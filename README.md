关于
====
这个项目用于存放kwplayer为各个发行版打好了的安装包, 推荐一般用户直接使用
这里的安装包, 因为这最简单, 也最不易出问题.

自动安装
=======
一般用户请直接下载与你使用发行版相对应的安装包, 参考相应的说明来安装.
有特殊需要的用户请参考 "手动安装"部分.

Debian系
--------
deb包里已经默认加入了Debian软件库中不存在的软件包, 这是为了方便.

先下载kwplayer.deb, 如果安装了Gdebi等工具, 可以直接双击就能安装这个deb包;
当然, 也可以在终端里安装:

    # dpkg -i kwplayer.deb
    # apt-get -f install


Fedora系
--------
Fedora 的打包工作是由 Wang Jiezhe (@wangjiezhe) 负责.

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
----------
Arch Linux用户, 可以直接使用build_arch/PKGBUILD脚本来安装kwplayer, 它是由
MJsaka <qiuxuenan@gmail.com> 维护的. 使用时有什么问题, 可以直接联系他.
非常感谢他做的工作.


Gentoo
------
Gentoo的用户, 可下载build_gentoo下的ebuild, 放入本地的overlay, 执行
`ebuild kwplayer-*.ebuild manifest`, 然后`emerge kwplayer`安装. 
也可以直接下载tbz2包放入${PKGDIR}里, 然后`emerge -k kwplayer`安装.
使用时有什么问题, 请联系 MJsaka <qiuxuenan@gmail.com> .


手动安装
========
手动安装分两部分, 一是安装kwplayer的依赖包, 二是安装kwplayer. 有太多linux
发行版, 这里只以四个主要的发行版为例来说明.


Debian 中手动安装依赖包
----------------------
手动安装的话, 需要手动安装一些依赖包, 以Debian sid中安装为例, 它们是:

* python3 - 推荐python3.3以上的版本, 不然mutagen模块无法使用(用于消除mp3/ape乱码的).
* gnome-icon-theme-symbolic
* python3-dbus
* python3-gi  -  gkt3的python3绑定(Fedora中叫做python3-gobject);
* gstreamer1.0-plugins-base
* gstreamer1.0-plugins-good
* gstreamer1.0-plugins-ugly
* gstreamer1.0-libav 音频/视频的解码器
* gstreamer1.0-x
* gir1.2-gstreamer-1.0,
* gir1.2-gst-plugins-base-1.0
* gir1.2-notify-0.7 - notify 的Gtk绑定.
* gstreamer1.0-pulseaudio
* leveldb - 强大的NoSQL数据库(用于缓存数据);
* python3-leveldb  -  leveldb的python3绑定(Fedora中是python3-plyvel);
Ubuntu 12.04中缺少了这个包, 请使用`# pip3 install plyvel` 来安装, 安装时需要
优先安装python3-dev, libleveldb-dev这两个头文件.
* mutagen - 这个需要手动安装. 可以在这里下载:
<https://github.com/LordSputnik/mutagen>, 如果你没有python3.3 比如Debian
Wheezy, Ubuntu 12.04, 就不需要安装这个模块了, 因为它不支持python3.2以下的
版本. `# pip3 install mutagen`
* python3-xlib - X的底层接口, 这个是从python-xlib迁移过来的, 刚刚完成.
可以在这里找到<https://github.com/LiuLang/python3-xlib>,
`# pip3 install python3-xlib`
* python3-keybinder 这个是用于绑定全局快捷键.
<https://github.com/LiuLang/python3-keybinder>
`# pip3 install python3-keybinder`

上面是gstreamer1.0的, 对于旧的gstreamer0.10版, 需要大致修改一下.

[注]: pip3是python3-pip包提供的命令, 它是python3的一个包管理器, 可以自动安装
更新, 卸载python3的模块包, 相录于debian中的dpkg. 有些系统(比如Arch Linux),
已经将python3作为了默认的python环境, 所以只需要用pip命令就可以了.

Fedora 中手动安装依赖包
-----------------------
对于Fedora, 我专门安装并测试了Fedora 19 amd64, 也很简单, 需要这些操作:

* 更新系统. 我用的是mirrors.163.com这个更新源, 速度很好.
* 使用rpmfushion, 可以参考这篇文章:<http://blog.csdn.net/sabalol/article/details/9286073>
* python3-dbus
* gstreamer1-plugins-good
* gstreamer1-plugins-ugly
* gstreamer1-libav
* 安装leveldb 和 python3-plyvel
* 安装python3-mutagenx.
* 安装python3-xlib 和 python3-keybinder

在Arch 中手动安装依赖包
-----------------------
@mindcat为arch写的pkgbuild, 使用了github上的最新的代码:
<https://aur.archlinux.org/packages/kwplayer-git/?setlang=en>
而@shmilee 写的另一个pkgbuild, 是基于kwplayer的发行版本, 可以在这里得到:
<0https://aur.archlinux.org/packages/kwplayer/>

[注:] arch中, 默认的python版本是python3.

* python-dbus
* gst-plugins-base 根据@mindcat的测试补充进来的
* gst-plugins-good | gstreamer.01.0-good-plugins
* gst-plugins-ugly | gstremaer0.10-ugly-plugins
* gst-libav
* gstreamer | gstreamer0.10
* python-gobject
* leveldb
* py-leveldb | plyvel 这两个任选一个, 它们分别由不同的团队在维护:
<http://code.google.com/p/py-leveldb/> 和
<https://github.com/wbolster/plyvel>
比如, 可以: `# pip install plyvel`
* gnome-icon-theme-symbolic-git
* python3-mutagenx - ` # pip install mutagenx`
* python3-xlib - `# pip install python3-xlib`
* python3-keybinder - `# pip install python3-keybinder`


Gentoo 中手动安装依赖包
-----------------------
没条件测试, 如果有哪位gentoo的朋友写了ebuild, 请一定分享出来, 以方便其他朋友使用;

安装kwplayer
------------
按照上面的方法安装好依赖包之后, 就可以开始安装kwplayer本身了.

* 安装: `# pip3 install kwplayer`
* 更新: `# pip3 install --upgrade kwplayer`
