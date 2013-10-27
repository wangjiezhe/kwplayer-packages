关于
====
这个项目用于存放kwplayer为个发行版打好了的安装包, 一般用户推荐直接这里的安装
包, 因为这最简单, 也最不易出问题.


Debian系
=========
deb包里已经默认加入了Debian软件库中不存在的软件包, 这是为了方便.

先下载kwplayer.deb, 如果安装了Gdebi等工具, 可以直接双击就能安装这个deb包;
当然, 也可以在终端里安装:

    # dpkg -i kwplayer.deb
    # apt-get -f install


Fedora系
========
Fedora 的打包工作是由Wang Jiezhe (@wangjiezhe) 负责. 目前只测试了Fedora19
和Fedora20-Alpha,其它版本正在测试中.

只需要下载这个rpm包就可以了. 安装的话: `# yum localinstall kwplayer-x.x.rpm`
升级的话: `# yum localupdate kwplayer-x.x.rpm`, 这样的话,
系统会自动处理软件包依赖问题. 使用时有遇到问题的, 请尽快反馈,
这样的话就可以很快修复问题.

未解决问题: Fedora20-ALpha 中无法播放mp4.
建议: Fedora20-Alpha用户如果有看mv的需要请暂时从源代码安装

源码包及打包脚本, 在build_rpm/里.


Arch Linux
==========
Arch Linux用户, 可以直接使用build_arch/PKGBUILD脚本来安装kwplayer, 它是由
MJsaka <qiuxuenan@gmail.com> 维护的. 使用时有什么问题, 可以直接联系他.
非常感谢他做的工作.
