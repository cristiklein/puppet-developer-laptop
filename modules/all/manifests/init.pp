# includes everything puppet-developer-laptop can provide
class all {

  class { 'docker':
    docker_users => [ $real_id ],
  }

  include base
  include chrome
  include cleanup
  include cloud-experiments
  include conky
  include default-apps-user-config
  include docker
  include dropbear
  include dropbox
  include dictionaries
  include fish
  include gedit-user-config
  include git
  include indicator-multiload
  include java
  include kupfer
  include maven
  include mc
  include mouse-user-config
  include mplayer-user-config
  include nvidia-user-settings
  include passwordmaker
  include publishing
  include python
  include r
  include remove-ubuntu-examples
  include scala
  include skype
  include skype-user-config
  include spotify
  include spotify-user-config
  include ssh-server
  include ssh-user-config
  include terminator
  include thunderbird
  include thunderbird-user-config
  include umu-cs-printer-trenter
  include unity-user-config
  include vagrant
  include vim
}
