<?php

/*
 * Springy Framework Configuration File.
 *
 * Used for "development" environment.
 *
 * If removed, only conf/db.php will be used.
 */

return [
    'round_robin' => [
        'type' => 'file',
        'server_addr' => var_dir(),
        'server_port' => 11211,
    ],
    'cache' => [
        'type' => 'off',
        'server_addr' => '127.0.0.1',
        'server_port' => 11211,
    ],
    'default' => [
        'database_type' => 'mysql',
        'host_name' => 'mysql',
        'user_name' => 'root',
        'password' => '123456',
        'database' => 'springy',
        'charset' => 'utf8',
        'persistent' => false,
    ],
];
