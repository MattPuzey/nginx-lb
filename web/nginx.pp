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
    ensure  => running,
    notify  => Service["nginx"]
}