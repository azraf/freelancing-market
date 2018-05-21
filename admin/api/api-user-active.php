<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\Session;
use Models\User;

$role = Session::getRole();
$retUrl = Session::backUrl();
if ($role == 'admin') {
    // check if the 'serial' variable is set in URL, and check that it is valid
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        $id = Input::get('id');

        $model = User::find($id);
        $model->active = 1;
        $model->isactive = 1;

        if( $model->save()){
//            $flash = [
//                'name' => 'DELETED!'
//                , 'level' => 'danger'
//                , 'message' => 'The Job ('.$id. ') has been Deleted.'
//            ];
            $flash = [
                'name' => 'DONE!'
                , 'level' => 'success'
                , 'message' => 'User has been activated'
            ];

        } else {
            $flash = [
                'name' => 'OPS!'
                , 'level' => 'danger'
                , 'message' => 'User activation Failed!'
            ];
        }
        Session::setFlash($flash);
        // redirect back to the view page
        header("Location: $retUrl");
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'User activation request has been Failed!'
        ];
        Session::setFlash($s2);
        header("Location: $retUrl");
    }
} else {
    $s2 = [
        'name' => 'OPS!'
        , 'level' => 'danger'
        , 'message' => 'You Dont have appropriate privilege to do this action'
    ];
    Session::setFlash($s2);
    header("Location: $retUrl");
}
?>