<?php

require __DIR__ . '/../vendor/autoload.php';

use Slim\Factory\AppFactory;
use App\Controllers\AdController;


// Подключение конфигурации базы данных
require __DIR__ . '/../src/config/database.php';

// Создаем экземпляр приложения Slim
$app = AppFactory::create();

// Определение маршрутов
$app->get('/ads', [AdController::class, 'getAds']);
$app->get('/ads/{id}', [AdController::class, 'getAd']);
$app->post('/ads', [AdController::class, 'createAd']);

// Запуск приложения
$app->run();
