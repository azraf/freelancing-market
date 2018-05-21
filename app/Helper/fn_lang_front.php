<?php

header('Cache-control: private'); // IE 6 FIX

use Libs\Cookie;
use Libs\AppConfig as Config;
use Libs\Session;

if (isset($_GET['lang'])) {
	
   $lang = $_GET['lang'];
   $sessionName = Config::get('language/session_name');	
   $cookieName = Config::get('language/cookie_name');	
   
   Session::put($sessionName, $lang);
   Cookie::put($cookieName, $lang, Config::get('language/cookie_expiry'));		
	
}elseif (Session::exists('lang')) {
	$lang = Session::get('lang');
}elseif (Cookie::exists('lang')) {
    $lang = Cookie::get('lang');
    Session::put('lang', $lang);
}else {
	$lang = 'english';
    Session::put('lang', $lang);
}

	switch ($lang) {
	  case 'english':
	  $lang_file = 'lang_english.php';
	  break;

//	  case 'chinese':
//	  $lang_file = 'lang_chinese.php';
//	  break;

	  default:
	  $lang_file = 'lang_english.php';
	
	}
$langPath = ROOTAPPPATH . 'Language/' . $lang_file;

defined("LANGFILE")or define('LANGFILE', $langPath);
?>