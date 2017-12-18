# Deploy to OpenShift Application Platform

**1. Add fabric8 maven plugin**

``./mvnw io.fabric8:fabric8-maven-plugin:3.5.30:setup``{{execute}}

After the command one that differs slightly is the `pom.xml`. Please open the and examine it a bit closer to see fabric8 maven plugin added to it.

``pom.xml``{{open}}

**2. Deploy the application to OpenShift**

Run the following command to deploy the application to OpenShift.  The application will be deployed on to the **dev** project, which we created in the earlier step.

``mvn clean fabric8:deploy -DskipTests``{{execute}}

**3. Test the service from a web browser on OpenShift**

After the maven build as finished, it will typically take less than 20 sec for the application to be available. To verify that everything is started run the following command and wait for it to report replication controller "simplecalculator-s2i-1" successfully rolled out:

``oc rollout status dc/simplecalculator``{{execute}}

Then either go to the openshift web console and click on the route or click [Do Addition of 1 and 2](http://helloboot-dev.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/add/1/2)

