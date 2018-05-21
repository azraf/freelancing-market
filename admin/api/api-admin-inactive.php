<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';

use Libs\Input;
use Libs\Session;
use Models\Admin;

$role = Session::getRole();
$retUrl = Session::backUrl();
$user_id = Session::getUserId();
if ($role == 'admin') {
    // check if the 'serial' variable is set in URL, and check that it is valid
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        $id = Input::get('id');
        if ($id == $user_id) {
            $flash = [
                'name' => 'No No No!'
                , 'level' => 'danger'
                , 'message' => 'You can not make yourself inactive!'
            ];
        } else {
            $model = Admin::find($id);
            $model->isactive = 0;
            if ($model->save()) {
                $flash = [
                    'name' => 'DONE!'
                    , 'level' => 'info'
                    , 'message' => 'The Admin has been Inactivated'
                ];

            } else {
                $flash = [
                    'name' => 'OPS!'
                    , 'level' => 'danger'
                    , 'message' => 'The Admin inactivation Failed!'
                ];
            }
        }
        Session::setFlash($flash);
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'Admin inactivation request has been Failed!'
        ];
        Session::setFlash($s2);
    }
} else {
    $s2 = [
        'name' => 'OPS!'
        , 'level' => 'danger'
        , 'message' => 'You Dont have appropriate privilege to do this action'
    ];
    Session::setFlash($s2);
}
header("Location: $retUrl");
?>