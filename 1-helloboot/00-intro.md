# Spring Boot on OpenShift

In this example we will learn how to create a simple Spring Boot project using [Spring CLI](https://docs.spring.io/spring-boot/docs/current/reference/html/getting-started-installing-spring-boot.html#getting-started-installing-the-cli) and deploy the same on to [Red Hat OpenShift](https://www.openshift.com/) using [fabric8 Maven Plugin](https://maven.fabric8.io).

The example application will be a very simple hello world kind of REST API application which will have a REST uri **/whereami** which will return a text response with the **hostname** where the application is deployed and running.