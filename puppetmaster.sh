#!/bin/bash

# Install Puppet 3.x on Centos 6.x

#############
# Variables #
#############

fqdn=`hostname -f`
##############
# Functions  #
##############

enable_service() {
/sbin/chkconfig $1 on
/sbin/service $1 start
}

disable_service() {
/sbin/chkconfig $1 off
/sbin/service $1 stop
}


# Stop/Disable SELinux (Premissive Mode)
/usr/sbin/setenforce 0

# Stop/Disable IPTables v4/v6
disable_service iptables
disable_service ip6tables

# Add Puppet Labs YUM repository
rpm -Uvh https://yum-enterprise.puppetlabs.com/el/6/extras/i386/puppetlabs-enterprise-release-extras-6-2.noarch.rpm

# Add EPEL YUM repository
rpm -Uvh  http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh  http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# Install Ruby prerequisites
# Packages from EPEL: ruby-augeas rubygem-json
yum -y install ruby ruby-lib ruby-rdoc ruby-augeas ruby-irb ruby-shadow rubygem-json rubygems libselinux-ruby

# Install Puppet Server
# Packages from PUPPETLABS: puppet puppet-server facter hiera
yum -y install puppet puppet-server

# Start the puppetmaster service to create SSL certificate
/etc/init.d/puppetmaster start

# Stop/Disable the puppet master service as it will be controled via passenger.
disable_service puppetmaster

# Install Passenger Apache Module 
yum -y install rubygem-passenger rubygem-passenger-native rubygem-passenger-native-libs mod_passenger

# Configure the Apache conf.d for passenger
cat >> /etc/httpd/conf.d/puppetmaster.conf << EOF
# you probably want to tune these settings
PassengerHighPerformance on
PassengerMaxPoolSize 12
PassengerPoolIdleTime 1500
# PassengerMaxRequests 1000
PassengerStatThrottleRate 120
RackAutoDetect Off
RailsAutoDetect Off

Listen 8140

<VirtualHost *:8140>
        SSLEngine on
        SSLProtocol -ALL +SSLv3 +TLSv1
        SSLCipherSuite ALL:!ADH:RC4+RSA:+HIGH:+MEDIUM:-LOW:-SSLv2:-EXP

        SSLCertificateFile      /var/lib/puppet/ssl/certs/${fqdn}.pem
        SSLCertificateKeyFile   /var/lib/puppet/ssl/private_keys/${fqdn}.pem
        SSLCertificateChainFile /var/lib/puppet/ssl/ca/ca_crt.pem
        SSLCACertificateFile    /var/lib/puppet/ssl/ca/ca_crt.pem
        # If Apache complains about invalid signatures on the CRL, you can try disabling
        # CRL checking by commenting the next line, but this is not recommended.
        SSLCARevocationFile     /var/lib/puppet/ssl/ca/ca_crl.pem
        SSLVerifyClient optional
        SSLVerifyDepth  1
        SSLOptions +StdEnvVars

        RequestHeader set X-SSL-Subject %{SSL_CLIENT_S_DN}e
        RequestHeader set X-Client-DN %{SSL_CLIENT_S_DN}e
        RequestHeader set X-Client-Verify %{SSL_CLIENT_VERIFY}e

        DocumentRoot /etc/puppet/rack/public/
        RackBaseURI /
        RailsEnv production
        <Directory /etc/puppet/rack/>
                Options None
                AllowOverride None
                Order allow,deny
                allow from all
        </Directory>
</VirtualHost>
EOF

# Create Ruby Rack within Puppet directory strucutre for ease of management.
mkdir /etc/puppet/rack
mkdir /etc/puppet/rack/public
mkdir /etc/puppet/rack/tmp
cp /usr/share/puppet/ext/rack/files/config.ru /etc/puppet/rack
chown puppet:root /etc/puppet/rack/config.ru
chmod 644 /etc/puppet/rack/config.ru

# Install Apache SSL (mod_ssl)
yum -y install mod_ssl

# Start/Enable apache service (httpd)
enable_service httpd

# Enable/Include just required packages from EPEL
# include_repo_packages <repo conf file> <repo name> <"package list">
yum -y install mod_passenger rubygem-passenger rubygem-passenger-native rubygem-passenger-navtive-libs libev rubygem-fastthread rubygem-rack ruby-augeas rubygem-json

# Enable/Include just required packages from PUPPETLABS
yum -y install puppet puppet-server facter hiera
