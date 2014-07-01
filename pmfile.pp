file { '/etc/nginx/conf.d/default.conf':
  ensure   => 'file',
  source   => '/etc/puppet/file/default.conf',
}
file { '/usr/share/nginx/html/index.html':
  ensure   => 'file',
  source   => '/etc/puppet/file/index.html',
}
