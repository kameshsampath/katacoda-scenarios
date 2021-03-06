# Create Spring Boot project using Spring CLI

**1. Create a simple spring boot project via cli**

As we will be building a simple REST API with Spring Boot, the project need to have `spring-boot-starter-web` and `spring-boot-starter-actuator` as dependencies.

Let us create a project named **simplecalculator** with **web(spring-boot-starter-web)** and **actuator(spring-boot-starter-actuator)** as project's dependencies. 

Click the command below to have project created using [Spring CLI](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html#getting-started-installing-the-cli):

``spring init --artifactId=simplecalculator --groupId=com.example --dependencies=web,actuator,lombok --extract $HOME/simplecalculator``{{execute}}

**2. Change to project directory**

For the convenience of execute maven commands we shall navigate to the project directory:

``cd $HOME/simplecalculator``{{execute}}

**3. Add json dependency to pom.xml**

Click the link below to open the pom.xml:

``simplecalculator/pom.xml``{{open}}

Add the following dependency to the `pom.xml` dependencies:

``<dependency>
    <groupId>org.json</groupId>
    <artifactId>json</artifactId>
</dependency>``{{copy}}