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
==========
Arch Linux用户, 可以直接使用build_arch/PKGBUILD脚本来安装kwplayer, 它是由
MJsaka <qiuxuenan@gmail.com> 维护的. 使用时有什么问题, 可以直接联系他.
非常感谢他做的工作.

Gentoo
========
Gentoo的用户, 可下载build_gentoo下的ebuild, 放入本地的overlay, 执行
`ebuild kwplayer-*.ebuild manifest`, 然后`emerge kwplayer`安装. 
也可以直接下载tbz2包放入${PKGDIR}里, 然后`emerge -k kwplayer`安装.
使用时有什么问题, 请联系 MJsaka <qiuxuenan@gmail.com> .
