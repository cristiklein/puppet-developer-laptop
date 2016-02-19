class skype-user-config {

  $skype_username = chomp(file("${module_name}/username.key"))
  $skype_password = chomp(file("${module_name}/password.key"))

  exec { 'skype --pipelogin':
    command     => "echo ${skype_username} ${skype_password} | skype --pipelogin",
    creates     => "${home}/.Skype",
    environment => "HOME=${home}",
    path        => ["/usr/bin", "/bin"],
    user        => $real_id,
    group       => $real_id,
    require     => Package['skype'],
    provider    => 'shell',
  }

}
