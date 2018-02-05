=== Create your initial Pipeline as a Jenkinsfile

You're now ready to create your Pipeline that will automate building your Java
application with Maven in Jenkins. Your Pipeline will be created as a
`Jenkinsfile`, which will be committed to your locally cloned Git repository
(`simple-java-maven-app`).

This is the foundation of "Pipeline-as-Code", which treats the continuous
delivery pipeline as a part of the application to be versioned and reviewed like
any other code. Read more about Pipeline and what a Jenkinsfile is in the
link:/doc/book/pipeline[Pipeline] and link:/doc/book/pipeline/jenkinsfile[Using
a Jenkinsfile] sections of the User Handbook.

First, create an initial Pipeline to download a Maven Docker image and run it as
a Docker container (which will build your simple Java application). Also add a
"Build" stage to the Pipeline that begins orchestrating this whole process.

. Using your favorite text editor or IDE, create and save new text file with the
  name `Jenkinsfile` at the root of your local `simple-java-maven-app` Git
  repository.
. Copy the following Declarative Pipeline code and paste it into your empty
  `Jenkinsfile`:
+
[source,groovy]
----
pipeline {
    agent {
        docker {
            image 'maven:3-alpine' // <1>
            args '-v /root/.m2:/root/.m2' // <2>
        }
    }
    stages {
        stage('Build') { // <3>
            steps {
                sh 'mvn -B -DskipTests clean package' // <4>
            }
        }
    }
}
----
<1> This `image` parameter (of the link:/doc/book/pipeline/syntax#agent[`agent`]
section's `docker` parameter) downloads the
https://hub.docker.com/_/maven/[`maven:3-apline` Docker image] (if it's not
already available on your machine) and runs this image as a separate container.
This means that:
* You'll have separate Jenkins and Maven containers running locally in Docker.
* The Maven container becomes the link:/doc/book/glossary/#agent[agent] that
  Jenkins uses to run your Pipeline project. However, this container is
  short-lived - its lifespan is only that of the duration of your Pipeline's
  execution.
<2> This `args` parameter creates a reciprocal mapping between the `/root/.m2`
(i.e. Maven repository) directories in the short-lived Maven Docker container
and that of your Docker host's filesystem. Explaining the details behind this is
beyond the scope of this tutorial. However, the main reason for doing this is to
ensure that the artifacts necessary to build your Java application (which Maven
downloads while your Pipeline is being executed) are retained in the Maven
repository beyond the lifespan of the Maven container. This prevents Maven from
having to download the same artifacts during successive runs of your Jenkins
Pipeline, which you'll be conducting later on. Be aware that unlike the Docker
data volume you created for `jenkins-data`
<<download-and-run-jenkins-in-docker,above>>, the Docker host's filesystem is
effectively cleared out each time Docker is restarted. This means you'll lose
the downloaded Maven repository artifacts each time Docker restarts.
<3> Defines a link:/doc/book/pipeline/syntax/#stage[`stage`] (directive) called
`Build` that appears on the Jenkins UI.
<4> This
link:/doc/pipeline/steps/workflow-durable-task-step/#code-sh-code-shell-script[`sh`]
step (of the link:/doc/book/pipeline/syntax/#steps[`steps`] section) runs the
Maven command to cleanly build your Java application (without running any
tests).
. Save your edited `Jenkinsfile` and commit it to your local
  `simple-java-maven-app` Git repository. E.g. Within the
  `simple-java-maven-app` directory, run the commands: +
  `git add .` +
  then +
  `git commit -m "Add initial Jenkinsfile"`
. Go back to Jenkins again, log in again if necessary and click *Open Blue
  Ocean* on the left to access Jenkins's Blue Ocean interface.
. In the *This job has not been run* message box, click *Run*, then quickly
  click the *OPEN* link which appears briefly at the lower-right to see Jenkins
  running your Pipeline project. If you weren't able to click the *OPEN* link,
  click the row on the main Blue Ocean interface to access this feature. +
  *Note:* You may need to wait several minutes for this first run to complete.
  After making a clone of your local `simple-java-maven-app` Git repository
  itself, Jenkins:
.. Initially queues the project to be run on the agent.
.. Downloads the Maven Docker image and runs it in a container on Docker.
+
[.boxshadow]
image:tutorials/java-maven-01-downloading-maven-docker-image.png[alt="Downloading
Maven Docker image",width=100%]
.. Runs the `Build` stage (defined in the `Jenkinsfile`) on the Maven container.
   During this time, Maven downloads many artifacts necessary to build your Java
   application, which will ultimately be stored in Jenkins's local Maven
   repository (in the Docker host's filesystem).
[.boxshadow]
image:tutorials/java-maven-02-initial-pipeline-downloading-maven-artifacts.png[alt="Downloading
Maven artifacts",width=100%]

+
The Blue Ocean interface turns green if Jenkins built your Java application
successfully.
[.boxshadow]
image:tutorials/java-maven-03-initial-pipeline-runs-successfully.png[alt="Initial
Pipeline runs successfully",width=100%]
. Click the *X* at the top-right to return to the main Blue Ocean interface.
+
[.boxshadow]
image:tutorials/java-maven-04-main-blue-ocean-interface.png[alt="Main Blue Ocean
interface",width=100%]
