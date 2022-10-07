---
title: linux安装mwget
date: 2022-10-07 20:07:14
tags:
- linux
- 安装教程
- mwget
categories:
- 安装教程
isShowComments: false
---

<Boxx/>

本教程使用的linux是Centos7

<!-- more -->

[[toc]]


## 1. 下载源码
```shell
git clone https://github.com/rayylee/mwget.git
```

## 2. 编译
```shell
cd mwget;./configure
```
### 2.1 如果报错了，执行安装intltool
```shell
yum install -y intltool
```
![安装intltool.png](/znote/img/notes/mwget/安装intltool.png)

## 3. 安装
```shell
make && make install
```
## 4. 验证是否安装正确,出现下图则正常
```shell
mwget -version
```
![mgwet安装后验证版本](/znote/img/notes/mwget/mgwet安装后验证版本.png)

## 5. 简单使用
mwget 下载地址,例如下载nginx
```shell
mwget https://mirrors.huaweicloud.com/nginx/nginx-1.21.1.tar.gz
```
### 5.1 参数含义
```shell
mwget --help
```

```
GNU MWget 0.1.0 ，一个非交互式多线程可移植的网络文件下载工具。
用法： mwget [选项]....[URL]
选项：
  -b,  --debug          调试模式，显示调试信息
  -c,  --count=num      设置重试次数为[num],不限制次数设置为“0“，默认设置为“99”。
  -d,  --directory=dir  设置本地目录为[dir],默认值为当前目录。
  -f,  --file=file      重命名下载后文件为[file]
  -h,  --help          显示帮助信息。
  -i,  --interval=num    设置FTP重试期限为[num]秒，默认为“5“。
  -n,  --number=num     设置下载的线程数，默认开4个线程。
  -r,  --referer=URL    使用“Referer: [URL]”在HTTP头中欺骗服务器。
  -t,  --timeout=num    设置超时时间为[num]秒，默认设置是“30”。
  -v,  --version        显示mwget的版本，然后退出。
  -x,  --proxy=URL      设置代理 [URL]
```
## 6. 查看帮助
```shell
mwget -h
```

[参考文档](https://blog.csdn.net/weixin_37926734/article/details/124893268)