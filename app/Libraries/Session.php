<?php

namespace Libs;

use \Aura\Session\SessionFactory;
use \RNCryptor\RNCryptor\Encryptor;
use \RNCryptor\RNCryptor\Decryptor;

/**
 *
 */
class Session extends SessionFactory
{
    public static $encrypt_key = 'enc_value';
    public static $encryption_pass = 's%U7O2*0';
    public static $userInfo = 'userInfo';
    public static $adminInfo = 'adminInfo';
    public static $backUrl = 'back_url';

    public static function exists($name)
    {
        return (isset($_SESSION[$name])) ? true : false;
    }

    /**
     * @param bool $cmd
     * @return array
     * $page->data['ajaxToken'] = Session::getAjaxToken(1);
     *          or
     * Session::ajaxToken();
     * ajax: {
     * "url": "<?php echo url('api-url.php');?>"
     * , "type": "POST"
     * , "data": {"<?php echo $_SESSION['csrf_ajax_key'];?>": "<?php echo $_SESSION['csrf_ajax_val'];?>"}
     * }
     * ,
     * in api-script.php
     * if(
     * //Check required variables are set
     * isset($_SESSION['csrf_ajax_key']) &&
     * isset($_SESSION['csrf_ajax_val']) &&
     * isset($_POST[$_SESSION['csrf_ajax_key']]) &&
     * isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
     *
     * //Check is AJAX
     * strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest' &&
     *
     * //Check is POST
     * $_SERVER['REQUEST_METHOD'] === 'POST' &&
     *
     * //Check POST'ed keys match the session keys
     * $_SESSION['csrf_ajax_val'] == $_POST[$_SESSION['csrf_ajax_key']]
     * ){
     * //    Session::ajaxToken('end');
     * echo returnData();
     * } else {
     * echo '';
     * }
     */
    public static function ajaxToken($cmd = false)
    {
        if ($cmd == false) {
            $_SESSION['csrf_ajax_key'] = sha1(uniqid());
            $_SESSION['csrf_ajax_val'] = sha1(uniqid());
        } else if ($cmd == 'end') {
            unset($_SESSION['csrf_ajax_key'], $_SESSION['csrf_ajax_val']);
        } else if ($cmd == 'get') {
            return ['csrf_ajax_key' => self::get('csrf_ajax_key'), 'csrf_ajax_val' => $_SESSION['csrf_ajax_val']];
        } else if ($cmd == 'new') {
            return ['csrf_ajax_key' => self::get('csrf_ajax_key'), 'csrf_ajax_val' => $_SESSION['csrf_ajax_val']];
        }
    }

    public static function getAjaxToken($new = false)
    {
        $sessionCheck = self::exists('csrf_ajax_key');
        if (!$new && $sessionCheck) {
            return ['csrf_ajax_key' => self::get('csrf_ajax_key'), 'csrf_ajax_val' => $_SESSION['csrf_ajax_val']];
        } else {
            $session_key = $_SESSION['csrf_ajax_key'] = sha1(uniqid());
            $session_val = $_SESSION['csrf_ajax_val'] = sha1(uniqid());
            return ['csrf_ajax_key' => $session_key, 'csrf_ajax_val' => $session_val];
        }
    }

    public static function put($name, $value)
    {
        return $_SESSION[$name] = $value;
    }

    public static function get($name)
    {
        return $_SESSION[$name];
    }

    public static function delete($name)
    {
        if (self::exists($name)) {
            unset($_SESSION[$name]);
        }
    }

    public static function flash($name, $string = '')
    {
        if (self::exists($name)) {
            $session = self::get($name);
            self::delete($name);
            return $session;
        } else {
            self::put($name, $string);
            return false;
        }
    }

    /**
     * @param $array
     *
     * $flash = [
     * 'name' => 'Success!!'
     * , 'level' => 'success'
     * , 'message' => 'You have successfully submitted proof and Your work is under review to client'
     * ];
     * $flash2 = [
     * 'name' => 'OPSS!!'
     * , 'level' => 'danger'
     * , 'message' => 'Something goes wrong!'
     * ];
     * $flash3 = [
     * 'name' => 'Wait'
     * , 'level' => 'warning'
     * , 'message' => 'Wait for your Client Approval'
     * ];
     * Session::setFlash($flash);
     * Session::setFlash($flash2);
     * Session::setFlash($flash3);
     *
     *
     * in view:
     *  Session::cleanFlash();
     *
     */
    public static function setFlash($array)
    {
        $_SESSION['notifications'][] = [
            'name' => $array['name']
            , 'level' => $array['level']
            , 'message' => $array['message']
        ];
    }

    public static function cleanFlash()
    {
        self::delete('notifications');
    }

    /**
     * @param bool $url
     * @return bool | string
     */
    public static function backUrl($url = false)
    {
        if ($url) {
            $_SESSION[self::$backUrl] = $url;
        } else {
            $exist = self::exists(self::$backUrl);
            if ($exist) {
                $url = $_SESSION[self::$backUrl];
                unset($_SESSION[self::$backUrl]);
                return $url;
            } else {
                return false;
            }
        }
    }

    public static function getBackUrl()
    {
        $exist = self::exists(self::$backUrl);
        if ($exist) {
            return $_SESSION[self::$backUrl];
        } else {
            return false;
        }
    }

