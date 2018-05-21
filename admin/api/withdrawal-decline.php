<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\Session;
use Models\Withdraw;
use Libs\CashManager;

$backurl = Session::backUrl();
$back_url = !empty($backurl) ? $backurl : cpUrl('pending-withdraw.php');

$role = Session::getRole();
if ($role == 'admin') {
    // check if the 'serial' variable is set in URL, and check that it is valid
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        $id = Input::get('id');
        $withdraw = Withdraw::find($id);
        $userid = $withdraw->userid;
        $w_amount = $withdraw->withdraw_amount;
        $w_time = $withdraw->created_at;
        $withdraw->archieved = 1;
        $withdraw->comment = 'Declined';
        $withdraw->save();

        CashManager::reqWithdrawDecline($userid,$w_amount,$id,$w_time);
        $success = [
            'name' => 'Success!'
            , 'level' => 'success'
            , 'message' => 'Withdrawal request has been confirmed'
        ];
        Session::setFlash($success);
        // redirect back to the view page
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