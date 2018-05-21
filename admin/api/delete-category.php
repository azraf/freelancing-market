<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\Session;
use Models\Category;

$role = Session::getRole();
$retUrl = Session::backUrl();
if ($role == 'admin') {
    // check if the 'serial' variable is set in URL, and check that it is valid
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        $id = Input::get('id');

        $category = Category::find($id);
        $category->active = 0;
        $category->delete_remove = 1;

        if( $category->save()){
            $flash = [
                'name' => 'DONE!'
                , 'level' => 'info'
                , 'message' => 'The category has been sent to Trash.'
            ];
        } else {
            $flash = [
                'name' => 'OPS!'
                , 'level' => 'danger'
                , 'message' => 'Category Deletation Failed!'
            ];
        }
        Session::setFlash($flash);
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'The Category Delete request has been Failed!'
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