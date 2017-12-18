# Create application.yaml

Since we will be using the Spring `DiscoveryClient` we will have Ribbon Client enabled for the project. 

**1.Rename the file `application.properties` to `application.yaml`**

``mv helloboot-discovery/src/main/resources/application.properties helloboot-discovery/src/main/resources/application.yaml``{{execute}}

**2. Update the application.yaml with Ribbon Configuration**

Open the file `application.yaml` 
``helloboot-discovery/src/main/resources/application.yaml``{{open}} 

then copy the following contents (or use the `Copy to editor` button):

<pre class="file" data-filename="helloboot-discovery/src/main/resources/application.yaml" data-target="replace">
spring:
  application:
    name: helloboot-discovery
simplecalculator:
  ribbon:
    eureka:
      enabled: false
    client:
      enabled: true
    ServerListRefreshInterval: 5000
</pre>