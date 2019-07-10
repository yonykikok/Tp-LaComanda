<?php
namespace Models;

use Helpers\AppConfig as Config;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
class PedidoBebida extends Model
{
  protected $table = "pedidosBebida";
  public $timestamps = false;

  public static function LastInsertId()
  {
    $pedidoComida =  PedidoBebida::select("id")->orderBy("id", "desc")->first();
    return is_null($pedidoComida) ? 0 : $pedidoComida->id;
  } 
  public static function MostrarPedido($orden){
    $retorno='';
    $pedidosBebida=PedidoBebida::where("orden",$orden)->get();
    foreach ($pedidosBebida as $indice => $pedido) {
      $bebida=Bebida::where('id',$pedido->idBebida)->first();
      $retorno.=$pedido->cantidad.' '.$bebida->nombre.'<br>';
    } 
    return $retorno;
  }
  public static function CalcularCostoDelPedido($orden)
  {
    $sumaAPagar=0;
    $pedidos= PedidoBebida::where('orden',$orden)->get();
    if(count($pedidos)>0)
    {
      foreach ($pedidos as $indice => $pedido) 
      {
        $bebida=Bebida::where('id',$pedido->idBebida)->first();
        $sumaAPagar=$sumaAPagar+$bebida->precio;
        echo $bebida->nombre.' --- $'.$bebida->precio.'<br>';
      }
    }
    return $sumaAPagar;
  }  
  public static function CambiarEstado($orden,$estado,$estadoNuevo)
  {
    $pedidos=self::where('orden',$orden)->get();
    if(!is_null($pedidos) && count($pedidos)>0)
    {
      foreach ($pedidos as $indice => $pedido) {
        if($pedido->estado==$estado)
        {
          $pedido->estado=$estadoNuevo;
          $pedido->save();
        }
      }
    }
  }
}
