---
title: linux安装docker
date: 2022-10-07 21:48:20
tags:
- linux
- 安装教程
- docker
categories:
- 安装教程
isShowComments: false
---

<Boxx/>

本教程使用的linux是Centos7,离线安装使用的是docker20.9.10

<!-- more -->

[[toc]]
## 在线安装

## 离线安装

### 1. 下载docker20.9.10以及相关依赖

_如果之前装过docker请卸载干净_
```shell
yum remove docker docker-common docker-selinux docker-engine
```
- [各种包下载地址](https://zlhy7.lanzoul.com/i2vSbz22czg)
- wget直链下载，推荐这个
```shell
wget https://mirrors.aliyun.com/docker-ce/linux/centos/7.9/x86_64/stable/Packages/docker-ce-20.10.9-3.el7.x86_64.rpm
wget https://mirrors.aliyun.com/centos/7/extras/x86_64/Packages/container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm
wget https://mirrors.aliyun.com/docker-ce/linux/centos/7.9/x86_64/stable/Packages/containerd.io-1.4.9-3.1.el7.x86_64.rpm
wget https://mirrors.aliyun.com/docker-ce/linux/centos/7.9/x86_64/stable/Packages/docker-ce-cli-20.10.9-3.el7.x86_64.rpm
wget https://mirrors.aliyun.com/docker-ce/linux/centos/7.9/x86_64/stable/Packages/docker-ce-rootless-extras-20.10.9-3.el7.x86_64.rpm
wget https://mirrors.aliyun.com/docker-ce/linux/centos/7.9/x86_64/stable/Packages/docker-scan-plugin-0.12.0-3.el7.x86_64.rpm
wget http://mirror.centos.org/centos/7/extras/x86_64/Packages/fuse-overlayfs-0.7.2-6.el7_8.x86_64.rpm
wget http://mirror.centos.org/centos/7/extras/x86_64/Packages/slirp4netns-0.4.3-4.el7_8.x86_64.rpm
wget https://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/f/fuse3-libs-3.6.1-2.el7.x86_64.rpm
```
### 2. 安装docker以及依赖包
```shell
rpm -ivh fuse3-libs-3.6.1-2.el7.x86_64.rpm slirp4netns-0.4.3-4.el7_8.x86_64.rpm \
fuse-overlayfs-0.7.2-6.el7_8.x86_64.rpm docker-scan-plugin-0.12.0-3.el7.x86_64.rpm \
container-selinux-2.119.2-1.911c772.el7_8.noarch.rpm \
containerd.io-1.4.9-3.1.el7.x86_64.rpm docker-ce-cli-20.10.9-3.el7.x86_64.rpm \
docker-ce-rootless-extras-20.10.9-3.el7.x86_64.rpm docker-ce-20.10.9-3.el7.x86_64.rpm 
```
### 3. 配置docker加速器
这里我用的是自己的阿里云镜像加速服务，也可以使用其他镜像加速服务，[参考地址](https://www.jianshu.com/p/5a911f20d93e)

直接复制以下命令到终端执行即可
```shell
# 因为还没有启动docker，所以配置文件目录以及文件还没创建，手动创建下
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://7jdhwfuo.mirror.aliyuncs.com"]
}
EOF
# 加载docker配置
sudo systemctl daemon-reload
sudo systemctl start docker
# 设置开机启动
systemctl enable docker
```
### 4. 验证，查看版本
```shell
docker version
```
## docker-compose 离线安装
### 1. 下载docker-compose
- [docker-compose github-releases](https://github.com/docker/compose/releases)
- `官直`[docker-compose v2.2.3](https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64)
- `直`[docker-compose v2.2.3](https://ghproxy.com/https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64) ,推荐这个github release代理下载
### 2. 添加docker-compose命令到全局
```shell
# 移动到环境变量目录下
mv docker-compose-linux-x86_64 /usr/bin/docker-compose
# 添加可执行权限
chmod +x /usr/bin/docker-compose
```
### 3. 查询docker-compose版本
```shell
docker-compose -v
```
参考文档:
[参考1](https://www.cnblogs.com/leolzi/p/13790536.html) | [参考2](https://www.cnblogs.com/zhangyinhua/p/10286507.html)