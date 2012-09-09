<?php
if (!defined('STATUSNET') && !defined('LACONICA')) {
    exit(1);
}

$config['site']['name'] = 'status.net Test';

$config['site']['server'] = 'dev.status.net:8080';
$config['site']['path'] = false;

$config['db']['database'] = 'mysqli://root:@localhost/db424174366';

$config['db']['type'] = 'mysql';