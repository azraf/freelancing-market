<?php
require dirname(dirname(__DIR__)) . '/api/BootAPI.php';

use Ozdemir\Datatables\Datatables;
use Ozdemir\Datatables\DB\MySQL;
session_start();

$post = false;
if(isset($_POST)){
    $post = $_POST;
} else if(isset($_GET)){
    $post = $_GET;
}

function returnData()
{
    $config = [
        'host'     => DBHOST,
        'port'     => DBPORT,
        'username' => DBUSER,
        'password' => DBPASS,
        'database' => DBNAME
    ];
    $dt = new Datatables( new MySQL($config) );

    $str = "Select id, userid, withdraw_amount,withdraw_gateway,withdraw_email ,completed ,created_at ,updated_at from withdrawal_req WHERE archieved=0 AND completed=0";
    $dt->query($str);
    $dt->edit('userid',function($data){
       return '<a target="_blank" href="user.php?id='.$data['userid'].'">'. $data['userid'] . '</a>';
    });
    $dt->add('action', function($data){
        if($data['completed'] != 1){
            $str = '<a class="btn btn-md" href="'.cpUrl( 'api/withdrawal-req.php?id='. $data['id']).'" title="Active"><span class="fa fa-check-square"></span> Accept</a>';
            $str .= ' <a class="btn btn-danger btn-xs" href="'.cpUrl( 'api/withdrawal-decline.php?id='. $data['id']).'"  title="Delete"><span class="fa fa-trash"></span> Decline</a>';
        }
        return $str;
    });

    return $dt->generate();
}

if(
    //Check required variables are set
    isset($_SESSION['csrf_ajax_key']) &&
    isset($_SESSION['csrf_ajax_val']) &&
    isset($_POST[$_SESSION['csrf_ajax_key']]) &&
    isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&

    //Check is AJAX
    strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest' &&

    //Check is POST
    $_SERVER['REQUEST_METHOD'] === 'POST' &&

    //Check POST'ed keys match the session keys
    $_SESSION['csrf_ajax_val'] == $_POST[$_SESSION['csrf_ajax_key']]
){
//    Session::ajaxToken('end');
    echo returnData();
} else {
        echo '';
}
//Unset to stop multiple attempts
?>
