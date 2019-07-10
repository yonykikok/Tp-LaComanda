<?php
namespace Models;

use Helpers\AppConfig as Config;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Capsule\Manager as Capsule;
class Encuesta extends Model
{
  protected $table = "encuestas";
  public $timestamps = false;
  
  public static function VerificarExistencia($encuesta)
  {
    $encuesta=self::where('orden',$encuesta->orden)->where('mesa',$encuesta->mesa)->first();
    return $encuesta;
  }
}