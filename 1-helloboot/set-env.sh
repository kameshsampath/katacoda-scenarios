#!/bin/bash
wget https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/1.5.9.RELEASE/spring-boot-cli-1.5.9.RELEASE-bin.tar.gz
tar -zxf spring-boot-cli-1.5.9.RELEASE-bin.tar.gz
export SPRING_HOME="${HOME}/spring-1.5.9.RELEASE"
export PATH="${SPRING_HOME}/bin:${PATH}"
echo "Using spring cli"
spring version