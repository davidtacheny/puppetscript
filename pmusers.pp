#My first attempt to setup puppetest standalone
user { 'root':
  ensure           => 'present',
  comment          => 'root',
  gid              => '0',
  home             => '/root',
  password         => '$6$/xcsqKnayWGhDv2w$kfBC9qixTf74xHqLM6jr6lJ19e1vOg6FJt9C9nVZwN5D22mNuUlMrkR12NnYlHQS3uiDrdYUEcUleA4h6SieB.',
  password_max_age => '99999',
  password_min_age => '0',
  shell            => '/bin/bash',
  uid              => '0',
}
user { 'apache':
  ensure           => 'present',
  comment          => 'Apache',
  gid              => '48',
  home             => '/var/www',
  password         => '!!',
  password_max_age => '-1',
  password_min_age => '-1',
  shell            => '/sbin/nologin',
  uid              => '48',
}

user { 'nginx':
  ensure           => 'present',
  comment          => 'Nginx web server',
  gid              => '492',
  home             => '/var/lib/nginx',
  password         => '!!',
  password_max_age => '-1',
  password_min_age => '-1',
  shell            => '/sbin/nologin',
  uid              => '496',
}
