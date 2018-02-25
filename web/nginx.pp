include nginx

package { "nginx":
    ensure => installed
}

service { "nginx":
    require => Package["nginx"],
    ensure => running,
    enable => true
}

file { "/etc/nginx/sites-enabled/default":
    require => Package["nginx"],
    ensure  => absent,
    notify  => Service["nginx"]
}

nginx::resource::upstream { 'app_layer':
    members => [
      'server 127.0.0.1:6060',
      'server 127.0.0.1:6061'
  ],
}

nginx::resource::server { 'app_layer.com':
  listen_port => 80,
  proxy => 'http://app_layer',
}
