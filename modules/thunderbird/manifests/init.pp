class thunderbird {
  
  package { ['thunderbird', 'xul-ext-calendar-timezones', 'xul-ext-gdata-provider', 'xul-ext-lightning']: 
    ensure => 'installed'
  }

}
