
class{'nginx':
    manage_repo => true,
    package_source => 'nginx-mainline'
}

file { "/etc/nginx/sites-enabled/default":
    require => Package["nginx"],
    ensure  => absent,
    notify  => Service["nginx"]
}

nginx::resource::server{'test2.local':
    proxy => 'http://upstream_app',
    # use_default_location => false
}

nginx::resource::upstream { 'upstream_app':
  members => [
    '127.0.0.1:6060',
    # '127.0.0.1:6061'
  ],
}

# nginx::resource::location{'/':
#   proxy => 'http://upstream_app/' ,
#   server => 'www.app_layer.com'
# }


# exec { 'Disable Nginx daemon mode':
#   path    => '/bin',
#   command => 'echo "daemon off;" >> /etc/nginx/nginx.conf',
#   unless  => 'grep "daemon off" /etc/nginx/nginx.conf',
# }
