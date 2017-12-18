# Deploy to OpenShift Application Platform

**1. Change to application directory**

``cd $HOME/helloboot-discovery``{{execute interrupt}}``

**2. Add fabric8 maven plugin**

``./mvnw io.fabric8:fabric8-maven-plugin:3.5.30:setup``{{execute}}

After the command one that differs slightly is the `pom.xml`. Please open the and examine it a bit closer to see fabric8 maven plugin added to it.

``helloboot-discovery/pom.xml``{{open}}

**3. Add OpenShift view permission to default Service Account**

As Spring Cloud Kubernetes module uses the Kubernetes API, we need to provide the default service account with **view** permissions:

``oc policy add-role-to-user view -z default``{{execute}}

**4. Deploy the application to OpenShift**

Run the following command to deploy the application to OpenShift.  The application will be deployed on to the **dev** project, which we created in the earlier step.

``mvn clean fabric8:deploy -DskipTests``{{execute}}

**5. Test the service from a web browser on OpenShift**

After the maven build as finished, it will typically take less than 20 sec for the application to be available. To verify that everything is started run the following command and wait for it to report replication controller "hellboot-discovery-s2i-1" successfully rolled out:

``oc rollout status dc/helloboot-discovery``{{execute}}

Then either go to the openshift web console and click on the route or click [here](http://hellboot-discovery-dev.[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/randomadd/)

