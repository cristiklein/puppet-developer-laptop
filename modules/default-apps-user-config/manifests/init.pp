class default-apps-user-config {
  
  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.config/mimeapps.list":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/mimeapps.list",
  }

}
