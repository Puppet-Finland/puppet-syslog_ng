class syslog_ng::params {

  $options = {
    'chain_hostnames' => 0,
    'time_reopen' => 10,
    'time_reap' => 360,
    'log_fifo_size' => 2048,
    'create_dirs' => 'yes',
    'group' => 'adm',
    'perm' => '0640',
    'dir_perm' => '0755',
    'use_dns' => 'no'
  }
  
  case $::osfamily {
    'Redhat', 'Amazon': {
      $package_name = 'syslog-ng'
      $module_prefix = 'syslog-ng-'
      $init_config_file = '/etc/sysconfig/syslog-ng'
      $init_config_hash = {
        'SYSLOGNG_OPTIONS'    => '"-p /var/run/syslog-ng.pid"',
      }
    }
    'Debian', 'Ubuntu': {
      $package_name = 'syslog-ng-core'
      $module_prefix = 'syslog-ng-mod-'
      $init_config_file = '/etc/default/syslog-ng'
      $init_config_hash = {}
    }
    default: {
      fail("${::hostname}: This module does not support osfamily `${::osfamily}`")
    }
  }
  $service_name = 'syslog-ng'
  $tmp_config_file  = '/tmp/syslog-ng.conf.tmp'
  $config_dir = '/etc/syslog-ng'
  $config_file  = "${config_dir}/syslog-ng.conf"
  $config_file_header = "# This file was generated by Puppet's ihrwein-syslog_ng module"
}
