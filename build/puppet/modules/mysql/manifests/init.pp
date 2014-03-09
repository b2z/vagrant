class mysql {
  # Installs the MySQL server
  package { 'mysql-server':
    name   => "mysql-server",
    ensure => installed,
  }

  # Ensures the MySQL service is running
  service { 'mysqld':
    ensure  => running,
    require => Package['mysql-server'],
  }

  # Adds the MySQL to the startup
  exec { 'mysqld_startup':
    path    => '/sbin:/usr/sbin',
    command => 'chkconfig mysqld on',
    require => Package['mysql-server'],
  }
}
