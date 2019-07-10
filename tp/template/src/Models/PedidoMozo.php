<?php
namespace Models;

use Helpers\AppConfig as Config;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
class PedidoMozo extends Model
{
  protected $table = "pedidosMozo";
  public $timestamps = false;

  public static function LastInsertId()
  {
    $pedido =  PedidoMozo::select("id")->orderBy("id", "desc")->first();
    return is_null($pedido) ? 0 : $pedido->id;
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
