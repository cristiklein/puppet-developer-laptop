class scala {
  
  include base::bin

  File {
    owner  => $real_id,
    group  => $real_id
  }

  $scala_dir = "${home}/bin/scala-2.11.4"  
  $scala_dir_exists = "/usr/bin/test -d ${scala_dir}"

  file { "${scala_dir}":
    ensure => 'absent',
    force  => 'yes',
  }
  file { "${home}/bin/scala-current":
    ensure => 'absent',
  }
  file { "${home}/bin/scala":
    ensure => 'absent',
  }
  file { "${home}/bin/scalac":
    ensure => 'absent',
  }
  file { "${home}/bin/scaladoc":
    ensure => 'absent',
  }
}
