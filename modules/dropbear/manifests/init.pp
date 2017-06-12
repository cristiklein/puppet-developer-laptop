class dropbear {
  
  package { ['dropbear', ]:
    ensure => 'installed'
  }

  file { "/etc/initramfs-tools/root/.ssh/":
    ensure => 'directory',
  }

  file { "/etc/initramfs-tools/root/.ssh/authorized_keys":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/authorized_keys",
    notify  => Exec['update_initramfs_all']
  }

  file { "/etc/initramfs-tools/hooks/crypt_unlock.sh":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/crypt_unlock.sh",
    mode   => 0755,
    notify => Exec['update_initramfs_all']
  }

  file_line { 'dropbear_enable':
    ensure => present,
    path   => '/etc/initramfs-tools/initramfs.conf',
    line   => 'DROPBEAR=y',
    match  => 'DROPBEAR=',
    notify  => Exec['update_initramfs_all']
  }

  file_line { 'busybox_enable':
    ensure => present,
    path   => '/etc/initramfs-tools/initramfs.conf',
    line   => 'BUSYBOX=y',
    match  => 'BUSYBOX=',
    notify  => Exec['update_initramfs_all']
  }

  exec { 'update_initramfs_all':
    command     => '/usr/sbin/update-initramfs -k all -u',
    refreshonly => true
  }
}
