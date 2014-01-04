# puppet-lighfe

This is the Puppet code to provision the VPS that runs `mullr.net`.

Based on [puppet-skeleton](https://github.com/gds-operations/puppet-skeleton).

## Bootstrapping a new machine

- Set the hostname
- Run `sudo apt-get update`
- Install Ruby, Bundler, `bundle install`, `librarian-puppet install`
- Run Puppet: `puppet apply manifests/site.pp --verbose --summarize --hiera_config hiera_lighfe.yaml --modulepath=modules:vendor/modules`

## Todo

- unattended-upgrades
