# == Class: lighfe::nginx
#
# Install required nginx vhosts
class lighfe::nginx {
  $vhosts = hiera('vhosts')
  $vhostroots = hiera('vhostroots')

  file { ['/srv', '/srv/www', '/var/www']:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    before => Nginx::Vhost[keys($vhosts)],
  }

  file { '/etc/nginx/conf.d/maps.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/lighfe/maps.conf',
    before => Nginx::Vhost[keys($vhosts)],
  }

  file { '/var/www/alex.mullr.net-rewritemap.txt':
    ensure => 'file',
    owner  => 'alexmuller',
    group  => 'alexmuller',
    source => 'puppet:///modules/lighfe/alex.mullr.net-rewritemap.txt',
    before => Nginx::Vhost[keys($vhosts)],
  }

  file { $vhostroots:
    ensure => 'directory',
    owner  => 'alexmuller',
    group  => 'alexmuller',
    before => Nginx::Vhost[keys($vhosts)],
  }

  nginx::vhost { 'mullr.net':
    template_options   =>
      { 'old_hostname' => 'mullr.net',
        'new_hostname' => 'alex.mullr.net' },
    vhostroot          => '/srv/www/mullr.net',
    template           => 'lighfe/hostname_redirect.conf.erb',
  }

  create_resources('nginx::vhost', $vhosts)
}
