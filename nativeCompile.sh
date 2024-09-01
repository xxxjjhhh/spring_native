#!/bin/bash

# 우분투 22.04 LTS 및 24.04 LTS 환경에서 테스트를 진행했습니다.
# 이 bash 스크립트는 실행을 위한 스크립트가 아니기 때문에 bash nativeCompile.sh 로 실행시 내부 코드가 전부 실행되지 않습니다.
# 명령어 정리를 위한 스크립트입니다.

########################################################################################################################

# apt 업데이트 및 gcc, 기타 도구 설치
sudo apt update
sudo apt install build-essential zlib1g-dev unzip -y

# graalVM 환경 설치 후 압축 해제 -> 리눅스 특정 경로로 이동 (파일 명 및 경로는 확인 후 앞으로 아래 명령 사용시 확인이 필요)
wget wget https://download.oracle.com/graalvm/22/latest/graalvm-jdk-22_linux-x64_bin.tar.gz

sudo tar -xzf graalvm-jdk-22_linux-x64_bin.tar.gz
sudo mv graalvm-jdk-22.0.2+9.1 /usr/lib/graalvm

# 이동 시킨 /usr/lib/graalvm를 환경 변수에 등록
export GRAALVM_HOME=/usr/lib/graalvm
export JAVA_HOME=$GRAALVM_HOME
export PATH=$JAVA_HOME/bin:$PATH

# 설치 확인
java -version
native-image --version

# gradlew nativeCompile 빌드 진행
./gradlew nativeCompile
