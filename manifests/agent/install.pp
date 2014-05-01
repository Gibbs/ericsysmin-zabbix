# == Class: zabbix::agent::install
# This class installs the zabbix agent package
#
# === Sample Usage:
# class { 'zabbix::agent::install':}
# or
# include zabbix::agent::install
#
# === Authors
#
# Eric Anderson <eric.sysmin@gmail.com>
#
class zabbix::agent::install {
  package { 'zabbix-agent': ensure => $zabbix::agent::params::package_ensure }
}
