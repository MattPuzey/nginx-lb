# demo.pp
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

file { "/etc/nginx/sites-available/puppet-demo":
    require => [
        Package["nginx"],
        File["/www"]
    ],
    ensure => "file",
    content =>
        "server {
            listen 80 default_server;
            server_name _;
            location / { root /www; }
        }",
    notify => Service["nginx"]
}
file { "/etc/nginx/sites-enabled/puppet-demo":
    require => File["/etc/nginx/sites-available/puppet-demo"],
    ensure => "link",
    target => "/etc/nginx/sites-available/puppet-demo",
    notify => Service["nginx"]
}