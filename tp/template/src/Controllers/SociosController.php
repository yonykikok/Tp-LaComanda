<?php

namespace Controllers;

use Models\PedidoComida;
use Models\PedidoBebida;
use Models\PedidoPostre;
use Models\PedidoTrago;
use Models\PedidoMozo;
use Models\Mesa;
use Models\Cliente;
use Controllers\ClientesController;
use Helpers\JWTAuth;
use Helpers\AppConfig as Config;
use Helpers\FilesHelper as Files;
use Helpers\ImagesHelper as Images;

use Controllers\MozosController;
use Illuminate\Database\Capsule\Manager as Capsule;

class SociosController
{
  public static function VerPedidos($request, $response, $args)
  {
    $pedidos= PedidoMozo::all();
    foreach ($pedidos as $indice => $pedido) {
      echo "Pedido '".$pedido->orden."' de la mesa ".$pedido->mesa.' '.$pedido->estado.'<br>';
    }
  }
  public static function VerPedidosEnPreparacion($request, $response, $args)
  {
    $pedidos= PedidoMozo::where('estado',"en preparacion")->get();
    foreach ($pedidos as $indice => $pedido) {
      echo "Pedido '".$pedido->orden."' de la mesa ".$pedido->mesa.' '.$pedido->estado.'<br>';
    }
  }
  public static function VerPedidosTerminados($request, $response, $args)
  {
    $pedidos= PedidoMozo::where('estado','en camino')->get();
    foreach ($pedidos as $indice => $pedido) {
      echo "Pedido '".$pedido->orden."' de la mesa ".$pedido->mesa.' '.$pedido->estado.'<br>';
    }
  }  
  public static function VerPedidoPorOrden($request, $response, $args)
  {
    $datos=$request->getParsedBody();
    if(isset($datos['orden']))
    {
      $pedido= PedidoMozo::where('orden',$datos['orden'])->get()->first();
     
      if(is_null($pedido))
      {
        echo 'No se encontro el pedido: '.$datos['orden'];
      }
      else
      {
        echo "<h3>Pedido '".$pedido->orden."' de la mesa '".$pedido->mesa."' ".$pedido->estado.'</h3><br>';        
        ClientesController::verEstado($request, $response, $args);
      }
    }
    else{
      echo 'ingrese la orden a buscar';
    }
  }
  public static function LiberarMesasCerradas()
  {
    $mesas=Mesa::where('estado','cerrada')->get();
    if(count($mesas)>0)
    {
      foreach ($mesas as $indice => $mesa) {
        $mesa->estado='libre';
        $mesa->save();
      }
      echo 'Mesas liberadas';
    }
    else
    {
      echo 'No hay mesas cerradas';
    }
  }
  public static function CerrarMesa($request,$response,$args)
  {
    $data=$request->getParsedBody();
    if(isset($data['mesa']))
    {
      $pedido=PedidoMozo::where('mesa',$data['mesa'])->first(); 
      $mesa=Mesa::where('mesa',$data['mesa'])->first(); 
      if(!is_null($pedido) && count($pedido)>0 && !is_null($mesa) && count($mesa)>0)
      {
        $totalACobrar= MozosController::CalcularTotalAPagarPorElPedido($pedido->orden);
        
        if($mesa->estado=='cliente pagando')
        {
          $mesa->estado='cerrada';
          $mesa->save();
          //echo 'Mesa Cerrarda';
          
        }
      }  
    }
  }
}