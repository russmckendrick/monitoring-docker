# puppetlabs pe_gem module

This module provides management of Ruby gems for Puppet Enterprise.

    package { 'json':
      ensure   => present,
      provider => pe_gem,
    }

This uses puppet gem as a parent and simply alters the gem path to /opt/puppet/bin/gem.

## Deprecation for Puppet >= 4.0

As of Puppet 4.0, this module has been deprecated. Please use the puppet_gem provider instead.
