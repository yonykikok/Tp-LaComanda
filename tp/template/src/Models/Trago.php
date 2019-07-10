<?php
namespace Models;

use Helpers\AppConfig as Config;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
class Trago extends Model
{
  protected $table = "menutragos";
  public $timestamps = false;

  public static function LastInsertId()
  {
    $trago =  Trago::select("id")->orderBy("id", "desc")->first();
    return is_null($trago) ? 0 : $trago->id;
  }
  public static function VerificarExistencia($id)
  {
    $retorno=false;
    $menu= self::where('id',$id)->first();
    if(!is_null($menu))
    {
      $retorno=true;
    }
    return $retorno;
  }
 
  public static function ArmarPedido($listado,$numeroDeOrden)
  {
    $cantidades=array();
    $pedidos=array();
    if(!is_null($listado) && count($listado)>0)
    { 
      if( strpos($listado['id'],',')!=false && strpos($listado['cantidad'],',')!=false)
      {
        $cantidades=explode(',',$listado['cantidad']);
        $pedidos=explode(',',$listado['id']);
        for($i=0;$i<count($pedidos);$i++)
        {
          if(self::VerificarExistencia($pedidos[$i]))
          {
              $cantidadPedida=$cantidades[$i];
              $trago=new PedidoTrago;
              $trago->cantidad=$cantidadPedida;
              $trago->idTrago=$pedidos[$i];
              $trago->orden=$numeroDeOrden;  
            $trago->estado='pendiente';
            $trago->save();
          }
          else{
            echo '<br>Codigo de menu erroneo :'.$pedidos[$i];
          }
        }

      }
      else
      {
        if(self::VerificarExistencia($listado['id']))
        {
          $trago=new Pedidotrago;
          $trago->cantidad=$listado['cantidad'];
          $trago->idTrago=$listado['id'];
          $trago->orden=$numeroDeOrden;  
          $trago->estado='pendiente';
          $trago->save();
        }
        else
        {
          echo '<br>Codigo de menu erroneo :'.$listado['id'];
        }
      }
    }
    else
      {
        $trago=new Pedidotrago;
        $trago->cantidad=0;
        $trago->idTrago=1000;
        $trago->orden=$numeroDeOrden;  
        $trago->estado='pendiente';
        $trago->save();
      }
  }
  }
