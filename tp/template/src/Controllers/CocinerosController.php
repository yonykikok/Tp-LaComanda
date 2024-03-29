<?php

namespace Controllers;

use Models\Mozo;
use Models\Mesa;
use Models\Comida;
use Models\Cliente;
use Models\Bebida;
use Models\Postre;
use Models\Trago;
use Models\PedidoMozo;
use Models\PedidoTrago;
use Models\PedidoBebida;
use Models\PedidoComida;
use Models\PedidoPostre;
use Controllers\MozosController;
use Helpers\JWTAuth;
use Helpers\AppConfig as Config;
use Helpers\FilesHelper as Files;
use Helpers\ImagesHelper as Images;
use Middleware\TokenValidatorMiddleware;
use Illuminate\Database\Capsule\Manager as Capsule;

class CocinerosController //implements IController
{
  public static function PedidosPendientes($request,$response,$args){
    echo '<h4>Comidas</h4>';
      $pedidosPendientesCocina=PedidoComida::where('estado','pendiente')->get();
    if(count($pedidosPendientesCocina)>0)
    {
      foreach ($pedidosPendientesCocina as $indice => $pedido) {
        $comida=Comida::where('id',$pedido->idComida)->get()->first();       
        echo $comida->nombre.' >>> Orden: '.$pedido['orden'].'<br>';
        }
    }
    else{
      echo 'Sin comidas pendientes';
    }
    echo '<h4>Postres</h4>';
    $pedidosPendientesCocina=PedidoPostre::where('estado','pendiente')->get();
    if(count($pedidosPendientesCocina)>0)
    {
      foreach ($pedidosPendientesCocina as $indice => $pedido) {
        $postre=Postre::where('id',$pedido->idPostre)->get()->first();       
        echo $postre->nombre.' >>> Orden: '.$pedido['orden'].'<br>';
        }
    }
    else{
      echo 'Sin postres pendientes';
    }
  }


  public static function CocinarPedido($request,$response,$args)
  {
    $data=$request->getParsedBody();
    if(is_null($data))
    {
      $pedido=PedidoComida::where('estado','pendiente')->get()->first();//obtengo el pedido que le sigue por orden
      self::CambiarEstado($pedido,'pendiente','en preparacion',$data['orden']);
    }
    else
    {
      if(isset($data['orden']))// si ingresa una orden la busca y le da prioridad a esa orden
      {
        $pedido=PedidoComida::where('estado','pendiente')->where('orden',$data['orden'])->get()->first();//obtengo el pedido que le sigue por orden
        self::CambiarEstado($pedido,'pendiente','en preparacion',$data['orden']);
      }
      else{
        $pedido=PedidoComida::where('estado','pendiente')->get()->first();//obtengo el pedido que le sigue por orden
        self::CambiarEstado($pedido,'pendiente','en preparacion','');
      }
    }
    ///echo 'Cocinado';
  }
  public static function CambiarEstado($pedido,$estadoActual,$estadoSiguiente,$ordenABuscar)
  {
    if($pedido)
    {
      $pedidosACambiarEstado= PedidoComida::where('orden',$pedido->orden)->get();//obtengo todos los pedidos con la misma orden
      foreach ($pedidosACambiarEstado as $indice => $pedido) 
      {
        $pedido->estado=$estadoSiguiente;//cambiamos su estado
        $pedido->save();//guardamos los cambios
        echo($pedido);
      }
    }
    else
    {
      if($ordenABuscar)
      {
        echo 'No hay pedidos con orden: '.$ordenABuscar;
      }
      else
      {
        echo 'No hay pedidos '.$estadoActual;
      }
    }
  }
  public static function PrepararPostre($request,$response,$args)
  {
    $data=$request->getParsedBody();
    if(is_null($data))
    {
      $pedido=PedidoPostre::where('estado','pendiente')->get()->first();//obtengo el pedido que le sigue por orden
      self::CambiarEstadoPostre($pedido,'pendiente','en preparacion',$data['orden']);
    }
    else
    {
      if(isset($data['orden']))// si ingresa una orden la busca y le da prioridad a esa orden
      {
        $pedido=PedidoPostre::where('estado','pendiente')->where('orden',$data['orden'])->get()->first();//obtengo el pedido que le sigue por orden
        self::CambiarEstadoPostre($pedido,'pendiente','en preparacion',$data['orden']);
      }
      else{
        $pedido=PedidoPostre::where('estado','pendiente')->get()->first();//obtengo el pedido que le sigue por orden
        self::CambiarEstadoPostre($pedido,'pendiente','en preparacion','');
      }
    }
  }

  public static function CambiarEstadoPostre($pedido,$estadoActual,$estadoSiguiente,$ordenABuscar)
  {
    if($pedido)
    {
      $pedidosACambiarEstado= PedidoPostre::where('orden',$pedido->orden)->get();//obtengo todos los pedidos con la misma orden
      foreach ($pedidosACambiarEstado as $indice => $pedido) 
      {
        $pedido->estado=$estadoSiguiente;//cambiamos su estado
        $pedido->save();//guardamos los cambios
        echo($pedido);
      }
    }
    else
    {
      if($ordenABuscar)
      {
        echo 'No hay pedidos con orden: '.$ordenABuscar;
      }
      else
      {
        echo 'No hay pedidos '.$estadoActual;
      }
    }
  }

  public static function TerminarPedido($request,$response,$args)
  {
    $data=$request->getParsedBody();
    if(is_null($data))
    {
      $pedido=PedidoComida::where('estado','en preparacion')->get()->first();//obtengo el pedido que le sigue por orden
      self::CambiarEstado($pedido,'en preparacion','listo para servir',$data['orden']);
    }
    else
    {
      if(isset($data['orden']))// si ingresa una orden la busca y le da prioridad a esa orden
      {
        $pedido=PedidoComida::where('estado','en preparacion')->where('orden',$data['orden'])->get()->first();//obtengo el pedido que le sigue por orden
        self::CambiarEstado($pedido,'en preparacion','listo para servir',$data['orden']);
      }
      else{
        $pedido=PedidoComida::where('estado','en preparacion')->get()->first();//obtengo el pedido que le sigue por orden
        self::CambiarEstado($pedido,'en preparacion','listo para servir','');
      }
    }
  }

  public static function TerminarPedidoPostre($request,$response,$args)
  {
    $data=$request->getParsedBody();
    if(is_null($data))
    {
      $pedido=PedidoPostre::where('estado','en preparacion')->get()->first();//obtengo el pedido que le sigue por orden
      self::CambiarEstadoPostre($pedido,'en preparacion','listo para servir',$data['orden']);
    }
    else
    {
      if(isset($data['orden']))// si ingresa una orden la busca y le da prioridad a esa orden
      {
        $pedido=PedidoPostre::where('estado','en preparacion')->where('orden',$data['orden'])->get()->first();//obtengo el pedido que le sigue por orden
        self::CambiarEstadoPostre($pedido,'en preparacion','listo para servir',$data['orden']);
      }
      else{
        $pedido=PedidoPostre::where('estado','en preparacion')->get()->first();//obtengo el pedido que le sigue por orden
        self::CambiarEstadoPostre($pedido,'en preparacion','listo para servir','');
      }
    }
    if(!is_null($pedido))
    {
      MozosController::ActualizarEstadoPedido($pedido->orden);    
    }
  }

  
}
