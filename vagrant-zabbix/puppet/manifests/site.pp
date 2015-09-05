class { 'apache':
	mpm_module => 'prefork',
}
include apache::mod::php
class { 'postgresql::server': }
class { 'zabbix':
	zabbix_url    => 'zabbix.media-glass.es'
}
class { 'zabbix::agent':
  server => 'zabbix.media-glass.es',
}