# Creating Simple Calculator REST Application

**1. Add Calculator Service**

First, we need to create the Java class file, click on the link below to create an empty file called **Calculator.java** in the directory **simplecalculator/src/main/java/com/example/simplecalculator** : ``
simplecalculator/src/main/java/com/example/simplecalculator/Calculator.java``{{open}}

Once the created file is opened in the editor, you can then copy the content below into the file (or use the `Copy to editor` button):

<pre class="file" data-filename="simplecalculator/src/main/java/com/example/simplecalculator/Calculator.java" data-target="replace">
package com.example.simplecalculator;

import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
public class Calculator {

    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET, value = "/add/{num1}/{num2}", produces = "text/plain")
    public String add(@PathVariable("num1") Integer num1, @PathVariable("num2") Integer num2) {
        String hostname = getHostName();
        int result = (num1 + num2);
        log.info("Product Result:{} executed on Pod {}", result, hostname);
        return String.format("Service Host :%s \n %d + %d = %d", hostname, num1, num2, result);
    }

    private String getHostName() {
        return System.getenv().getOrDefault("HOSTNAME", "Unknown");
    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET, value = "/sub/{num1}/{num2}", produces = "text/plain")
    public String sub(@PathVariable("num1") Integer num1, @PathVariable("num2") Integer num2) {
        String hostname = getHostName();
        int result = (num1 - num2);
        log.info("Product Result:{} executed on Pod {}", result, hostname);
        return String.format("Service Host :%s \n %d - %d = %d", hostname, num1, num2, result);
    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST, value = "/mul", produces = "text/plain",
            consumes = "application/json")
    public String mul(@RequestBody String numbersJson) {
        log.debug("Request : {}", numbersJson);
        long product = 1;
        if (numbersJson != null && !StringUtils.isEmpty(numbersJson)) {
            JSONObject jsonObject = new JSONObject(numbersJson);
            JSONArray jsonArray = jsonObject.getJSONArray("numbers");
            if (jsonArray != null && jsonArray.length() > 0) {
                for (int i = 0; i < jsonArray.length(); i++) {
                    product = product * jsonArray.getLong(i);
                }
            }
        }
        String hostname = getHostName();
        log.info("Product Result:{} executed on Pod {}", product, hostname);
        return String.format("Service Host :%s \n Product  = %d", hostname, product);
    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST, value = "/div", produces = "text/plain",
            consumes = "application/json")
    public String div(@RequestBody String numbersJson) {
        log.debug("Request : {}", numbersJson);
        String hostname = getHostName();
        double answer = 0;
        if (numbersJson != null && !StringUtils.isEmpty(numbersJson)) {
            JSONObject jsonObject = new JSONObject(numbersJson);
            JSONArray jsonArray = jsonObject.getJSONArray("numbers");
            if (jsonArray != null && jsonArray.length() > 0) {
                for (int i = 0; i < jsonArray.length(); i++) {
                    double n = jsonArray.getDouble(i);
                    if (n != 0) {
                        if (answer == 0) {
                            answer = n;
                        } else {
                            answer = answer / n;
                        }
                    } else {
                        answer = 0;
                        log.error("Exception Divide by 0");
                        break;
                    }
                }
            }
        }
        log.info("Divide Result:{} executed on Pod {}", answer, hostname);
        return String.format("Service Host :%s \n Answer = %f", hostname, answer);
    }
}
</pre>

Take a minute and review the `Calculator`. It has four standard simple calculator operations such as add, subtract, multiply and divide.  Each of these methods take JSON body with array of numbers that need to be added, divided, multiplied or subtracted.  The response will JSON response with the result of arithmetic computation.

**2. Test the service from a web browser locally**

Run the application by executing the below command:

``mvn spring-boot:run -DskipTests``{{execute}}

When the console reports that Spring is up and running access the web page by either click the Web Browser Tab or use this link.

![Local Web Browser Tab](../assets/web-browser-tab.png)

You will see a HTTP 404 because as we dont have any resource on root `/` , try doing any one of the following REST calls

* [Add 1 and 2 ](http://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/add/1/2)
* [Subtract 3 from 5  ](http://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/sub/5/3)
* [Multiply 3 and 5 ](http://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/mul/3/5)
* [Divide 15 by 3 ](http://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/div/3/5)