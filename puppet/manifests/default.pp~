$ar_databases = ['activerecord_unittest', 'activerecord_unittest2']
$as_vagrant   = 'sudo -u vagrant -H bash -l -c'
$home         = '/home/vagrant'

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
