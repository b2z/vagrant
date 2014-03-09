class apache {
  # Ensures Apache2 is installed
  package { 'apache2':
    name   => httpd,
    ensure => installed,
  }

  # Ensures the Apache service is running
  service { 'apache2':
    name    => httpd,
    ensure  => running,
    require => Package['apache2'],
  }

  # Adds apache to the startup
  exec { 'apache2_startup':
    path    => '/sbin:/usr/sbin',
    command => 'chkconfig httpd on',
    require => Package['apache2'],
  }
}
