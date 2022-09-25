---
title: jdk安装
date: 2022-05-28 13:54:19
tags:
- Java
- 安装教程
- jdk
categories:
- 安装教程
isShowComments: false
---

<Boxx/>

本教程以安装**jdk1.8**为例，本教程使用的是oracle jdk

<!-- more -->

[[toc]]

# windows安装

## 一、 下载安装包,任选其一即可 注意是格式以exe结尾的

- [jdk1.8官方下载](https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html)

- [jdk-8u221 天翼网盘](https://cloud.189.cn/t/3euYRrRryEJr) 访问码：lmx8

- [各个版本分流jdk，推荐这个](https://injdk.cn/)

注: 
- 官方下载地址需要登录 账号：`1985479344@qq.com` 密码：`Oracle123`<br/>
   来源 https://www.cnblogs.com/withLevi/p/14628588.html
- 本文准备的天翼网盘下的包，是我之前从官网下载下来的，推荐使用天翼网盘，拒绝低速某度网盘
   天翼网盘免下载地址 `http://189.ly93.cc/`


## 二、开始安装
推荐安装在默认位置C:\Program Files\Java,

也可以安装再别处记得使jre安装目录与jdk一致即可，方便管理

本文的jdk和jre使用默认安装路径，安装完成之后如下图

![jdk安装完成后的目录结构](/znote/img/notes/jdk安装/jdk安装完成后的目录结构.png)


## 三、配置环境变量
### 方式一：脚本配置(推荐这个比较简单)
脚本中的 `D:\Program Files\Java\jdk1.8.0_221` 为你的jdk安装目录位置，根据自己的安装位置自行更改

[win10配置jdk环境变量.bat](https://zlhy7.lanzoul.com/ib0u2ng)
```shell
@echo off
echo === 准备设置环境变量: JAVA_HOME  === 
setx /M JAVA_HOME "D:\Program Files\Java\jdk1.8.0_221"
echo === 准备设置环境变量: CLASSPATH 
setx /M CLASSPATH ".;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar"
echo === 准备设置环境变量: Path  === 
setx /M Path "%Path%;%%JAVA_HOME%%\bin"
echo === 请按任意键退出! 
pause
```
### 方式二：手动配置
1. 自行百度 **jdk1.8环境变量配置**，或者参考下面我找的一个博文

2. [jdk1.8环境变量配置](https://www.cnblogs.com/nojacky/p/9497724.html)

---
## 四、检验是否安装完毕
打开cmd，输入 java -version，出现下图代表环境配置成功
![查看jdk版本](/znote/img/notes/jdk安装/查看jdk版本.png)

# linux安装

## 一、 下载安装包,任选其一即可 注意是格式以tar.gz结尾的

- [jdk1.8官方下载](https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html)

- [jdk-8u221 天翼网盘](https://cloud.189.cn/t/IBFf2qiqau2m) 访问码：rol2

- [各个版本分流jdk，推荐这个](https://injdk.cn/)

注: 

- 官方下载地址需要登录 账号：`1985479344@qq.com` 密码：`Oracle123`<br/>
  来源 https://www.cnblogs.com/withLevi/p/14628588.html
- 本文准备的天翼网盘下的包，是我之前从官网下载下来的，推荐使用天翼网盘，拒绝低速某度网盘
  天翼网盘免下载地址 `http://189.ly93.cc/`


## 二、开始安装

上传安装包到linux服务器目录，这里我上传到`/usr/local/`,并解压该文件

切换目录到jdk压缩包所在目录
> cd /usr/local/

解压文件
> tar -zxvf jdk-8u221-linux-x64.tar.gz

![](/znote/img/notes/jdk安装/1.上传jdk压缩包到指定位置.png)

![](/znote/img/notes/jdk安装/2.解压文件.png)

## 三、配置环境变量

编辑配置文件
> vi /etc/profile

```shell
# java环境变量
export JAVA_HOME=/usr/local/jdk1.8.0_221
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
```
![](/znote/img/notes/jdk安装/3.配置环境变量.png)
## 四、刷新环境变量，并检验是否安装完毕

刷新环境变量
> source /etc/profile

输入 java -version，出现下图代表环境配置成功
![](/znote/img/notes/jdk安装/4.验证jdk环境配置完成.png)