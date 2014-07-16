# == Class: zabbix::agent::config
# This class configures the zabbix agent configuration by combining the template
# and the configuration values from zabbix::agent::params.
#
# === Authors
#
# Eric Anderson <eric.sysmin@gmail.com>
#
class zabbix::agent::config ($path = undef) {
  if ! $path {
    case $::operatingsystem {
      centos, redhat  : { $path = '/etc/zabbix_agentd.conf' }
      debian, ubuntu  : { $path = '/etc/zabbix/zabbix_agentd.conf'}
      default         : { fail('Unrecognized operating system') }
    }
  } else {
    $_path = $path
  }
  file { $_path:
    replace => true,
    content => template('zabbix/agent/zabbix_agentd.conf.erb'),
  }
}
