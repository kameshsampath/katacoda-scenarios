# Add Simple Hello REST API

**1. Add a service**

First, we need to create the java class file. For that, you need to click on the following link, which open the empty file in the editor: ``src/main/java/com/example/helloboot/HelloBootController.java``{{open}}

Then, copy the below content into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="src/main/java/com/example/helloboot/HelloBootController.java" data-target="replace">
package com.example.helloboot;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Simple REST call that says from where its invoked from
 */
@RestController
public class HelloBootController {

    @GetMapping("/whereami")
    public String whereami() {
        return String.format("Hello from %s", System.getenv().getOrDefault("HOSTNAME", "localhost"));
    }
}
</pre>
Take a minute and review the `HelloBootController`. At this stage is pretty simple and only has one method that exposes an endpoint for HTTP GET request for path `/whereami`, as specified in the class annotation `@GetMapping("/whereami")`. We should now be able to see a simple Hello response from the kubernetes pod.

**2. Test the service from a web browser locally**

Run the application by executing the below command:

``mvn spring-boot:run -DskipTests``{{execute}}

When the console reports that Spring is up and running access the web page by either click the Web Browser Tab or use this link.

![Local Web Browser Tab](../assets/web-browser-tab.png)