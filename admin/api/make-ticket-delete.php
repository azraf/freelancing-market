<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\Session;
use Models\Ticket;

$role = Session::getRole();
$backurl = Session::backUrl();
$back_url = !empty($backurl) ? $backurl : cpUrl('tickets.php');

if ($role == 'admin'){
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        $id = Input::get('id');

        $ticket = Ticket::find($id);
//
        $ticket->closed = 1;
        $ticket->archieved = 1;
        $ticket->deleted = 1;
        $job->save();

        $success = [
            'name' => 'Success!'
            , 'level' => 'success'
            , 'message' => 'The Job ('.$id. ') has been activated. It\'s now available to public'
        ];
        Session::setFlash($success);
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'The Job Activation request has been Failed!'
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