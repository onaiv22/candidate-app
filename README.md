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
