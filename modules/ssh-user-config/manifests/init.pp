class ssh-user-config {
  
  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.ssh":
    ensure => 'directory',
  }

  file { "${home}/.ssh/id_rsa.pub":
    source => "puppet:///modules/${module_name}/id_rsa.pub",
  }

  file { "${home}/.ssh/id_rsa":
    source => "puppet:///modules/${module_name}/id_rsa.key",
    mode => 0600,
  }

  file { "${home}/.ssh/config":
    source => "puppet:///modules/${module_name}/config.sensitive",
    mode => 0600,
  }

  file { "${home}/.ssh/authorized_keys":
    source => "puppet:///modules/${module_name}/authorized_keys",
    mode => 0600,
  }

  file { "${home}/.ssh/MANAGED-BY-PUPPET":
    source => "puppet:///modules/${module_name}/MANAGED-BY-PUPPET",
  }

}
