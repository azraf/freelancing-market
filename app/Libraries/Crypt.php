<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 12/9/2017
 * Time: 8:53 PM
 */

namespace Libs;

use \RNCryptor\RNCryptor\Encryptor;
use \RNCryptor\RNCryptor\Decryptor;

class Crypt
{
    public static $salt = 's%U7O2*0';

    public static function encrypt($str)
    {
        $cryptor = new Encryptor;
        return $cryptor->encrypt($str, self::$salt);
    }

    public static function decrypt($str)
    {
        $cryptor = new Decryptor;
        return $cryptor->decrypt($str, self::$salt);
    }

    public static function serialize($data)
    {
        $cryptor = new Encryptor;
        return $cryptor->encrypt(json_encode($data), self::$salt);
    }

    public static function getSerialize($str)
    {
        $cryptor = new Decryptor;
        return json_decode($cryptor->decrypt($str, self::$salt), true);
    }
}