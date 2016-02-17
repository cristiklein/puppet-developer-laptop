# includes everything puppet-developer-laptop can provide
class all {

  class { 'docker':
    docker_users => [ $real_id ],
  }

  include base
  include chrome
  include cloud-experiments
  include conky
  include default-apps-user-config
  include docker
  include dropbox
  include dictionaries
  include empty-var-crash
  include fish
  include gedit-user-config
  include git
  include java
  include kupfer
  include maven
  include mc
  include mouse-user-config
  include nvidia-blob
  include nvidia-user-settings
  include passwordmaker
  include publishing
  include python
  include remove-ubuntu-examples
  include scala
  include skype
  include spotify
  include spotify-user-config
  include ssh-server
  include ssh-user-config
  include terminator
  include thunderbird
  include thunderbird-user-config
  include umu-cs-printer-trenter
  include vagrant
  include vim
}
