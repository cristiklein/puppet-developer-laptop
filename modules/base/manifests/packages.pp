# provide basic packages
class base::packages {
  package { [
    'ack-grep',
    'curl',
    'htop',
    'meld',
    'tree',
    ] :
    ensure => installed,
  }
}
