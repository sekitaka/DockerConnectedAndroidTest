FROM ubuntu:16.04

# JDKインストール
RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk

# Android SDKインストール
RUN apt-get install -y wget unzip
RUN wget https://dl.google.com/android/repository/tools_r25.2.3-linux.zip
RUN mkdir -p /Android/sdk
RUN unzip tools_r25.2.3-linux.zip -d /Android/sdk

# 環境変数
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV ANDROID_HOME /Android/sdk
ENV PATH $ANDROID_HOME/bin:$PATH