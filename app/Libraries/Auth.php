<?php
namespace Libs;
include_once  dirname(__DIR__) . '/Config/Database.php';
use PHPAuth\Config as AuthConfig;
use \PDO;

class Auth
{
    public $dbh;
    public $config, $auth;

    public function __construct()
    {
        $this->dbh = new PDO("mysql:host=".DBHOST.";dbname=".DBNAME, DBUSER, DBPASS);
        $this->config = new AuthConfig($this->dbh);
        $this->auth = new BaseAuth($this->dbh, $this->config);
    }

    public function isLoggedIn()
    {
        return $this->auth->isLogged();
    }

    /**
     * Authenticates a user with the system.
     * Note: You need to set the session, the method
     * does not do this for you! Name of the cookie;
     * 'authID'. Value of this cookie should be the returned hash.

    Parameters:

    $email (string): User's email address
    $password (string): User's password
    $remember (boolean): Remember me checkbox value (temporary or permanent session)
    $captcha (string): captcha code if needed, default NULL
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
    hash (string): The session hash to be stored in the session cookie
    expire (int): Timestamp of session expiry time
     *
     * login($email, $password, $remember = 0, $captcha = NULL)
     */
    public function login($email, $password, $remember = 0, $captcha = NULL)
    {
        $login = $this->auth->login($email, $password, $remember, $captcha);
        if($login['error'] == false){
            Session::setUser($login['id']);
//            if($remember == true){
                setcookie('authID', $login["hash"], $login["expire"]);
//            }
            $flash = [
                'name' => 'Success'
                , 'level' => 'success'
                , 'message' => 'You have successfully Logged IN'
            ];
            Session::setFlash($flash);
//            return $login;
            return true;
        } else {
            $flash22 = [
                'name' => 'OPSS! Something Goes Wrong!'
                , 'level' => 'danger'
                , 'message' => $login['message']
            ];
            Session::setFlash($flash22);
            return false;
        }
    }



    /**
     * Logs a user in
     * @param string $email
     * @param string $password
     * @param int $remember
     * @param string $captcha = NULL
     * @return array $return
     */
    public function userLogin($email, $password, $remember = 0, $captcha = NULL)
    {
        $return['error'] = true;

        $block_status = $this->isBlocked();

        if ($block_status == "verify") {
            if ($this->checkCaptcha($captcha) == false) {
                $return['message'] = $this->lang["user_verify_failed"];

                return $return;
            }
        }

        if ($block_status == "block") {
            $return['message'] = $this->lang["user_blocked"];
            return $return;
        }

        $validateEmail = $this->validateEmail($email);
        $validatePassword = $this->validatePassword($password);

        if ($validateEmail['error'] == 1) {
            $this->addAttempt();
            $return['message'] = $this->lang["email_password_invalid"];

            return $return;
        } elseif ($validatePassword['error'] == 1) {
            $this->addAttempt();
            $return['message'] = $this->lang["email_password_invalid"];

            return $return;
        } elseif ($remember != 0 && $remember != 1) {
            $this->addAttempt();
            $return['message'] = $this->lang["remember_me_invalid"];

            return $return;
        }

        $uid = $this->getUID(strtolower($email));

        if (!$uid) {
            $this->addAttempt();
            $return['message'] = $this->lang["email_password_incorrect"];

            return $return;
        }

        $user = $this->getBaseUser($uid);

        if (!password_verify($password, $user['password'])) {
            $this->addAttempt();
            $return['message'] = $this->lang["email_password_incorrect"];

            return $return;
        }

        if ($user['isactive'] != 1) {
            $this->addAttempt();
            $return['message'] = $this->lang["account_inactive"];

            return $return;
        }

        $sessiondata = $this->addSession($user['uid'], $remember);

        if ($sessiondata == false) {
            $return['message'] = $this->lang["system_error"] . " #01";

            return $return;
        }

        $return['error'] = false;
        $return['message'] = $this->lang["logged_in"];

        $return['hash'] = $sessiondata['hash'];
        $return['expire'] = $sessiondata['expiretime'];
        $return['id'] = $uid;

        return $return;
    }



