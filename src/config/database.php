<?php

use Illuminate\Database\Capsule\Manager as Capsule;
use Dotenv\Dotenv;



// Загружаем переменные окружения из .env файла
$dotenv = Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();


$capsule = new Capsule;


$capsule->addConnection([
    'driver'    => getenv('DB_CONNECTION') ?: 'mysql',
    'host'      => getenv('DB_HOST') ?: '127.0.0.1',
    'database'  => getenv('DB_DATABASE') ?: 'ads_database',
    'username'  => getenv('DB_USERNAME') ?: 'root',
    'password'  => getenv('DB_PASSWORD') ?: '',
    'charset'   => 'utf8',
    'collation' => 'utf8_unicode_ci',
    'prefix'    => '',
]);

$capsule->setAsGlobal();
$capsule->bootEloquent();
