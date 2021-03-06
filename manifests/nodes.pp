# Use hiera as a lightweight ENC.
node default {
  hiera_include('classes')

  # Set up users and groups
  $accounts = hiera('accounts')
  create_resources('account', $accounts)

  $cronjobs = hiera('cronjobs')
  create_resources('cron', $cronjobs)
}