    /**
     * @param $data
     *
     * use \Libs\Session;
     * Example Use
     *  $session = new \Libs\Session;
     *
     *  $data1 = [
     *  'jobid'=>123,'clientid'=>234,'freelancerid'=>23
     *  ];
     *  _d($data1,'$data1');
     *  Session::encpArray($data1);
     *  _d($_SESSION[$session::$encrypt_key], 'Session: Encrypted');
     *  $return = Session::getEncpArray();
     *  _d($return, '$return');
     *  Session::setEncpId(['jobid'=>9854]);
     *  $return2 = Session::getEncpArray();
     *  _d($return2, '$return2');
     *  $clientid = Session::getEncpValue('clientid');
     *  _d($clientid,'$clientid');
     *
     */

    public static function encpArray($data)
    {
        $cryptor = new Encryptor;
        $_SESSION[self::$encrypt_key] = $cryptor->encrypt(json_encode($data), self::$encryption_pass);
    }

    public static function setEncpId($array)
    {
        if (isset($_SESSION[self::$encrypt_key])) {
            $cryptor = new Decryptor;
            $data = json_decode($cryptor->decrypt($_SESSION[self::$encrypt_key], self::$encryption_pass), true);
        } else {
            $data = [];
        }
        foreach ($array as $k => $v) {
            $data[$k] = $v;
        }
        $encryptor = new Encryptor;
        $_SESSION[self::$encrypt_key] = $encryptor->encrypt(json_encode($data), self::$encryption_pass);
    }

    /**
     * @return bool|mixed object
     */
    public static function getEncpData()
    {
        if (isset($_SESSION[self::$encrypt_key])) {
            $cryptor = new Decryptor;
            return json_decode($cryptor->decrypt($_SESSION[self::$encrypt_key], self::$encryption_pass));
        } else {
            return false;
        }
    }

    /**
     * @return bool | encrypted data
     */
    public static function encrypted()
    {
        if (isset($_SESSION[self::$encrypt_key])) {
            return $_SESSION[self::$encrypt_key];
        } else {
            return false;
        }
    }

    /**
     * @return bool|mixed array
     */
    public static function getEncpArray()
    {
        if (isset($_SESSION[self::$encrypt_key])) {
            $cryptor = new Decryptor;
            return json_decode($cryptor->decrypt($_SESSION[self::$encrypt_key], self::$encryption_pass), true);
        } else {
            return false;
        }
    }

    public static function getEncpValue($key)
    {
        if (isset($_SESSION[self::$encrypt_key])) {
            $cryptor = new Decryptor;
            $arr = json_decode($cryptor->decrypt($_SESSION[self::$encrypt_key], self::$encryption_pass));
            return $arr->{$key};
        } else {
            return false;
        }
    }

    /**
     *
     * User Roles:: `userrole` : user, admin
     * possible Session keys: `userrole` , `usrid`, `time` `jobid`, `propsid`
     *
     */
    public static function setUser($id)
    {
        self::setEncpId([
            'userrole' => 'user'
            , 'userid' => $id
            , 'time' => time()
        ]);
    }

    public static function setInfo($data)
    {
        $_SESSION[self::$userInfo] = $data;
    }

    /**
     *
     * @return bool
     *
     * Session::getInfo()
     * 'id'
     * 'userid'
     * 'username'
     * 'name'
     * 'email'
     * 'country_id'
     * 'country'
     * 'balance'
     *
     */
    public static function getInfo()
    {
        if (self::exists(self::$userInfo)) {
            return self::get(self::$userInfo);
        }
        return false;
    }

    public static function noInfo()
    {
        if (self::exists(self::$userInfo)) {
            return false;
        }
        return true;
    }

    public static function unsetInfo()
    {
        if (self::exists(self::$userInfo)) {
            unset($_SESSION[self::$userInfo]);
        }

    }

    public static function unsetUser()
    {
        unset($_SESSION[self::$encrypt_key]);
        self::ajaxToken('end');
    }


    public static function noAdmin()
    {
        if (self::exists(self::$adminInfo)) {
            return false;
        }
        return true;
    }

    public static function getAdmin()
    {
        if (self::exists(self::$adminInfo)) {
            return self::get(self::$adminInfo, false);
        }
        return false;
    }

    public static function setAdmin($id)
    {
        self::setEncpId([
            'userrole' => 'admin'
            , 'userid' => $id
            , 'time' => time()
        ]);
    }

    public static function unsetAdmin()
    {
        unset($_SESSION[self::$encrypt_key]);
        unset($_SESSION[self::$adminInfo]);
        self::ajaxToken('end');
    }

    public static function getUserId()
    {
        if (isset($_SESSION[self::$encrypt_key])) {
            $cryptor = new Decryptor;
            $obj = json_decode($cryptor->decrypt($_SESSION[self::$encrypt_key], self::$encryption_pass));
            if (isset($obj->userid)) {
                return $obj->userid;
            }
        }
        return false;
    }


    /**
     * @return bool
     * return values: 'admin' | 'user' | false
     */
    public static function getRole()
    {
        if (isset($_SESSION[self::$encrypt_key])) {
            $cryptor = new Decryptor;
            $obj = json_decode($cryptor->decrypt($_SESSION[self::$encrypt_key], self::$encryption_pass));
            if (isset($obj->userrole)) {
                return $obj->userrole;
            }
        }
        return false;
    }
}


?>