    /**
     * Handles the registration of a new user.
     * @params
     * $email (string): User's email address
    $password (string): User's password
    $repeatpassword (string): User's password confirmation
    $params (array): additional params to set in users table (attr_name => value), default Array()
    $captcha (string): captcha code if needed, default NULL
    $sendmail (boolean): enable/disable email activation, default NULL
     *
     * $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     *
     * register($email, $password, $repeatpassword, $params = Array(), $captcha = NULL, $sendmail = NULL)
     */

    public function register($email, $password, $repeatpassword, $params=Array(), $captcha=NULL, $sendmail=NULL)
    {
       return $this->auth->register($email, $password, $repeatpassword, $params, $captcha, $sendmail);
    }


    // changePassword($uid, $currpass, $newpass, $repeatnewpass, $captcha = NULL)
    public function changePassword($uid, $currpass, $newpass, $repeatnewpass)
    {
//        $passwordold = Input::get('passwordold');
//        $password = Input::get('password');

        return $this->auth->changePassword($uid, $currpass, $newpass, $repeatnewpass);
    }

    /**
     * Hashes provided password with Bcrypt
     * @param string $password
     * @param string $password
     * @return string
     */

    public function getHash($password)
    {
        return $this->auth->getHash($password);
//        return password_hash($password, PASSWORD_BCRYPT, ['cost' => $this->config->bcrypt_cost]);
    }


    /**
     *Activates a user's account with the activation key sent via email
     * Parameters:
    $key (string): The user's activation key
     *
     * $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
    public function activate($str)
    {
        $this->auth->activate($str);
    }

    /**
     * Creates a password reset request for a given email address and sends email
     * @param $email
     *
     * $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
    public function reset($email)
    {
        $this->auth->requestReset($email);
    }

    /**
     * Terminates a given session
     * Parameters:

    $hash (string): User's session hash
    Returns:

    (boolean)
     */
    public function logout()
    {
        Session::unsetInfo();
        Session::unsetUser();
//        Session::delete($this->_sessionName);
//        Cookie::delete($this->_cookieName);
        $hash = $this->auth->getSessionHash();
        $this->auth->logout($hash);
    }

    /**
     * Hashes a given string with the provided salt using bcrypt

    Parameters:

    $string (string): String to hash
    $salt (string): Salt to hash the string with
    Returns:

    (string)
     */
//    public function getHash()
//    {
//        $this->auth->getHash();
//    }

    /**
     * Gets the user's ID associated with a given email address
     *
     * Parameters:

    $email (string): User's email address
    Returns:

    $id (int): User's ID
     *
     */
    public function getUID()
    {
        $this->auth->getUID();
    }


    /***
     *Creates a session for a given UID

    Parameters:

    $uid (int): User's ID
    $remember (boolean): Remember me checkbox value (temporary or permanent session)
    Returns:

    $data (array)
    hash (string): The session hash to be stored in the session cookie
    expire (int): Timestamp of session expiry time
     */
    public function addSession()
    {
//        $this->auth->addSession();
    }

    /**
     *
     * Removes all existing sessions for a given UID
     *
     * Parameters:

    $uid (int): User's ID
    Returns:

    (boolean)
     */
    public function deleteExistingSessions()
    {
//        $this->auth->deleteExistingSessions();
    }

    /**
     * Deletes the session associated with a given session hash

    Parameters:

    $hash (string): The session hash
    Returns:

    (boolean)
     */
    public function deleteSession()
    {
//        $this->auth->deleteSession();
    }

    /**
     * Checks if a session hash is valid

    Parameters:

    $hash (string): The session hash
    Returns:

    (boolean)
     */
    public function checkSession()
    {
        $this->auth->checkSession();
    }

    /**
     * Retrieves the UID associated with a given session hash

    Parameters:

    $hash (string): The session hash
    Returns:

    $uid (int): User's ID
     */
    public function getSessionUID()
    {
        $this->auth->getSessionUID();
    }

    /**
     * Checks if an email is already in use by another user

    Parameters:

    $email (string): An email address
    Returns:

    (boolean)
     */
    public function isEmailTaken()
    {
        $this->auth->isEmailTaken();
    }

