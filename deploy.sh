#!/bin/bash

# Android Studioが生成する不要なファイルを削除
rm -f local.properties

# ローカル環境で同意したライセンス情報を書き込み
mkdir -p $ANDROID_HOME/licenses
echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license

# Android系のコマンドへアクセスできるようにパスを追加
export PATH=$PATH:/Android/sdk/platform-tools:/Android/sdk/tools/bin

# emulatorにadb接続し、deviceの準備が出来るまで待機
ADB_DEVICES=""
adb connect emulator:5555
until grep -q "emulator:5555 device"<<<$ADB_DEVICES;
do
  echo "waiting emulator"
  adb connect emulator:5555
  ADB_DEVICES=`adb devices`
  sleep 5
done
adb devices
sleep 60 # apkのインストール可能になるまで待機

# connectedAndroidTest実施
./gradlew clean && \
./gradlew connectedAndroidTest
