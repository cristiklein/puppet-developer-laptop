class passwordmaker {
  
  package { ['passwordmaker-cli']: 
    ensure => 'installed'
  }

  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.passwordmaker.rdf":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/passwordmaker.rdf.sensitive",
  }

}
