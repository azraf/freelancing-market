<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\Session;
use Models\Withdraw;
//use Libs\CashManager;

$backurl = Session::backUrl();
$back_url = !empty($backurl) ? $backurl : cpUrl('pending-withdraw.php');

$role = Session::getRole();
if ($role == 'admin') {
    // check if the 'serial' variable is set in URL, and check that it is valid
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        try{

        $id = Input::get('id');
        $witndraw = Withdraw::find($id);
        $witndraw->completed = 1;
        $witndraw->archieved = 1;
        $witndraw->comment = 'Accepted';
        $witndraw->save();

        $success = [
            'name' => 'Success!'
            , 'level' => 'success'
            , 'message' => 'Withdrawal request has been confirmed'
        ];
        Session::setFlash($success);
        } catch (Exception $exception){

            $msg2 = [
                'name' => 'OPS!'
                , 'level' => 'danger'
                , 'message' => 'Withdrawal could not proceed. Please contact support.'
            ];
            Session::setFlash($msg2);
        }
        // redirect back to the view pageaa
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'Some info missing'
        ];
        Session::setFlash($s2);
    }
} else {
    $s2 = [
        'name' => 'OPS!'
        , 'level' => 'danger'
        , 'message' => 'You dont have appropriate privilege to do this action'
    ];
    Session::setFlash($s2);
}
header("Location: $back_url");
?>