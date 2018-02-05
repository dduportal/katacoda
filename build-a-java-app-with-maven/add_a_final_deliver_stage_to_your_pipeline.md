1. Go back to your text editor/IDE and ensure your `Jenkinsfile` is open.
2. Copy and paste the following Declarative Pipeline syntax immediately under the
  `Test` stage of your `Jenkinsfile`:

```
stage('Deliver') {
  steps {
    sh './jenkins/scripts/deliver.sh'
  }
}
```

so that you end up with:
```
pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deliver') { // <1>
            steps {
                sh './jenkins/scripts/deliver.sh' // <2>
            }
        }
    }
}
```
<1> Defines a new stage called `Deliver` that appears on the Jenkins UI.
<2> This
[`sh`](https://jenkins.io/doc/pipeline/steps/workflow-durable-task-step/#code-sh-code-shell-script)
step (of the [`steps`](https://jenkins.io/doc/book/pipeline/syntax/#steps) section) runs the
shell script `deliver.sh` located in the `jenkins/scripts` directory from the
root of the `simple-java-maven-app` repository. Explanations about what this
script does are covered in the `deliver.sh` file itself. As a general principle,
it's a good idea to keep your Pipeline code (i.e. the `Jenkinsfile`) as tidy as
possible and place more complex build steps (particularly for stages consisting
of 2 or more steps) into separate shell script files like the `deliver.sh` file.
This ultimately makes maintaining your Pipeline code easier, especially if your
Pipeline gains more complexity.
1. Save your edited `Jenkinsfile` and commit it to your local
  `simple-java-maven-app` Git repository. E.g. Within the
  `simple-java-maven-app` directory, run the commands: +
  `git stage .` +
  then +
  `git commit -m "Add 'Deliver' stage"`
2. Go back to Jenkins again, log in again if necessary and ensure you've accessed
  Jenkins's Blue Ocean interface.
3. Click *Run* at the top left, then quickly click the *OPEN* link which appears
  briefly at the lower-right to see Jenkins running your amended Pipeline
  project. If you weren't able to click the **OPEN** link, click the _top_ row
  on the Blue Ocean interface to access this feature. +
  If your amended Pipeline ran successfully, here's what the Blue Ocean
  interface should look like. Notice the additional "Deliver" stage. Click on
  the previous "Test" and "Build" stage circles to access the outputs from those
  stages.
+
[.boxshadow]
![alt "Deliver stage runs successfully"](https://jenkins.io/doc/book/resources/tutorials/java-maven-21-deliver-stage-runs-successfully.png)

+
Here's what the output of the "Deliver" stage should look like, showing you the
execution results of your Java application at the end.
[.boxshadow]
![alt text](https://jenkins.io/doc/book/resources/tutorials/java-maven-22-deliver-stage-output-only.png)
1. Click the *X* at the top-right to return to the main Blue Ocean interface,
  which lists your previous Pipeline runs in reverse chronological order.
[.boxshadow]
![alt "Main Blue Ocean interface with all previous runs displayed"](https://jenkins.io/doc/book/resources/tutorials/java-maven-23-main-blue-ocean-interface-with-all-previous-runs-displayed.png)
