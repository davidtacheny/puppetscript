#My 1st attepmt and puppet master services
service { 'NetworkManager':
  ensure => 'running',
  enable => 'true',
}
service { 'httpd':
  ensure => 'running',
  enable => 'true',
}
service { 'ip6tables':
  ensure => 'stopped',
  enable => 'false',
}
service { 'iptables':
  ensure => 'stopped',
  enable => 'false',
}
service { 'nginx':
  ensure => 'running',
  enable => 'true',
}
service { 'puppet':
  ensure => 'stopped',
  enable => 'false',
}
service { 'puppetmaster':
  ensure => 'stopped',
  enable => 'false',
}
