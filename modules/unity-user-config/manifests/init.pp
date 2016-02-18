class unity-user-config {
  
  dconf::set { '/org/compiz/profiles/unity/plugins/unityshell/launcher-capture-mouse':
    value => false,
    user  => $real_id,
    group => $real_id,
  }

}
