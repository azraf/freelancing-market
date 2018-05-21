<?php
namespace Libs;
/**
 * 
 */
class Input {
	public static function exists($type = 'post')
	{
	 switch ($type) {
		 case 'post':
			 return (!empty($_POST)) ? true : false;
			 break;
		 case 'get':
			 return (!empty($_GET)) ? true : false;
			 break;
		 
		 default:
			  return false;
			 break;
	 }	
		
	}

	public static function get($item,$trim=true)
	{
	 if (isset($_POST[$item])) {
		 return ($trim) ? trim($_POST[$item]) : $_POST[$item];
	 } else if(isset($_GET[$item])) {
		return ($trim) ? trim($_GET[$item]) : $_GET[$item];
	 }
	 return false;
	}


    public static function getSafe($item)
    {
        if (isset($_POST[$item])) {
            return htmlspecialchars(trim($_POST[$item]));
        } else if(isset($_GET[$item])) {
            return htmlspecialchars(trim($_GET[$item]));
        }
        return '';
    }
}



?>