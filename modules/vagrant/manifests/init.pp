
class vagrant {
	
  package { ['vagrant',
             'virtualbox',
             'virtualbox-dkms',
             'virtualbox-qt']:
             
	  ensure => 'purged'
  }
}
