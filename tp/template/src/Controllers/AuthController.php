<?php

namespace Controllers;
use Helpers\JWTAuth;
use Models\User;

class AuthController
{
  public static function LogIn($request, $response, $args)
  {
    $data = json_decode($request->getBody());
    if(!isset($data->nombre) || !isset($data->clave))
      return $response->withJson("ingrese nombre/clave", 400);

    $user = User::FindByUsername($data->nombre);
    
    if(!is_null($user))
    {
      if(!password_verify($data->clave, $user->clave))
      {
        return $response->withJson("invalid nombre/clave");
      }
    }
    else{
      return $response->withJson("invalid nombre/clave");      
    }

    $obj = [
      "id" => $user->id,
      "nombre" => $user->nombre,
      "role" => $user->role
    ];
    return  JWTAuth::CreateToken($obj);
  }

  public static function Register($request, $response, $args)
  {
    $data = json_decode($request->getBody());

    if(!isset($data->nombre) || !isset($data->clave))
      return $response->withJson("ingrese nombre/clave", 400);

    $user = new User;
    $user->nombre = $data->nombre;

    $user->clave = password_hash($data->clave, PASSWORD_DEFAULT);
    $user->role = $data->role;

    $user->save();
    return self::LogIn($request, $response, $args);
  }

  public static function ChangePassword()
  {
  }
}
