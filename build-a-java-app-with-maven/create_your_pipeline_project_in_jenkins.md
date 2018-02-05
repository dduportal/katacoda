=== Create your Pipeline project in Jenkins

. Go back to Jenkins, log in again if necessary and click *create new jobs*
  under *Welcome to Jenkins!* +
  *Note:* If you don't see this, click *New Item* at the top left.
. In the *Enter an item name* field, specify the name for your new Pipeline
  project (e.g. `simple-java-maven-app`).
. Scroll down and click *Pipeline*, then click *OK* at the end of the page.
. ( _Optional_ ) On the next page, specify a brief description for your Pipeline
  in the *Description* field (e.g. `An entry-level Pipeline demonstrating how to
  use Jenkins to build a simple Java application with Maven.`)
. Click the *Pipeline* tab at the top of the page to scroll down to the
  *Pipeline* section.
. From the *Definition* field, choose the *Pipeline script from SCM* option.
  This option instructs Jenkins to obtain your Pipeline from Source Control
  Management (SCM), which will be your locally cloned Git repository.
. From the *SCM* field, choose *Git*.
. In the *Repository URL* field, specify the directory path of your locally
  cloned repository <<fork-sample-repository,above>>,
  which is from your user account/home directory on your host machine, mapped to
  the `/home` directory of the Jenkins container - i.e.
* For macOS - `/home/Documents/GitHub/simple-java-maven-app`
* For Linux - `/home/GitHub/simple-java-maven-app`
* For Windows - `/home/Documents/GitHub/simple-java-maven-app`
. Click *Save* to save your new Pipeline project. You're now ready to begin
  creating your `Jenkinsfile`, which you'll be checking into your locally cloned
  Git repository.
