class environment {
    exec {
        'apt-get update':
            command => '/usr/bin/apt-get update'
    } ->
    file {
        "/data":
            ensure => directory,
            mode => '0777';
    } ->
    package {
        "curl":
            ensure => present;
        "git":
            ensure => "present";
        "vim":
            ensure => "present";
    }
    include apache
    include mashupapp
    include statusnet
}

include environment

