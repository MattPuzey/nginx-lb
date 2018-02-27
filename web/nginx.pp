
class{'nginx':
    manage_repo => true,
    package_source => 'nginx-mainline'
}

file { "/etc/nginx/sites-enabled/default":
    require => Package["nginx"],
    ensure  => absent,
    notify  => Service["nginx"]
}

file { "/etc/nginx/conf.d/default.conf":
    require => Package["nginx"],
    ensure  => absent,
    notify  => Service["nginx"]
}

nginx::resource::server{'goapp.com':
    proxy => 'http://upstream_app/',
    use_default_location => false,
    server_name => ['goapp.com'],
    proxy_connect_timeout => 120
}

nginx::resource::upstream { 'upstream_app':
  members => [
      # variablise this to be 127.0.0.1 for linux systems
      'docker.for.mac.localhost:6060',
      'docker.for.mac.localhost:6061',
      'docker.for.mac.host.internal:6060',
      'docker.for.mac.host.internal:6061',
      '127.0.0.1:6060',
      '127.0.0.1:6061'
  ],
}

nginx::resource::location{'/':
  proxy => 'http://upstream_app/' ,
  server => 'goapp.com'
}

#
# exec { 'Disable Nginx daemon mode':
#   path    => '/bin',
#   command => 'echo "daemon off;" >> /etc/nginx/nginx.conf',
#   unless  => 'grep "daemon off" /etc/nginx/nginx.conf',
# }
