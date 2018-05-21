<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\Session;
use Models\Category;

$role = Session::getRole();
$retUrl = Session::backUrl();
if ($role == 'admin') {
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        $id = Input::get('id');

        $category = Category::find($id);
        $category->active = 1;

        if( $category->save()){
            $flash = [
                'name' => 'DONE!'
                , 'level' => 'success'
                , 'message' => 'The category  has been activated.'
            ];
        } else {
            $flash = [
                'name' => 'OPS!'
                , 'level' => 'danger'
                , 'message' => 'Category activation Failed!'
            ];
        }
        Session::setFlash($flash);
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'The Category activation request has been Failed!'
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