---
title: linux安装glibc
date: 2022-10-07 22:15:03
tags:
- linux
- 安装教程
- glibc
categories:
- 安装教程
isShowComments: false
---

<Boxx/>

本教程使用的linux是Centos7,glibc-2.18

<!-- more -->

[[toc]]

## 在线安装gcc
```shell
yum -y install gcc
```
## 离线安装gcc
### 1.安装gclib2.18
[阿里云仓库](https://mirrors.aliyun.com/gnu/glibc/) | `官直`[glibc-2.18.tar.gz](http://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz) | `直`**推荐**[glibc-2.18.tar.gz](https://mirrors.aliyun.com/gnu/glibc/glibc-2.18.tar.gz)

### 2. 解压安装gcc
```shell
# 下载glibc-2.18.tar.gz
wget http://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz
# 解压glibc-2.18.tar.gz
tar zxf  glibc-2.18.tar.gz
# 切换到解压目录下
cd glibc-2.18
# 创建目录build,并切换到
mkdir build;cd build
# 安装配置
../configure --prefix=/usr
# 编译安装
make j2 && make install
```