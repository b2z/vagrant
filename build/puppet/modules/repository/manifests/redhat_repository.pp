class redhat_repository {
  # We need cURL installed to import the key
  package { 'curl': 
    ensure => installed 
  }

  exec { "epel.repo":
    command => 'rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
    path    => ['/bin', '/usr/bin'],
    unless  => 'rpm -qa | grep epel',
  }

  exec { 'remi.repo':
    path    => '/bin:/usr/bin',
    command => 'curl http://rpms.famillecollet.com/enterprise/remi.repo -o /etc/yum.repos.d/remi.repo',
    require => Package['curl'],
  }

  # Installs yum-manager
  exec { 'install_yumutils':
    path    => '/bin:/usr/bin',
    command => 'yum --enablerepo="base" -y install yum-utils',
  }
}
