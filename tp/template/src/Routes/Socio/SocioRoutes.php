<?php
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use \Slim\App;
use Controllers\SociosController;
use Middleware\RoleMiddleware;
use Middleware\AuthMiddleware;

return function(App $app)
{
  $app->group('/Socio/Pedidos', function()
  {
    $this->get('/', SociosController::class . ':VerPedidos');
    $this->get('/EnPreparacion', SociosController::class . ':VerPedidosEnPreparacion');
    $this->get('/Terminados', SociosController::class . ':VerPedidosTerminados');
    $this->post('/PorOrden', SociosController::class . ':VerPedidoPorOrden');
    $this->post('/CerrarMesa', SociosController::class . ':CerrarMesa');
    $this->post('/LiberarMesas', SociosController::class . ':LiberarMesasCerradas');
    
  })->add(AuthMiddleware::class.':IsLoggedIn')
    ->add(RoleMiddleware::class.':IsAdmin');
};
