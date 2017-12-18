# Create Spring Boot project using Spring CLI

**1. Create a simple spring boot project via cli**

As we will be building a simple REST API with Spring Boot, the project need to have `spring-boot-starter-web` and `spring-boot-starter-actuator` as dependencies.

Let us create a project named **helloboot-discovery** with **web(spring-boot-starter-web)** and **actuator(spring-boot-starter-actuator)** as project's dependencies. 

Click the command below to have project created using [Spring CLI](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html#getting-started-installing-the-cli):

``spring init --artifactId=helloboot-discovery --groupId=com.example --dependencies=web,actuator,lombok,cloud-ribbon --extract $HOME/helloboot-discovery``{{execute}}

Click the link below to view the generated pom.xml:

``pom.xml``{{open}}

**2. Change to project directory**

For the convenience of execute maven commands we shall navigate to the project directory:

``cd $HOME/helloboot-discovery``{{execute}}

**3. Add Spring Cloud Kubernetes Netflix dependency to pom.xml**

Click the link below to open the pom.xml:

``pom.xml``{{open}}

Add the following dependency to the `pom.xml` dependencies:

``<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-kubernetes-netflix</artifactId>
    <version>0.2.0.RELEASE</version>
</dependency>``{{copy}}