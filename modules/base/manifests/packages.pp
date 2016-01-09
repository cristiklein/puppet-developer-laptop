# provide basic packages
class base::packages {
  package { [
    'ack-grep',
    'curl',
    'htop',
    'intel-microcode',
    'iotop',
    'meld',
    'sqlite3',
    'tree',
    ] :
    ensure => installed,
  }
}
