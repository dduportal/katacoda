import jenkins.model.*
import hudson.model.*
import hudson.security.*
import jenkins.security.s2m.*
import hudson.security.csrf.DefaultCrumbIssuer

def instance = Jenkins.getInstance()

// Set Default Security
def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("butler","butler")
instance.setSecurityRealm(hudsonRealm)

def strategy = new hudson.security.FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)
instance.injector.getInstance(AdminWhitelistRule.class).setMasterKillSwitch(false);

instance.setCrumbIssuer(new DefaultCrumbIssuer(true))

/// Disable all protocol except JNLP4
//// From https://github.com/samrocketman/jenkins-bootstrap-shared/blob/master/scripts/configure-jnlp-agent-protocols.groovy
if(!instance.isQuietingDown()) {
  Set<String> agentProtocolsList = ['JNLP4-connect', 'Ping']
    if(!instance.getAgentProtocols().equals(agentProtocolsList)) {
        instance.setAgentProtocols(agentProtocolsList)
        println "Agent Protocols have changed.  Setting: ${agentProtocolsList}"
        instance.save()
    }
    else {
        println "Nothing changed.  Agent Protocols already configured: ${instance.getAgentProtocols()}"
    }
}
else {
    println 'Shutdown mode enabled.  Configure Agent Protocols SKIPPED.'
}

instance.save()
