<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\Session;
use Models\Category;

$role = Session::getRole();
$retUrl = Session::backUrl();
if ($role == 'admin') {
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        $id = Input::get('id');
        $category = Category::find($id);
        $category->active = 0;
        if( $category->save()){
            $flash = [
                'name' => 'DONE!'
                , 'level' => 'info'
                , 'message' => 'The category  has been Deactivated.'
            ];
        } else {
            $flash = [
                'name' => 'OPS!'
                , 'level' => 'danger'
                , 'message' => 'Category Deactivation Failed!'
            ];
        }
        Session::setFlash($flash);
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'The Category Deactivation request has been Failed!'
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