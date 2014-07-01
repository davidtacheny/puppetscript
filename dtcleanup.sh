puppet apply /etc/puppet/manifests/pmusers.pp
puppet apply /etc/puppet/manifests/pmyumrepo.pp
puppet apply /etc/puppet/manifests/pmpackage.pp
puppet apply /etc/puppet/manifests/pmfile.pp
puppet apply /etc/puppet/manifests/pmservice.pp
puppet apply /etc/puppet/manifests/site.pp
rm -rf /puppet/files
