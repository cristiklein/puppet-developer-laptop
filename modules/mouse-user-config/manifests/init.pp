class mouse-user-config {
 
  File {
    owner => $real_id,
    group => $real_id,
  }

  file { "${home}/.xsessionrc":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/xsessionrc",
  }
  
}
