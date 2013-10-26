# == Class: lighfe::motd
#
# Set up motd properly
class lighfe::motd {
  file { '/etc/update-motd.d/01-lighfe':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => 'a+x',
    source => 'puppet:///modules/lighfe/motd-lighfe.sh',
  }
}
