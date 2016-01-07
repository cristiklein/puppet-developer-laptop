class umu-cs-printer-trenter {
  file { "/etc/cups/ppd/trenter.ppd":
    ensure => 'present',
    source => "puppet:///modules/${module_name}/trenter.ppd",
  } ->

  printer { "Trenter":
    ensure      => present,
    uri         => "lpd://printserver.cs.umu.se/trenter",
    location    => "UmU, CS, 4th floor, postal room",
    ppd         => '/etc/cups/ppd/trenter.ppd',

    page_size   => 'A4',
    duplex      => 'DuplexNoTumble',
    ppd_options => {
      'Stapling' => 'UL',
    },
  }

  default_printer { "Trenter":
    ensure => present,
    require => Printer['Trenter'],
  }
}
