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
