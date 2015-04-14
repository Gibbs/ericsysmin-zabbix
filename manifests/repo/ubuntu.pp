# == Class: zabbix::repo::ubuntu
# This sets up the Official Zabbix Repository on Ubuntu systems.
#
# === Authors
#
# Eric Anderson <eric.sysmin@gmail.com>
#
class zabbix::repo::ubuntu {
  include apt

  apt::source { 'zabbix':
    location   => "http://repo.zabbix.com/zabbix/${::zabbix::repo::version}/ubuntu/",
    release    => $::lsbdistcodename,
    repos      => 'main',
    key        => 'FBABD5FB20255ECAB22EE194D13D58E479EA5ED4',
    key_source => 'http://repo.zabbix.com/zabbix-official-repo.key',
    pin        => $::zabbix::repo::apt_pin,
  }
}