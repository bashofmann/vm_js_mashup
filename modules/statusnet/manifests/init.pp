class statusnet {

    include mysql

    package {
        "php5-mysql":
            ensure => present,
            notify => Service["apache2"];
    }

    file {
        "/tmp/db.sql":
            ensure => present,
            source => "puppet:///modules/statusnet/db.sql";
        "/etc/apache2/sites-available/statusnet":
            ensure => present,
            source => "puppet:///modules/statusnet/vhost",
           require => Package["apache2"];
        "/etc/apache2/sites-enabled/statusnet":
            require => Package["apache2"],
            ensure => link,
            target => "/etc/apache2/sites-available/statusnet",
            notify => Service["apache2"];
    } ->
    exec {
        "clone statusnet":
            command => "/usr/bin/git clone git://gitorious.org/~bhofmann/statusnet/bhofmanns-statusnet-mainline.git /opt/statusnet",
            creates => "/opt/statusnet",
            timeout => 0,
            require => Package["git"];
        "import db":
            command => "/usr/bin/mysql -u root -h localhost < /tmp/db.sql",
            unless => "/usr/bin/mysql -u root db424174366";
    } -> file {
        "/opt/statusnet/config.php":
            ensure => present,
            source => "puppet:///modules/statusnet/config.php";
    }


}