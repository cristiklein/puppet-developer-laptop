include apt

class skype {
  package { ['skype']: 
    ensure => 'purged'
  }

  file { "${home}/.Skype":
    ensure  => 'absent',
    recurse => true,
    force   => true,
  }

  apt::source { 'skype-stable':
    architecture => 'amd64',
    location     => 'https://repo.skype.com/deb',
    release      => 'stable',
    repos        => 'main',
    key          => {
      id         => 'D4040146BE3972509FD57FC71F3045A5DF7587C3',
      source     => 'https://repo.skype.com/data/SKYPE-GPG-KEY',
    },
    notify => Exec['apt_update'],
  }
  ->
  package { ['skypeforlinux']:
    ensure => 'installed'
  }

}
