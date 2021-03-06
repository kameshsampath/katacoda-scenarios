# Add Simple Hello REST API

**1. Add a service**

First, we need to create the Java class file, click on the link below to create an empty file called **HelloBootController.java** in the directory **/root/helloboot/src/main/java/com/example/helloboot** : ``src/main/java/com/example/helloboot/HelloBootController.java``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

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

You will see a HTTP 404 because as we dont have any resource on root `/` , add `/whereami` to the path on the browser to see the response.

**3. Stop the Running Application**

`CRTL + C` to stop the running application
