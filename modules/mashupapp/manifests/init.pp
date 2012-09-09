class mashupapp {

    include nodejs

    file {
        "/etc/apache2/sites-enabled/000-default":
            ensure => absent,
            require => Package["apache2"];
        "/etc/apache2/sites-available/mashupapp":
            ensure => present,
            source => "puppet:///modules/mashupapp/vhost",
            require => Package["apache2"];
        "/etc/apache2/sites-enabled/mashupapp":
            ensure => link,
            target => "/etc/apache2/sites-available/mashupapp",
            require => Package["apache2"],
            notify => Service["apache2"];
    } ->
    exec {
        "clone mashupapp":
            command => "/usr/bin/git clone https://github.com/bashofmann/statusnet_js_mashup_2nd.git /opt/statusnet_js_mashup_2nd",
            creates => "/opt/statusnet_js_mashup_2nd",
            require => Package["git"];
    } ->
    exec {
        "status.io":
            command => "/usr/bin/npm install socket.io@0.9.6",
            unless => "/usr/bin/npm list | /bin/grep 'socket.io@0.9.6'",
            cwd => "/opt/statusnet_js_mashup_2nd/backend",
            require => Package["nodejs","npm"];
        "oexchange":
            command => "/usr/bin/npm install oexchange@0.1.1",
            unless => "/usr/bin/npm list | /bin/grep 'oexchange@0.1.1'",
            cwd => "/opt/statusnet_js_mashup_2nd/backend",
            require => Package["nodejs","npm","make","g++"];
    }
}