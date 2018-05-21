<?php
namespace Libs;
/**
 * 
 */
class Token {
	
	public static function generate()
	{
	  return Session::put(AppConfig::get('session/token_name'), md5(uniqid()));
	}
	
	public static function check($token)
	{
	  $tokenName = AppConfig::get('session/token_name');
	  
	  if (Session::exists($tokenName) && $token === Session::get($tokenName)) {
		 Session::delete($tokenName);
		 return true;  
	  }	
	  return false;
	}
}



?>