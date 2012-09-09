class mysql {

  $mysql_password = ""

  package { "mysql-server": ensure => installed }

  exec { "set-mysql-password":
     unless => "mysqladmin -uroot -p$mysql_password status",
     path => ["/bin", "/usr/bin"],
     command => "mysqladmin -uroot password $mysql_password",
     require => Package["mysql-server"],
  }
}