    /**
     * Adds a new user to the database

    Parameters:

    $email (string): User's email address
    $password (string): User's password
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
    public function addUser()
    {
//        $this->auth->addUser();
    }

    /**
     *  Gets user data for a given UID

    Parameters:

    $uid (int): User's ID
    Returns:

    $data (array)
    email (string): User's email address
    password (string): User's password
    salt (string): User's salt
    isactive (boolean): Is user's account activated
    uid (int): User's ID
     */
    public function getUser()
    {
        $this->auth->getUser();
    }

    /**
     * Delete's a user's account, sessions and requests

    Parameters:

    $uid (int): User's ID
    $password (string): User's password
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
    public function deleteUser()
    {
        $this->auth->deleteUser();
    }

    /**
     * Creates a new password reset / activation request for a given user and sends the email

    Parameters:

    $uid (int): User's ID
    $email (string): User's email address
    $type (string): Type of request (activation or reset)
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
    public function addRequest()
    {
//        $this->auth->addRequest();
    }

    /**
     * Returns request data based on request key and type

    Parameters:

    $key (string): Request key
    $type (string): Type of request (activation or reset)
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    id (int): Request ID
    uid (int): User's ID
     */
    public function getRequest()
    {
        $this->auth->getRequest();
    }

    /**
     * Deletes a request by request ID

    Parameters:

    $id (int): Request ID
    Returns:

    (boolean)
     */
    public function deleteRequest()
    {
//        $this->auth->deleteRequest();
    }

    /**
     * Checks if a password meets specific length and strength requirements

    Parameters:

    $password (string): User's password
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
     */
    public function validatePassword()
    {
//        $this->auth->validatePassword();
    }

    /**
     * Checks if an email address is valid and is not banned

    Parameters:

    $email (string): User's email address
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
     */
    public function validateEmail()
    {
//        $this->auth->validateEmail();
    }

    /**
     * Allows a user to change their password with a password reset request key

    Parameters:

    $key (string): Request key
    $password (string): User's password
    $repeatpassword (string): User's password confirmation
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
    public function resetPass()
    {
        $this->auth->resetPass();
    }

    /**
     *Allows a user to resend an activation email

    Parameters:

    $email (string): User's email address
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
    public function resendActivation()
    {
        $this->auth->resendActivation();
    }

    /**
     * Allows a user to change their password

    Parameters:

    $uid (int): User's ID
    $currpass (string): User's current password
    $newpass (string): User's new password
    $repeatnewpass (string): User's new password confirmation
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
//    public function changePassword()
//    {
//       return $this->auth->changePassword();
//    }

    /**
     *Allows a user to change their email address

    Parameters:

    $uid (int): User's ID
    $email (string): User's new email address
    $password (string): User's password
    Returns:

    $return (array)
    error (boolean): Informs whether an error was encountered or not
    message (string): User-friendly error / success message
     */
    public function changeEmail()
    {
        $this->auth->changeEmail();
    }

    /**
     * Checks if an IP is temporarily blocked from the system

    Parameters:

    Void

    Returns:

    (boolean)
     */
    public function isBlocked()
    {
        $this->auth->isBlocked();
    }

    /**
     *  Increments the attempt counter for the current IP
    Parameters:
    Void
    Returns:
    (boolean)
     */
    public function addAttempt()
    {
//        $this->auth->addAttempt();
    }

    /**
     * Resets the attempt counter for a given IP

    Parameters:

    $ip (string): User's IP
    Returns:

    (boolean)
     */
    public function deleteAttempts()
    {
//        $this->auth->deleteAttempts();
    }

    /**
     * Provides a randomly generated string

    Parameters:

    $length (int): Randomly generated string length
    Returns:

    $key (string): Randomly generated string
     */
    public function getRandomKey()
    {
        $this->auth->getRandomKey();
    }

    /**
     * Provides the current user's IP

    Parameters:

    Void

    Returns:

    $ip (string): User's IP
     */
    public function getIp()
    {
//        $this->auth->getIp();
    }

    /**
     *Verifies the entered password against the stored hash.
     * If the bcrypt_cost setting are now stronger than when the password was
     * originally hashed and stored in the database, the password will be
     * rehashed and the database-entry replaced by the new value.

    Parameters:

    $password (string): Password to verify.
    $hash (string): Hash to to verify password against.
    $uid (int): User's id.
    Returns:

    (boolean)
     */
    public function password_verify_with_rehash()
    {
        $this->auth->password_verify_with_rehash();
    }

}


?>