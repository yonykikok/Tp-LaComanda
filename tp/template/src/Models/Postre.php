<?php
namespace Models;

use Helpers\AppConfig as Config;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
class Postre extends Model
{
  protected $table = "menupostres";
  public $timestamps = false;

  public static function LastInsertId()
  {
    $postre =  Postre::select("id")->orderBy("id", "desc")->first();
    return is_null($postre) ? 0 : $postre->id;
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
            $postre=new PedidoPostre;
            $postre->cantidad=$cantidadPedida;
            $postre->idPostre=$pedidos[$i];
            $postre->orden=$numeroDeOrden;  
            $postre->estado='pendiente';
            $postre->save();
          }
          else{
            echo '<br>Codigo de menu erroneo :'.$pedidos[$i];
          }
        }
      }
      else{
        if(self::VerificarExistencia($listado['id']))
          {
            $postre=new PedidoPostre;
            $postre->cantidad=$listado['cantidad'];
            $postre->idPostre=$listado['id'];
            $postre->orden=$numeroDeOrden;  
            $postre->estado='pendiente';
            $postre->save();
          }
          else{
            echo '<br>Codigo de menu erroneo :'.$listado['id'];
          }
      }
    }
    else
    {
      $postre=new PedidoPostre;
      $postre->cantidad=0;
      $postre->idPostre=1000;
      $postre->orden=$numeroDeOrden;  
      $postre->estado='pendiente';
      $postre->save();
    }
}
}
