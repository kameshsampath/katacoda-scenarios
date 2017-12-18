# Configure Spring Boot Application to use Ribbon

Update the Spring Boot Application Java class file called **DemoApplication.java** in the directory **helloboot-discovery/src/main/java/com/example/hellobootdiscovery** : ``helloboot-discovery/src/main/java/com/example/hellobootdiscovery/DemoApplication.java``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="helloboot-discovery/src/main/java/com/example/hellobootdiscovery/DemoApplication.java" data-target="replace">
package com.example.hellobootdiscovery;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
@EnableDiscoveryClient
@RibbonClient(name = "simplecalcuator", configuration = SimpleCalculatorRibbonConfiguration.class)
public class DemoApplication {

  public static void main(String[] args) {
    SpringApplication.run(DemoApplication.class, args);
  }

  @Configuration
  public class MyConfig {

    @Bean
    @LoadBalanced
    public RestTemplate restTemplate() {
      return new RestTemplate();
    }
  }
}
</pre>

Change to application directory to deploy the application to Kubernetes
