
class{'nginx':
    manage_repo => true,
    package_source => 'nginx-mainline'
}

nginx::resource::server{'www.app_layer.com':
    www_root => '/opt/html/',
}

nginx::resource::upstream { 'upstream_app':
  members => [
    'server 127.0.0.1:6060',
    'server 127.0.0.1:6061'
  ],
}

nginx::resource::location{'/':
  proxy => 'http://upstream_app/' ,
  server => 'www.app_layer.com'
}


# exec { 'Disable Nginx daemon mode':
#   path    => '/bin',
#   command => 'echo "daemon off;" >> /etc/nginx/nginx.conf',
#   unless  => 'grep "daemon off" /etc/nginx/nginx.conf',
# }
