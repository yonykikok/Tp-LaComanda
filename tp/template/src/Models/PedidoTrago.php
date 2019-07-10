<?php
namespace Models;

use Helpers\AppConfig as Config;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
class PedidoTrago extends Model
{
  protected $table = "pedidosTrago";
  public $timestamps = false;

  public static function LastInsertId()
  {
    $pedidoTrago =  PedidoTrago::select("id")->orderBy("id", "desc")->first();
    return is_null($pedidoTrago) ? 0 : $pedidoTrago->id;
  } 
  public static function MostrarPedido($orden){
    $retorno='';
    $pedidosTrago=PedidoTrago::where("orden",$orden)->get();
    foreach ($pedidosTrago as $indice => $pedido) {
      $trago=Trago::where('id',$pedido->idTrago)->first();
      $retorno.=$pedido->cantidad.' '.$trago->nombre.'<br>';
    } 
    return $retorno;
  }
  public static function CalcularCostoDelPedido($orden)
  {
    $sumaAPagar=0;
    $pedidos= PedidoTrago::where('orden',$orden)->get();
    if(count($pedidos)>0)
    {
      foreach ($pedidos as $indice => $pedido) 
      {
        $trago=Trago::where('id',$pedido->idTrago)->first();
        $sumaAPagar=$sumaAPagar+$trago->precio;
        echo $trago->nombre.' --- $'.$trago->precio.'<br>';
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
