stage { setup: before => Stage[main] }

class { 'repository':
  # Forces the repository to be configured before any other task
  stage => setup
}

# Disables iptables
exec { 'iptables_stop':
  path    => '/sbin:/usr/sbin',
  command => 'service iptables stop',
}

# Removes iptables from startup
exec { 'iptables_startup_off':
  path    => '/sbin:/usr/sbin',
  command => 'chkconfig iptables off',
}

# Installs updates
exec { 'install_updates':
  path    => '/bin:/usr/bin',
  command => 'yum -y update',
}

include apache
include mysql
include php
include webserver
