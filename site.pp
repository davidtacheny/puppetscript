class file {
  file { '/etc/nginx/conf.d/default.conf':
    ensure   => 'file',
    source   => '/etc/puppet/file/default.conf',
}   
  file { '/usr/share/nginx/html/index.html':
    ensure   => 'file',
    source   => '/etc/puppet/file/index.html',
  }
}
class package {
  package { 'git':
    ensure => '1.7.1-3.el6_4.1',
  }
  package { 'ruby':
    ensure => '1.8.7.352-13.el6',
  }
  package { 'ruby-lib':
    ensure => 'absent',
  }
  package { 'ruby-rdoc':
    ensure => '1.8.7.352-13.el6',
  }
  package { 'ruby-augeas':
    ensure => '0.4.1-1.el6',
  }
  package { 'ruby-irb':
    ensure => '1.8.7.352-13.el6',
  }
  package { 'ruby-shadow':
    ensure => '1.4.1-13.el6',
  }
  package { 'ruby-json':
    ensure => 'absent',
  }
  package { 'rubygems':
    ensure => '1.3.7-5.el6',
  }
  package { 'libselinux-ruby':
    ensure => '2.0.94-5.3.el6_4.1',
  }
  package { 'puppet':
    ensure => '2.7.25-2.el6',
  }
  package { 'puppet-server':
    ensure => '2.7.25-2.el6',
  }
  package { 'facter':
    ensure => '1.6.18-3.el6',
  }
  package { 'hiera':
    ensure => '1.0.0-3.el6',
  }
  package { 'rubygem-passenger':
    ensure => '3.0.21-11.el6',
  }
  package { 'rubygem-passenger-native':
    ensure => '3.0.21-11.el6',
  }
  package { 'rubygem-passenger-native-libs':
    ensure => '3.0.21-11.el6',
  }
  package { 'mod_passenger':
    ensure => '3.0.21-11.el6',
  }
  package { 'mod_ssl':
    ensure => '2.2.15-30.el6.centos',
  }
  package { 'libev':
    ensure => '4.03-3.el6',
  }
  package { 'rubygem-fastthread':
    ensure => '1.0.7-2.el6',
  }
  package { 'rubygem-rack':
    ensure => '1.1.0-2.el6',
  }
  package { 'rubygem-augeas':
    ensure => 'absent',
  }
  package { 'nginx':
    ensure => '1.0.15-5.el6',
  }
}
class service {
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
}
class user {
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
}
class yumrepo {
yumrepo { 'C6.0-base':
  baseurl  => 'http://vault.centos.org/6.0/os/$basearch/',
  descr    => 'CentOS-6.0 - Base',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.0-centosplus':
  baseurl  => 'http://vault.centos.org/6.0/centosplus/$basearch/',
  descr    => 'CentOS-6.0 - CentOSPlus',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.0-contrib':
  baseurl  => 'http://vault.centos.org/6.0/contrib/$basearch/',
  descr    => 'CentOS-6.0 - Contrib',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.0-extras':
  baseurl  => 'http://vault.centos.org/6.0/extras/$basearch/',
  descr    => 'CentOS-6.0 - Extras',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.0-updates':
  baseurl  => 'http://vault.centos.org/6.0/updates/$basearch/',
  descr    => 'CentOS-6.0 - Updates',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-base':
  baseurl  => 'http://vault.centos.org/6.1/os/$basearch/',
  descr    => 'CentOS-6.1 - Base',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-centosplus':
  baseurl  => 'http://vault.centos.org/6.1/centosplus/$basearch/',
  descr    => 'CentOS-6.1 - CentOSPlus',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-contrib':
  baseurl  => 'http://vault.centos.org/6.1/contrib/$basearch/',
  descr    => 'CentOS-6.1 - Contrib',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-extras':
  baseurl  => 'http://vault.centos.org/6.1/extras/$basearch/',
  descr    => 'CentOS-6.1 - Extras',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.1-updates':
  baseurl  => 'http://vault.centos.org/6.1/updates/$basearch/',
  descr    => 'CentOS-6.1 - Updates',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-base':
  baseurl  => 'http://vault.centos.org/6.2/os/$basearch/',
  descr    => 'CentOS-6.2 - Base',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-centosplus':
  baseurl  => 'http://vault.centos.org/6.2/centosplus/$basearch/',
  descr    => 'CentOS-6.2 - CentOSPlus',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-contrib':
  baseurl  => 'http://vault.centos.org/6.2/contrib/$basearch/',
  descr    => 'CentOS-6.2 - Contrib',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-extras':
  baseurl  => 'http://vault.centos.org/6.2/extras/$basearch/',
  descr    => 'CentOS-6.2 - Extras',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.2-updates':
  baseurl  => 'http://vault.centos.org/6.2/updates/$basearch/',
  descr    => 'CentOS-6.2 - Updates',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.3-base':
  baseurl  => 'http://vault.centos.org/6.3/os/$basearch/',
  descr    => 'CentOS-6.3 - Base',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.3-centosplus':
  baseurl  => 'http://vault.centos.org/6.3/centosplus/$basearch/',
  descr    => 'CentOS-6.3 - CentOSPlus',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.3-contrib':
  baseurl  => 'http://vault.centos.org/6.3/contrib/$basearch/',
  descr    => 'CentOS-6.3 - Contrib',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.3-extras':
  baseurl  => 'http://vault.centos.org/6.3/extras/$basearch/',
  descr    => 'CentOS-6.3 - Extras',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'C6.3-updates':
  baseurl  => 'http://vault.centos.org/6.3/updates/$basearch/',
  descr    => 'CentOS-6.3 - Updates',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'base':
  descr      => 'CentOS-$releasever - Base',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os',
}
yumrepo { 'c6-media':
  baseurl  => 'file:///media/CentOS/
        file:///media/cdrom/
        file:///media/cdrecorder/',
  descr    => 'CentOS-$releasever - Media',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
}
yumrepo { 'centosplus':
  descr      => 'CentOS-$releasever - Plus',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus',
}
yumrepo { 'contrib':
  descr      => 'CentOS-$releasever - Contrib',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=contrib',
}
yumrepo { 'debug':
  baseurl  => 'http://debuginfo.centos.org/6/$basearch/',
  descr    => 'CentOS-6 - Debuginfo',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-Debug-6',
}
yumrepo { 'epel':
  descr          => 'Extra Packages for Enterprise Linux 6 - $basearch',
  enabled        => '1',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch',
}
yumrepo { 'epel-debuginfo':
  descr          => 'Extra Packages for Enterprise Linux 6 - $basearch - Debug',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-debug-6&arch=$basearch',
}
yumrepo { 'epel-source':
  descr          => 'Extra Packages for Enterprise Linux 6 - $basearch - Source',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=epel-source-6&arch=$basearch',
}
yumrepo { 'epel-testing':
  descr          => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=$basearch',
}
yumrepo { 'epel-testing-debuginfo':
  descr          => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch - Debug',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=testing-debug-epel6&arch=$basearch',
}
yumrepo { 'epel-testing-source':
  descr          => 'Extra Packages for Enterprise Linux 6 - Testing - $basearch - Source',
  enabled        => '0',
  failovermethod => 'priority',
  gpgcheck       => '1',
  gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6',
  mirrorlist     => 'https://mirrors.fedoraproject.org/metalink?repo=testing-source-epel6&arch=$basearch',
}
yumrepo { 'extras':
  descr      => 'CentOS-$releasever - Extras',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras',
}
yumrepo { 'puppetlabs-enterprise-extras':
  baseurl  => 'http://yum-enterprise.puppetlabs.com/el/6/extras/$basearch',
  descr    => 'Puppet Labs Enterprise Extras 6 - $basearch',
  enabled  => '1',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/enterprise-extras-RPM-GPG-KEY-puppetlabs',
}
yumrepo { 'remi':
  descr      => 'Les RPM de remi pour Enterprise Linux 6 - $basearch',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
  mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/remi/mirror',
}
yumrepo { 'remi-debuginfo':
  baseurl  => 'http://rpms.famillecollet.com/enterprise/6/debug-remi/$basearch/',
  descr    => 'Les RPM de remi pour Enterprise Linux 6 - $basearch - debuginfo',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
}
yumrepo { 'remi-php55':
  descr      => 'Les RPM de remi de PHP 5.5 pour Enterprise Linux 6 - $basearch',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
  mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/php55/mirror',
}
yumrepo { 'remi-php55-debuginfo':
  baseurl  => 'http://rpms.famillecollet.com/enterprise/6/debug-php55/$basearch/',
  descr    => 'Les RPM de remi de PHP 5.5 pour Enterprise Linux 6 - $basearch - debuginfo',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
}
yumrepo { 'remi-php56':
  descr      => 'Les RPM de remi de PHP 5.6 pour Enterprise Linux 6 - $basearch',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
  mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/php56/mirror',
}
yumrepo { 'remi-php56-debuginfo':
  baseurl  => 'http://rpms.famillecollet.com/enterprise/6/debug-php56/$basearch/',
  descr    => 'Les RPM de remi de PHP 5.6 pour Enterprise Linux 6 - $basearch - debuginfo',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
}
yumrepo { 'remi-test':
  descr      => 'Les RPM de remi en test pour Enterprise Linux 6 - $basearch',
  enabled    => '0',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
  mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/test/mirror',
}
yumrepo { 'remi-test-debuginfo':
  baseurl  => 'http://rpms.famillecollet.com/enterprise/6/debug-test/$basearch/',
  descr    => 'Les RPM de remi en test pour Enterprise Linux 6 - $basearch - debuginfo',
  enabled  => '0',
  gpgcheck => '1',
  gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
}
yumrepo { 'updates':
  descr      => 'CentOS-$releasever - Updates',
  gpgcheck   => '1',
  gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates',
}
}
