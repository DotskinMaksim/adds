<?php

namespace App\Controllers;

use App\Models\Ad;
use Psr\Http\Message\ResponseInterface as PsrResponse;
use Psr\Http\Message\ServerRequestInterface as Request;
use Respect\Validation\Validator as v;
use Slim\Psr7\Response;

class AdController
{
    public function getAds(Request $request, PsrResponse $response)
    {
        // Вывод отладочной информации
        if (!Ad::exists()) {
            return $response->withStatus(500)->getBody()->write('No ads found or database error.');
        }

        $ads = Ad::paginate(20); // Пагинация 20 объявлений
        $response->getBody()->write(json_encode($ads));
        return $response->withHeader('Content-Type', 'application/json');
    }

    public function getAd(Request $request, Response $response, $args)
    {
        $ad = Ad::find($args['id']);
        if (!$ad) {
            $response->getBody()->write(json_encode(['error' => 'Ad not found']));
            return $response->withStatus(404)->withHeader('Content-Type', 'application/json');
        }
        $response->getBody()->write(json_encode($ad));
        return $response->withHeader('Content-Type', 'application/json');
    }

    public function createAd(Request $request, Response $response)
    {
        $data = $request->getParsedBody();

        // Исправленный валидатор
        $validation = v::key('title', v::stringType()->length(1, 200))
            ->key('description', v::stringType()->length(0, 1000))
            ->key('price', v::numericVal()) // Исправлено на v::numericVal()
            ->key('photos', v::arrayType()->length(0, 3));

        if (!$validation->validate($data)) {
            $response->getBody()->write(json_encode(['error' => 'Validation failed']));
            return $response->withStatus(400)->withHeader('Content-Type', 'application/json');
        }

        $ad = Ad::create($data);
        $response->getBody()->write(json_encode(['id' => $ad->id, 'status' => 'success']));
        return $response->withStatus(201)->withHeader('Content-Type', 'application/json');
    }
}
