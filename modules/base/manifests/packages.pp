# provide basic packages
class base::packages {
  package { [
    'ack-grep',
    'curl',
    'htop',
    'keepassx',
    'intel-microcode',
    'iotop',
    'meld',
    'sqlite3',
    'tree',
    ] :
    ensure => installed,
  }
}
