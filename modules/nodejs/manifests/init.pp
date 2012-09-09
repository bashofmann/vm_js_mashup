class nodejs {

    if ! defined(Package["python-software-properties"]){
        package {
            "python-software-properties" :
            ensure => "present" ;
        }
    }

    exec {
        "add-apt-repository-ppa:chris-lea/node.js":
            command => "/usr/bin/add-apt-repository ppa:chris-lea/node.js",
            creates => "/etc/apt/sources.list.d/chris-lea-node_js-precise.list";
    } ->
    exec {
        'apt-get update nodejs':
            command => '/usr/bin/apt-get update';
    } ->
    package {
        ["nodejs","npm","make","g++"] :
            require => Package["python-software-properties"],
            ensure => "present" ;
    }
}