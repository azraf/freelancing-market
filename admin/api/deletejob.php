<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\Session;
use Models\Job;
use Libs\CashManager;

$role = Session::getRole();
$backurl = Session::backUrl();
$back_url = !empty($backurl) ? $backurl : cpUrl('joblist.php');

if ($role == 'admin') {
    // check if the 'serial' variable is set in URL, and check that it is valid
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        $id = Input::get('id');

        $id = Input::get('id');
        $job = Job::find($id);

        $total_charge  = $job->total_charge ;
        $userid  = $job->clientid ;

        $job->active = 0;
        $job->opened = 0;
        $job->archived = 1;
        $job->delete_remove = 1;
        $job->updated_at = date('Y-m-d H:i:s');
        $job->save();

        // Refund Partial
//        if($refund_partial){
//            Transactions
//        }
        $fundAdded = CashManager::delJobTrans($userid,$id,$total_charge);

        $success = [
            'name' => 'DELETED!'
            , 'level' => 'danger'
            , 'message' => 'The Job ('.$id. ') has been Deleted.'
        ];
        Session::setFlash($success);
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'The Job ('.$id. ') Delete request has been Failed!'
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
header("Location: $back_url");
?>