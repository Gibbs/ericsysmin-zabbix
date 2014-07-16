# == Class: zabbix::agent::config
# This class configures the zabbix agent configuration by combining the template
# and the configuration values from zabbix::agent::params.
#
# === Authors
#
# Eric Anderson <eric.sysmin@gmail.com>
#
class zabbix::agent::config ($path = undef) {
  if $path {
    $config_path = $path
  } else {
    case $::operatingsystem {
      centos, redhat  : { $config_path = '/etc/zabbix_agentd.conf' }
      debian, ubuntu  : { $config_path = '/etc/zabbix/zabbix_agentd.conf'}
      default         : { fail('Unrecognized operating system') }
    }
  }
  file { $config_path:
    replace => true,
    content => template('zabbix/agent/zabbix_agentd.conf.erb'),
  }
}
