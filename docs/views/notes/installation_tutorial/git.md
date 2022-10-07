---
title: git安装
date: 2022-10-07 21:02:27
tags:
- linux
- 安装教程
- git
categories:
- 安装教程
isShowComments: false
---

<Boxx/>

本教程使用的linux是Centos7,git

<!-- more -->

[[toc]]
## linux安装
### 下载git
[git-2.38.0.tar.gz](https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.38.0.tar.gz) | [git for linux仓库](https://mirrors.edge.kernel.org/pub/software/scm/git/)
   
### 解压
```shell
tar -zxvf git-2.38.0.tar.gz
```
### 安装
```shell
## 切换到解压目录下
cd git-2.38.0
## 安装配置，--prefix为最终安装目录
./configure --prefix=/usr/local/git
## 源码包编译成二进制，并安装
make && make install
```
### 配置环境变量
1. 编辑`/etc/profile`文件，在文件末尾添加如下内容
```shell
vi /etc/profile
```
```shell
export GIT_HOME=/usr/local/git
export PATH=$PATH:$GIT_HOME/bin
```
2. 刷新环境变量使之生效
```shell
source /etc/profile
```
### 验证
输入以下命令，出现版本号即为安装完毕
```shell
git --version
```
### git基本配置
```shell
## 设置用户名，这里我建议个人名称全拼即可
git config --global user.name "shafulin";
## 设置邮箱，不验证邮箱有效性，我一般就写123@qq.com
git config --global user.email "123@qq.com";
```
[参考文档](https://blog.csdn.net/weixin_33858249/article/details/92536693)