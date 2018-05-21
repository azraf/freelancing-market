<?php
namespace Libs;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Validator extends Gump
{
    public static $entity;
    public $valid_yes=false;
    public $valid_no=false;
    public $returnItem=null;
//    public $rules = [
//            'username'    => 'required|alpha_numeric|max_len,100|min_len,6',
//            'password'    => 'required|max_len,100|min_len,6',
//            'email'       => 'required|valid_email',
//            'gender'      => 'required|exact_len,1',
//            'credit_card' => 'required|valid_cc',
//            'bio'		  => 'required'
//            ];
//

    public function __construct()
    {
        parent::__construct();
//        $this->_boot();
    }

    public static function getInstance()
    {
        return self::$entity = self::get_instance();
    }

    private function _boot()
    {
        self::get_instance();
        self::$entity->set_error_message([
            'validate_required' => 'The {field} field can not be empty'
            , 'validate_numeric' => 'The {field} field must be a number, {param} is not a number'
            , 'validate_min_len' => 'The {field} minimum length is 6, {param} has not'
            , 'validate_max_len' => 'The {field} maximum length is xx, {param} has not'
            , 'validate_valid_email' => 'The {field} is not a valid email address, check {param}'
        ]);
    }

    /**
     * @param $items
     * @param $rules
     * @param bool $filters
     * @param bool $filterAfterValidate
     * @return array
     *
     * Run Check:
     *  $validation = $validator->check($_POST, [
    'password'    => 'required|max_len,100|min_len,6',
    'email'       => 'required|valid_email'
    ]);

    if (!$validation['error']) {
      // Validation OK
       } else {
    $flash = [
    'name' => 'Not Valid!'
    , 'level' => 'danger'
    , 'message' => $validation['error']
    ];
    Session::setFlash($flash);
    }
     *
     */
    public function check($items, $rules, $filters=false, $filterAfterValidate=false)
    {
        $ret = ['success'=>false,'error'=>false,'return'=>false];
        self::getInstance();
        if($filters && ($filterAfterValidate !=true)){
            $items = self::$entity->filter($items, $filters);
        }
        $validated = self::$entity->validate(
            $items, $rules
        );
        if ($validated === TRUE) {
            if($filters && $filterAfterValidate){
                $items = self::$entity->filter($items, $filters);
                $ret['success'] = true;
                $ret['return'] = $items;

                return $ret;
            }
            $ret['success'] = true;
            return $ret;
        } else {
            $ret['error'] = $validated;
            return $ret;
        }
    }

    public function token(Request $input,$tokenName='token')
    {
        if(Token::check($input->{$tokenName})) {
            return true;
        }
        $flash = [
            'name' => 'OPSS!!'
            , 'level' => 'danger'
            , 'message' => 'Reload the page and submit form again. [Token Missing]!'
        ];
        Session::setFlash($flash);
        return false;
    }

    public function fails()
    {
        return self::$entity->get_errors_array();
    }

    public function errors()
    {
//        return self::$entity->errors;
        return self::$entity->get_errors_array();
    }

    protected function unique($field, $value, $table)
    {
        $results = DB::select('select ' . $field . ' from ' . $table . ' where ' . $field . ' = :id', ['id' => $value]);
        if (count($results) > 0) {
            return false;
        }
        return true;
    }

    public static function getUnique($field,$table,$length=false,$try=0)
    {
        $unique_id = unqId($length);
        $results = DB::select('select ' . $field . ' from ' . $table . ' where ' . $field . ' = :id', ['id' => $unique_id]);
        if (count($results) > 0 && $try < 11) {
            $try ++;
            self::getUnique($field,$table,$length,$try);
        } else if($try < 10) {
            return false;
        } else if(!count($results)){
            return $unique_id;
        }
        return false;
    }
}


?>