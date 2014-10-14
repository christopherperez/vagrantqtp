$ar_databases = ['activerecord_unittest', 'activerecord_unittest2']
$as_vagrant   = 'sudo -u vagrant -H bash -l -c'
$home         = '/home/vagrant'

# Pick a Ruby version modern enough, that works in the currently supported Rails
# versions, and for which RVM provides binaries.
$ruby_version = '2.0.0-p247'

include apt

Exec {
  path => ['/usr/sbin', '/usr/bin', '/sbin', '/bin']
}

# --- Preinstall Stage ---------------------------------------------------------

stage { 'preinstall':
  before => Stage['main']
}

class apt_get_update {
  exec { 'apt-get -y update':
    unless => "test -e ${home}/.rvm"
  }
}
class { 'apt_get_update':
  stage => preinstall
}


# --- New user -----------------------------------------------------------------

user { 'qptteam':
  ensure => present,
  shell => '/bin/bash',
  home => '/home/qtpteam',
  managehome => true,
  password => 'qtpteam',
}
user { 'criper':
  ensure => present,
  shell => '/bin/bash',
  home => '/home/criper',
  managehome => true,
  password => 'criper',
}


# --- MySQL --------------------------------------------------------------------
#https://forge.puppetlabs.com/puppetlabs/mysql


class install_mysql {

  class { '::mysql::server':
    root_password    => 'default'
  }

}
class { 'install_mysql': }

# --- MySQL --------------------------------------------------------------------

class { '::samba::class { '::samba::server':
  workgroup            => 'PRUEBA',
  server_string        => 'Qtpteam',
  netbios_name         => 'F01',
  interfaces           => [ 'lo', 'eth0' ],
  hosts_allow          => [ '127.', '192.168.','172.16.' ],
  local_master         => 'yes',
  map_to_guest         => 'Bad User',
  os_level             => '50',
  preferred_master     => 'yes',
  extra_global_options => [
    'printing = BSD',
    'printcap name = /dev/null',
  ],
  shares => {
    'homes' => [
      'comment = Home Directories',
      'browseable = no',
      'writable = yes',
    ],
    'y' => [
      'comment = y',
      'path = /mnt/y',
      'browseable = yes',
      'read only = no',
      'writable = yes',
      'available = yes',
      'valid users = qtpteam',
    ],
    'QTPScripts' => [
      'comment = Scripts from QTP',
      'path = /mnt/QTP_Scripts',
      'browseable = yes',
      'read only = no',
      'writable = yes',
      'available = yes',
      'valid users = qtpteam',
    ],
    'y local' => [
      'comment = y local',
      'path = /home/qtpteam/y_local',
      'browseable = yes',
      'read only = no',
      'writable = yes',
      'available = yes',
      'valid users = qtpteam',
    ],
    'QTP Scripts local' => [
      'comment = QTPSCRIPTSlocal',
      'path = /home/qtpteam/QTPScripts_local',
      'browseable = yes',
      'read only = no',
      'writable = yes',
      'available = yes',
      'valid users = qtpteam',
    ],
    'COMPARTIDA' => [
      'comment = shared folder',
      'path = /home/qtpteam/Compartida',
      'browseable = yes',
      'read only = no',
      'writable = yes',
      'available = yes',
      'valid users = qtpteam',
    ],
    'Gasnatural' => [
      'comment = y',
      'path = /mnt/Gasnatural',
      'browseable = yes',
      'read only = no',
      'writable = yes',
      'available = yes',
      'valid users = qtpteam',
    ],
  },
  selinux_enable_home_dirs => true,
}



# --- Packages -----------------------------------------------------------------

package { 'curl':
  ensure => installed
}

package { 'git-core':
  ensure => installed
}

package { 'autoconf':
  ensure => installed
}

package { 'build-essential':
  ensure => installed
}

# Used for update-locale
package { 'language-pack-es':
  install_options => [ '-y'],
  ensure => installed,
} 

# --- Locale -------------------------------------------------------------------

# Needed for docs generation.
exec { 'update-locale':
  command => 'update-locale LANG=es_ES.UTF-8 LANGUAGE=es_ES.UTF-8 LC_ALL=es_ES.UTF-8'
}
