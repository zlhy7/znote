---
title: nodejs安装
date: 2022-10-07 20:33:18
tags:
- linux
- 安装教程
- nodejs
categories:
- 安装教程
isShowComments: false
---

<Boxx/>

本教程使用的linux是Centos7

<!-- more -->

[[toc]]

## 1. 下载nodejs

[node-v16.9.1-linux-x64.tar.gz](https://repo.huaweicloud.com/nodejs/v16.9.1/node-v16.9.1-linux-x64.tar.gz)

## 2. 解压后移动到软件目录下
```shell
# 解压文件
tar -zxvf node-v16.9.1-linux-x64.tar.gz
# 移动nodejs位置
mv node-v16.9.1-linux-x64 /usr/local/nodejs
# 添加软连接，使之成为全局命令
ln -s /usr/local/nodejs/bin/npm /usr/local/bin/
ln -s /usr/local/nodejs/bin/node /usr/local/bin/
```

## 3. 验证安装是否完毕
```shell
node -v
npm -v
```

[参考文档](https://www.cnblogs.com/zhi-leaf/p/10979629.html)
