def EB = "{elasticbeanstalk}"
def SCM = "{source-code-management}"

Creating a  an elasticbeanstalk environment for an App.
The app will have 3  different environments UAT, STG & PROD. Then will be a CICD process
which will be implemented using cicd as a code (Jenkinsfile) which will automated the whole process from each environment to the other.


This prroject will be running every component of it using dockerr containers. The EB will be using multiple docker platform. Containers in this project will be using different environments depending on what is supporting each arm of the app. i.e different docker images depending on use case.

Management Tools:
 - docker container for docker-registry
 - docker container for letsencrypt (ca) expires every  90days
 - docker container for jenkins  (jenkinsfile - cicd pipeline process)
 - SCM will be github
