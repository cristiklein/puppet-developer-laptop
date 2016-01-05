# provide basic packages
class base::packages {
  package { ['htop', 'meld', 'curl', 'ack-grep', 'tree'] :
    ensure => installed,
  }
}
