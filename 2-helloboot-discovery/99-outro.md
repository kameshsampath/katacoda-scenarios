## Congratulations

You have now learned how to deploy a simple Spring Boot Service(Calculator), and build a consumer (helloboot-discovery) that can consume the Calculator Service via Netflix OSS components(Ribbon) from within OpenShift Environment with the help of [Spring Cloud Kubernetes modules](https://github.com/spring-cloud-incubator/spring-cloud-kubernetes) which provides the necessary implementation of [Discovery Client](https://github.com/spring-cloud/spring-cloud-commons/blob/master/spring-cloud-commons/src/main/java/org/springframework/cloud/client/discovery/DiscoveryClient.java) for [Kubernetes](http://kubernetes.io/)

## Additional Resources

* [Red Hat OpenShift Application Runtimes for Developers](https://developers.redhat.com/rhoar) - Here you can get started with a project using different boosters and clone that project to your local computer. This also enables you to deploy your application on your own private OpenShift Container Platform or use OpenShift Online that is provided for free from Red Hat.
* [Project Snowdrop homepage](https://snowdrop.me/) - This site has a lot of details of the work that Red Hat is doing to make Spring work great on Kubernetes and OpenShift.
* [fabric8 maven plugin](https://maven.fabric8.io) - the maven plugin that helps to perform a super easy deployment of Java Applications on to Kubernetes