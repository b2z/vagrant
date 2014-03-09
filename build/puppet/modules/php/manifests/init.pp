class php {
  # Enables remi repo
  exec { 'enable_remi':
    path    => '/bin:/usr/bin',
    command => 'yum-config-manager --enable remi',
  }

  # Installs PHP and restarts Apache to load the module
  package { ['php', 'php-pecl-xdebug', 'php-pecl-apc', 'php-gd', 'php-mbstring']:
    ensure  => installed,
    notify  => Service['apache2'],
    require => Package['apache2'],
  }

  file { '/etc/php.d/xdebug-custom.ini':
     ensure  => present,
     require => Package['php'],
     source  => '/vagrant/build/puppet/modules/php/files/xdebug-custom.ini';
  }

  file { '/etc/php.d/php-custom.ini':
     ensure  => present,
     require => Package['php'],
     source  => '/vagrant/build/puppet/modules/php/files/php-custom.ini';
  }
}
