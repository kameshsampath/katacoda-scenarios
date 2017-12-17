# Create Project using Spring CLI

**1. Create a simple spring boot project via cli**

We shall create a simple spring boot project with web and actuator dependencies:

``spring init --artifactId=helloboot --groupId=com.example --dependencies=web,actuator --extract $HOME/helloboot``{{execute}}

**2. Change to project directory**

For the convenience of execute maven commands we shall navigate to the project directory:

``cd /root/helloboot``{{execute}}