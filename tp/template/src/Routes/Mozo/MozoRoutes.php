<?php

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use \Slim\App;
use Controllers\AuthController;
use Controllers\MozosController;
use Middleware\RoleMiddleware;
use Middleware\AuthMiddleware;

return function(App $app){
$app->group('/Mozo',function(){
    $this->post('/TomarPedido',MozosController::class.':TomarPedido');
    $this->post('/ServirPedido',MozosController::class.':ServirPedido');
    $this->post('/CobrarPedido',MozosController::class.':CobrarPedido');
    $this->post('/TomarFotografia',MozosController::class.':TomarFotografia');
})->add(AuthMiddleware::class.':IsLoggedIn')
->add(RoleMiddleware::class . ':esMozo');
$app->get('/MostrarMenu', MozosController::class . ':MostrarMenu');
};
//cambiar estado de los pedidos a Cerrado
//agregar la foto a las mesas
//hacer el cuestionario