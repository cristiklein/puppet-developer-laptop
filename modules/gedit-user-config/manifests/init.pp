class gedit-user-config {
  
  dconf::set { '/org/gnome/gedit/preferences/editor/create-backup-copy':
    value => false,
    user  => $real_id,
    group => $real_id,
  }

}
