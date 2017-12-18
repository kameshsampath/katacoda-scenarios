# Create Calculator Service and Consumer 

**1.Create a Java class file called CalculatorService.java**

Click on the link below to create an empty file called **CalculatorService.java** in the directory **helloboot-discovery/src/main/java/com/example/hellobootdiscovery** : ``helloboot-discovery/src/main/java/com/example/hellobootdiscovery/CalculatorService.java``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="helloboot-discovery/src/main/java/com/example/hellobootdiscovery/CalculatorService.java" data-target="replace">
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

**2.Create a Java class file called CalculatorController.java**

Click on the link below to create an empty file called **CalculatorController.java** in the directory **helloboot-discovery/src/main/java/com/example/hellobootdiscovery** : ``helloboot-discovery/src/main/java/com/example/hellobootdiscovery/CalculatorController.java``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="helloboot-discovery/src/main/java/com/example/hellobootdiscovery/CalculatorController.java" data-target="replace">
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