class fish {
  include apt
  include fish::config

  apt::ppa { 'ppa:fish-shell/release-2': }
  ->
  package { 'fish' :
    ensure => 'installed'
  }
  ->
  # install fish as the default shell
  user { $real_id:
    ensure => present,
    shell  => "/usr/bin/fish",
  }
  ->
  file { "${home}/.config/fish":
    ensure => 'directory',
    owner => $real_id,
    group => $real_id
  }
  ->
  file { "${home}/.config/fish/functions":
    ensure => 'directory',
    owner => $real_id,
    group => $real_id,
  }
  ->
  file { "${home}/.config/fish/functions/fish_prompt.fish":
    ensure  => 'present',
    source  => "puppet:///modules/${module_name}/fish_prompt.fish",
    owner => $real_id,
    group => $real_id,
  }
  ->
  file { '/usr/share/fish/functions/fish_default_key_bindings.fish':
    ensure => present,
    source  => "puppet:///modules/${module_name}/default_key_bindings.fish",
    owner => 'root',
    group => 'root',
    mode  => '0644'
  }
}
