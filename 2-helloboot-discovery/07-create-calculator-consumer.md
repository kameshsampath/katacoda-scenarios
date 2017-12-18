# Create Calculator Service Consumer 


Click on the link below to create an empty Java class file called **CalculatorService.java** in the directory **/root/helloboot/src/main/java/com/example/hellobootdiscovery** : ``/root/helloboot-discovery/src/main/java/com/example/hellobootdiscovery/CalculatorService.java``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="/root/helloboot-discovery/src/main/java/com/example/hellobootdiscovery/CalculatorService.java" data-target="replace">
package com.example.hellobootdiscovery;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@Slf4j
public class CalculatorService {

    private RestTemplate restTemplate;

    public CalculatorService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    public String add(int n1,int n2) {
        String response = restTemplate.getForObject("http://simplecalculator/add/{n1}/{n2}",
                String.class, n1, n2);
        log.info("Response:{}", response);
        return response;
    }
}
</pre>

**3.Create a Java class file called CalculatorController.java**
Click on the link below to create an empty file called **CalculatorController.java** in the directory **/root/helloboot/src/main/java/com/example/hellobootdiscovery** : ``/root/helloboot-discovery/src/main/java/com/example/hellobootdiscovery/CalculatorController.java``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="/root/helloboot-discovery/src/main/java/com/example/hellobootdiscovery/CalculatorController.java" data-target="replace">
package com.example.hellobootdiscovery;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
@Slf4j
public class CalculatorController {
    private final CalculatorService calculatorService;

    public CalculatorController(CalculatorService calculatorService) {
        this.calculatorService = calculatorService;
    }

    @GetMapping("/randomadd")
    public String randomAdd() {
        log.info("Calling Calculator Service: simplecalculator");
        Random random = new Random();
        return calculatorService.add(random.nextInt(),random.nextInt());
    }
}
</pre>

**4.Create a Java class file called SimpleCalculatorRibbonConfiguration.java**
Click on the link below to create an empty file called **SimpleCalculatorRibbonConfiguration.java** in the directory **/root/helloboot/src/main/java/com/example/hellobootdiscovery** : ``/root/helloboot-discovery/src/main/java/com/example/hellobootdiscovery/SimpleCalculatorRibbonConfiguration.java``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="/root/helloboot-discovery/src/main/java/com/example/hellobootdiscovery/SimpleCalculatorRibbonConfiguration.java" data-target="replace">
package com.example.hellobootdiscovery;

import com.netflix.client.config.IClientConfig;
import com.netflix.loadbalancer.AvailabilityFilteringRule;
import com.netflix.loadbalancer.IPing;
import com.netflix.loadbalancer.IRule;
import com.netflix.loadbalancer.PingUrl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;


public class SimpleCalculatorRibbonConfiguration {

    @Autowired
    IClientConfig ribbonClientConfig;

    /**
     *  PingUrl will ping a URL to check the status of each server.
     *  Say Hello has, as you’ll recall, a method mapped to the /path; that means that Ribbon will get an HTTP 200 response when it pings a running Backend Server
     *
     * @param  config Client configuration
     * @return The URL to be used for the Ping
     */
    @Bean
    public IPing ribbonPing(IClientConfig config) {
        return new PingUrl();
    }

    /**
     * AvailabilityFilteringRule will use Ribbon’s built-in circuit breaker functionality to filter out any servers in an “open-circuit” state:
     * if a ping fails to connect to a given server, or if it gets a read failure for the server, Ribbon will consider that server “dead” until it begins to respond normally.
     *
     * @param  config Client configuration
     * @return The Load Balancer rule
     */
    @Bean
    public IRule ribbonRule(IClientConfig config) {
        return new AvailabilityFilteringRule();
    }
}
</pre>
