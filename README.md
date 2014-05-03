关于
====
这个项目用于存放kwplayer为各个发行版打好了的安装包, 推荐一般用户直接使用
这里的安装包, 因为这最简单, 也最不易出问题.


Debian系
=========
deb包里已经默认加入了Debian软件库中不存在的软件包, 这是为了方便.

先下载kwplayer.deb, 如果安装了Gdebi等工具, 可以直接双击就能安装这个deb包;
当然, 也可以在终端里安装:

    # dpkg -i kwplayer.deb
    # apt-get -f install


Fedora系
========
Fedora 的打包工作是由Wang Jiezhe (@wangjiezhe) 负责. 目前测试成功了Fedora19
和Fedora20.

只需要下载这个rpm包就可以了. 安装的话: `# yum localinstall kwplayer-x.x.rpm`
升级的话: `# yum localupdate kwplayer-x.x.rpm`, 这样的话,
系统会自动处理软件包依赖问题. 使用时有遇到问题的, 请尽快反馈,
这样的话就可以很快修复问题.

打包脚本在build_rpm/里.

其他可选包:

* python3-plyvel
* [python3-mutagenx](https://github.com/LordSputnik/mutagen)
* [python3-xlib](https://github.com/LiuLang/python3-xlib)
* [python3-keybinder](https://github.com/LiuLang/python3-keybinder)



Arch Linux
==========
Arch Linux用户, 可以直接使用build_arch/PKGBUILD脚本来安装kwplayer, 它是由
MJsaka <qiuxuenan@gmail.com> 维护的. 使用时有什么问题, 可以直接联系他.
非常感谢他做的工作.

Gentoo
========
Gentoo的用户, 可下载build_gentoo下的ebuild, 放入本地的overlay, 执行
ebuild kwplayer-*.ebuild manifest, 然后通过emerge安装.
使用时有什么问题, 请联系 MJsaka <qiuxuenan@gmail.com> .
