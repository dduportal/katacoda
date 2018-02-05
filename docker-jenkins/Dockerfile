FROM jenkins/jenkins:lts-alpine

# Embed Plugins in the image and Copy Auto-Configuration Groovy scripts
# See https://github.com/jenkinsci/docker#preinstalling-plugins
COPY ./ref /usr/share/jenkins/ref
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

ENV JAVA_OPTS="-XshowSettings:vm -Djenkins.install.runSetupWizard=false -Xms256m -Xmx512m"
