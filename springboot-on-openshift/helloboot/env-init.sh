# ssh root@host01 "git --git-dir=/root/projects/helloboot/.git --work-tree=/root/projects/helloboot pull"
ssh root@host01 "yum -y install wget tree"
ssh root@host01 "wget https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/1.5.9.RELEASE/spring-boot-cli-1.5.9.RELEASE-bin.tar.gz"
ssh root@host01 "tar -zxvf spring-boot-cli-1.5.9.RELEASE-bin.tar.gz"