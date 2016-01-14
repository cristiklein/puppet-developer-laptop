class default-apps-user-config {
  
  File {
    owner => $real_id,
    group => $real_id,
  }
 
  file { "${home}/.config/mimeapps.list":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/mimeapps.list",
  }

  dconf::set { '/com/canonical/unity/launcher/favorites':
    value => "[
      'application://org.gnome.Nautilus.desktop',
      'application://terminator.desktop',
      'application://google-chrome.desktop',
      'application://thunderbird.desktop',
      'application://skype.desktop',
      'application://libreoffice-writer.desktop',
      'application://libreoffice-calc.desktop',
      'application://libreoffice-impress.desktop',
      'application://unity-control-center.desktop',
      'unity://running-apps',
      'unity://expo-icon',
      'unity://devices'
    ]",
    user  => $real_id,
    group => $real_id,
  }

}
