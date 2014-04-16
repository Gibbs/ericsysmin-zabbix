# == Class: zabbix::agent::params
#
# This sets up the Zabbix Agent on systems.
#
# === Parameters:
#   [*ensure*]
#
#   [*pidFile*]
#     Name of PID file.
#
#   [*logFile*]
#     Name of log file. If not set, syslog is used.
#
#   [*logFileSize*]
#     Maximum size of log file in MB.
#       0 - disable automatic log rotation.
#
#   [*debugLevel*]
#     Specifies debug level
#       0 - no debug
#       1 - critical information
#       2 - error information
#       3 - warnings
#       4 - for debugging (produces lots of information)
#
#   [*sourceIP*]
#     Source IP address for outgoing connections.
#
#   [*enableRemoteCommands*]
#     Whether remote commands from Zabbix server are allowed.
#       0 - not allowed
#       1 - allowed
#
#   [*logRemoteCommands*]
#     Enable logging of executed shell commands as warnings.
#       0 - disabled
#       1 - enabled
#
#   [*server*]
#     List of comma delimited IP addresses (or hostnames) of Zabbix servers.
#       Incoming connections will be accepted only from the hosts listed here.
#       No spaces allowed.
#       If IPv6 support is enabled then '127.0.0.1', '::127.0.0.1',
#       '::ffff:127.0.0.1' are treated equally.
#
#   [*listenPort*]
#     Agent will listen on this port for connections from the server.
#
#   [*listenIP*]
#     List of comma delimited IP addresses that the agent should listen on.
#     First IP address is sent to Zabbix server if connecting to it to retrieve
#     list of active checks.
#
#   [*startAgents*]
#     Number of pre-forked instances of zabbix_agentd that process passive
#     checks.
#     If set to 0, disables passive checks and the agent will not listen on any
#     TCP port.
#
#   [*serverActive*]
#     List of comma delimited IP:port (or hostname:port) pairs of Zabbix servers
#     for active checks.
#       If port is not specified, default port is used.
#       IPv6 addresses must be enclosed in square brackets if port for that host
#       is specified.
#       If port is not specified, square brackets for IPv6 addresses are
#       optional.
#       If this parameter is not specified, active checks are disabled.
#       Example:
#       ServerActive=127.0.0.1:20051,zabbix.domain,[::1]:30051,::1,[12fc::1]
#
#   [*hostname*]
#     Unique, case sensitive hostname.
#       Required for active checks and must match hostname as configured on the
#       server.
#       Value is acquired from HostnameItem if undefined.
#
#   [*hostnameItem*]
#     Item used for generating Hostname if it is undefined.
#       Ignored if Hostname is defined.
#
#   [*hostMetadata*]
#     Optional parameter that defines host metadata.
#       Host metadata is used at host auto-registration process.
#       An agent will issue an error and not start if the value is over limit of
#       255 characters.
#       If not defined, value will be acquired from HostMetadataItem.
#
#   [*hostMetadataItem*]
#     Optional parameter that defines an item used for getting host metadata.
#     Host metadata is used at host auto-registration process.
#     During an auto-registration request an agent will log a warning message if
#     the value returned by specified item is over limit of 255 characters.
#     This option is only used when HostMetadata is not defined.
#
#   [*refreshActiveChecks*]
#     How often list of active checks is refreshed, in seconds.
#
#   [*bufferSend*]
#     Do not keep data longer than N seconds in buffer.
#
#   [*bufferSize*]
#     Maximum number of values in a memory buffer. The agent will send all
#     collected data to Zabbix Server or Proxy if the buffer is full.
#
#   [*maxLinesPerSecond*]
#     Maximum number of new lines the agent will send per second to Zabbix
#     Server
#       or Proxy processing 'log' and 'logrt' active checks.
#       The provided value will be overridden by the parameter 'maxlines',
#       provided in 'log' or 'logrt' item keys.
#
#   [*allowRoot*]
#     Allow the agent to run as 'root'. If disabled and the agent is started by
#     'root', the agent
#       will try to switch to user 'zabbix' instead. Has no effect if started
#       under a regular user.
#       0 - do not allow
#       1 - allow
#
#   [*zabbix_alias*]
#     Sets an alias for parameter. It can be useful to substitute long and
#     complex parameter name with a smaller and simpler one.
#
#   [*timeout*]
#     Spend no more than Timeout seconds on processing
#
#   [*include*]
#     You may include individual files or all files in a directory in the
#     configuration file.
#       Installing Zabbix will create include directory in /usr/local/etc,
#       unless modified during the compile time.
#
#   [*unsafeUserParameters*]
#     Allow all characters to be passed in arguments to user-defined parameters.
#       0 - do not allow
#       1 - allow
#
#   [*userParameter*]
#     User-defined parameter to monitor. There can be several user-defined
#     parameters.
#       Format: UserParameter=<key>,<shell command>
#       Note that shell command must not return empty string or EOL only.
#       See 'zabbix_agentd' directory for examples.
#
# === Authors
#
# Eric Anderson <eric.sysmin@gmail.com>
#
class zabbix::agent::params (
  $package_ensure       = present,
  $service_ensure       = running,
  $pidFile              = '/var/run/zabbix/zabbix_agentd.pid',
  $logFile              = '/var/log/zabbix/zabbix_agentd.log',
  $logFileSize          = undef,
  $debugLevel           = undef,
  $sourceIP             = undef,
  $enableRemoteCommands = undef,
  $logRemoteCommands    = undef,
  $server               = '127.0.0.1',
  $listenPort           = undef,
  $listenIP             = undef,
  $startAgents          = undef,
  $serverActive         = undef,
  $hostname             = undef,
  $hostnameItem         = undef,
  $hostMetadata         = undef,
  $hostMetadataItem     = undef,
  $refreshActiveChecks  = undef,
  $bufferSend           = undef,
  $bufferSize           = undef,
  $maxLinesPerSecond    = undef,
  $allowRoot            = undef,
  $zabbix_alias         = undef,
  $timeout              = undef,
  $include              = undef,
  $unsafeUserParameters = undef,
  $userParameter        = undef,) {
}
