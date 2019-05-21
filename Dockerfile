##### ################################################################
#####
#####    Base
#####    ====
#####      https://cloud.docker.com/repository/registry-1.docker.io/renshi/ghost
#####
#####    Build
#####    -----
#####      docker build -t renshi/ghost -f Dockerfile .
#####
#####    Run
#####    ---
#####      docker run -it renshi/ghost /bin/bash
#####
##### ################################################################
FROM renshi/base

MAINTAINER Renshi <yanqirenshi@gmail.com>


##### ################################################################
#####   ???
##### ################################################################
USER cl-user
WORKDIR /home/cl-user


#####
##### /home/cl-user/prj/ に コードをコピーする
#####


#####
##### .asdf を ~/.asdf にシンボリックリンクを作成する。
#####


#####
##### graph の保管場所を指定する。
#####


#####
##### ghost.ros を実行する。
#####
