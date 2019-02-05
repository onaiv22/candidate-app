AWS Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

You can simply upload your code and Elastic Beanstalk automatically handles the deployment, from capacity provisioning, load balancing, auto-scaling to application health monitoring. At the same time, you retain full control over the AWS resources powering your application and can access the underlying resources at any time.

So in this project I will be accessing and reconfiguring some of the underlying resource from using defaults to desired resources.

I will be be using packer to bake the ami-image adherring to cis standards.
I also will creating my own vpc and subnets as against the defaults.
I will also be creating a bastion server for SSHSourceRestriction and creating a rule for this
I might be using some more configuration inside a config.json file which will contain certain desired configurations.

shorthands in notes:
def EB = "{elasticbeanstalk}"
def SCM = "{source-code-management}"

Creating an elasticbeanstalk environment for an App.
The app will have 3  different environments UAT, STG & PROD. There will be a pipeline process
which will be implemented using cicd as a code(Jenkinsfile) concepts in automating then entire build integrating different test frame works ensuring each environment is built as desired.


This prroject will be running each components using docker containers. The EB will be using multiple docker platform. Containers in this project will be using different environments depending on what is supporting each build of the app. i.e different docker images depending on use case.

Management Tools:
 - docker container for docker-registry
 - docker container for letsencrypt (ca) expires every  90days
 - docker container for jenkins  (jenkinsfile - cicd pipeline process)
 - SCM will be github
