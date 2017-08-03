class maven {
  
  include base::bin

  File {
    owner  => $real_id,
    group  => $real_id
  }

  $maven_dir = "${home}/bin/apache-maven-3.2.5"  

  file { "${maven_dir}":
    ensure => 'absent',
    force  => 'yes',
  }
  file { "${home}/bin/maven-current":
    ensure => 'absent',
  }
  file { "${home}/bin/mvn":
    ensure => 'absent',
  }
  file { "${home}/bin/mvnDebug":
    ensure => 'absent',
  }
}
