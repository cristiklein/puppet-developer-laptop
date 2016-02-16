# provide basic packages
class base::packages {
  package { [
    'ack-grep',
    'curl',
    'htop',
    'keepassx',
    'hwloc',
    'inotify-tools',
    'intel-microcode',
    'iotop',
    'meld',
    'mpack',
    'pwgen',
    'sqlite3',
    'tree',
    'uuid',
    ] :
    ensure => installed,
  }
}
