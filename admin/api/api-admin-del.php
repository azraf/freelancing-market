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
                , 'message' => 'You can not delete yourself!'
            ];
        } else {
            $model = Admin::find($id);
            $model->isactive = 0;
            $model->deleted = 1;
            if ($model->save()) {
                $flash = [
                    'name' => 'DONE!'
                    , 'level' => 'info'
                    , 'message' => 'Admin has been Deleted'
                ];
            } else {
                $flash = [
                    'name' => 'OPS!'
                    , 'level' => 'danger'
                    , 'message' => 'Admin Deletation Failed!'
                ];
            }
        }
        Session::setFlash($flash);
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'Admin Deletation  request has been Failed!'
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