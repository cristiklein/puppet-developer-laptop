class thunderbird-user-config {
  
  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.thunderbird":
    ensure => 'directory',
    mode   => 0600,
  }

  file { "${home}/.thunderbird/profiles.ini":
    source => "puppet:///modules/${module_name}/profiles.ini",
  }

  file { "${home}/.thunderbird/default":
    ensure => 'directory',
  }

  file { "${home}/.thunderbird/default/key3.db":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/default/key3.db.key",
  }

  file { "${home}/.thunderbird/default/logins.json":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/default/logins.json.key",
  }

  file { "${home}/.thunderbird/default/prefs.js":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/default/prefs.js.sensitive",
  }

  file { "${home}/.thunderbird/default/chrome":
    ensure  => 'present',
    source  => "puppet:///modules/${module_name}/default/chrome",
    recurse => true,
  }

  file { "${home}/.thunderbird/default/extensions":
    ensure  => 'present',
    source  => "puppet:///modules/${module_name}/default/extensions",
    recurse => true,
  }

}
