class webserver {
  # Setups the virtual host
  file { '/etc/apache2/sites-enabled/example.com':
    path    => '/etc/httpd/conf.d/example.conf',
    source  => 'puppet:///modules/webserver/site.conf',
    notify  => Service['apache2'],
    require => Package['apache2'],
  }
}
