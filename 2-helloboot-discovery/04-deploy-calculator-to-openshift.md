# Deploy to OpenShift Application Platform

**1. Add fabric8 maven plugin**

``cd $HOME/simplecalculator``{{execute}}

``./mvnw io.fabric8:fabric8-maven-plugin:3.5.30:setup``{{execute interrupt}}

After the command one that differs slightly is the `pom.xml`. Please open the and examine it a bit closer to see fabric8 maven plugin added to it.

``simplecalculator/pom.xml``{{open}}

**2. Deploy the application to OpenShift**

Run the following command to deploy the application to OpenShift.  The application will be deployed on to the **dev** project, which we created in the earlier step.

``mvn clean fabric8:deploy -DskipTests``{{execute}}

**3. Test the service from a web browser on OpenShift**

After the maven build as finished, it will typically take less than 20 sec for the application to be available. To verify that everything is started run the following command and wait for it to report replication controller "simplecalculator-s2i-1" successfully rolled out:

``oc rollout status dc/simplecalculator``{{execute}}

To test the deployed application, try doing any one of the following REST calls

* [Add 1 and 2 ](http://simplecalculator-dev.[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/add/1/2)
* [Subtract 3 from 5  ](http://simplecalculator-dev.[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/sub/5/3)
* [Multiply 3 and 5 ](http://simplecalculator-dev.[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/mul/3/5)
* [Divide 15 by 3 ](http://simplecalculator-dev.[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/div/3/5)
