# provide basic packages
class base::packages {
  package { [
    'ack-grep',
    'curl',
    'htop',
    'keepassx',
    'inotify-tools',
    'intel-microcode',
    'iotop',
    'meld',
    'sqlite3',
    'tree',
    ] :
    ensure => installed,
  }
}
