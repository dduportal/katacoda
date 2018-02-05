
You can stop this tutorial at any point in time and continue from where you left
off.

If you've already run though link:..[another tutorial], you can skip the
<<prerequisites,Prerequisites>> and <<run-jenkins-in-docker,Run Jenkins in
Docker>> sections below and proceed on to <<fork-sample-repository,forking the
sample repository>>. (Just ensure you have
link:https://git-scm.com/downloads[Git] installed locally.) If you need to
restart Jenkins, simply follow the restart instructions in
<<stopping-and-restarting-jenkins,Stopping and restarting Jenkins>> and then
proceed on.

include::doc/tutorials/_prerequisites.adoc[]
** link:https://git-scm.com/downloads[Git] and optionally
   link:https://desktop.github.com/[GitHub Desktop].

include::doc/book/installing/_run-jenkins-in-docker.adoc[]


[[fork-sample-repository]]
=== Fork and clone the sample repository on GitHub

Obtain the simple "Hello world!" Java application from GitHub, by forking the
sample repository of the application's source code into your own GitHub account
and then cloning this fork locally.

. Ensure you are signed in to your GitHub account. If you don't yet have a
  GitHub account, sign up for a free one on the https://github.com/[GitHub
  website].
. Fork the
  https://github.com/jenkins-docs/simple-java-maven-app[`simple-java-maven-app`]
  on GitHub into your local GitHub account. If you need help with this process,
  refer to the https://help.github.com/articles/fork-a-repo/[Fork A Repo]
  documentation on the GitHub website for more information.
. Clone your forked `simple-java-maven-app` repository (on GitHub) locally to
  your machine. To begin this process, do either of the following (where
  `<your-username>` is the name of your user account on your operating system):
** If you have the GitHub Desktop app installed on your machine:
.. In GitHub, click the green *Clone or download* button on your forked
   repository, then *Open in Desktop*.
.. In GitHub Desktop, before clicking *Clone* on the *Clone a Repository* dialog
   box, ensure *Local Path* for:
*** macOS is `/Users/<your-username>/Documents/GitHub/simple-java-maven-app`
*** Linux is `/home/<your-username>/GitHub/simple-java-maven-app`
*** Windows is `C:\Users\<your-username>\Documents\GitHub\simple-java-maven-app`
** Otherwise:
.. Open up a terminal/command line prompt and `cd` to the appropriate directory
   on:
*** macOS - `/Users/<your-username>/Documents/GitHub/`
*** Linux - `/home/<your-username>/GitHub/`
*** Windows - `C:\Users\<your-username>\Documents\GitHub\` (although use a Git
    bash command line window as opposed to the usual Microsoft command prompt)
.. Run the following command to continue/complete cloning your forked repo: +
   `git clone https://github.com/YOUR-GITHUB-ACCOUNT-NAME/simple-java-maven-app` +
   where `YOUR-GITHUB-ACCOUNT-NAME` is the name of your GitHub account.
