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
    'sqlite3',
    'tree',
    ] :
    ensure => installed,
  }
}
