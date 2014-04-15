# == Class: zabbix::repo::redhat
# This sets up the Official Zabbix Repository on CentOS systems.
#
# === Variables
#
# [*zabbix::repo::version*]
#   This is inherited from zabbix::repo which gets sent to this class when
#   called.
#
# === Sample Usage:
#   include zabbix::repo::redhat
#
# === Authors
#
# Eric Anderson <eric.sysmin@gmail.com>
#
class zabbix::repo::redhat {
  yumrepo { 'zabbix':
    baseurl  => "http://repo.zabbix.com/zabbix/${::zabbix::repo::version}/rhel/",
    gpgcheck => '1',
    gpgkey   => 'http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX'
  }
}