# provide basic packages
class base::packages {
  package { [
    'ack-grep',
    'cscope',
    'curl',
    'exuberant-ctags',
    'heimdal-clients',
    'htop',
    'keepassx',
    'hwloc',
    'inotify-tools',
    'intel-microcode',
    'iotop',
    'iperf',
    'libtext-markdown-perl',
    'meld',
    'mpack',
    'pv',
    'pwgen',
    'sloccount',
    'sqlite3',
    'tree',
    'uuid',
    ] :
    ensure => installed,
  }
}
