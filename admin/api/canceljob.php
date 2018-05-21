<?php
include_once dirname(dirname(__DIR__)) . '/app/bootstrap.php';
use Libs\Input;
use Libs\DB;
use Libs\Session;
use Models\Job;

$role = Session::getRole();

if ($role == 'admin'){

    // check if the 'serial' variable is set in URL, and check that it is valid
    if (Input::get('id') && is_numeric(Input::get('id'))) {
        // get id value
        $id = Input::get('id');

        $job = Job::find($id);
        $job->accepted = 0;
        $job->active = 0;
        $job->save();

        $success = [
            'name' => 'Success!'
            , 'level' => 'success'
            , 'message' => 'The Job ('.$id. ') has been activated. It\'s now available to public'
        ];
        Session::setFlash($success);

        // redirect back to the view page
        header("Location: ../joblist.php");
    } else // if id isn't set, or isn't valid, redirect back to view page
    {
        $s2 = [
            'name' => 'OPS!'
            , 'level' => 'danger'
            , 'message' => 'The Job Activation request has been Failed!'
        ];
        Session::setFlash($s2);
        header("Location: ../joblist.php");
    }
} else {
    $s2 = [
        'name' => 'OPS!'
        , 'level' => 'danger'
        , 'message' => 'You Dont have appropriate privilege to do this action'
    ];
    Session::setFlash($s2);
    header("Location: ../joblist.php");
}

?>