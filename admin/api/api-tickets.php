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


    $str = "Select id,ticket_id,userid,type,message,created_at,updated_at,closed from ticket WHERE archieved=0 AND deleted=0";
    $dt->query($str);
    $dt->edit('userid',function($data){
        return '<a target="_blank" href="user.php?id='.$data['userid'].'">'. $data['userid'] . '</a>';
    });
    $dt->add('action', function($data){
        $str = '';
        if($data['closed'] != 1){
            $str = '<a class="btn btn-md" href="'.cpUrl('api/make-ticket-closed.php?id='.$data['id']).'" title="Close"><span class="fa fa-close"></span> Close</a>';
        }
        $str .= ' &nbsp; <a class="btn btn-md btn-danger" href="'.cpUrl('api/make-ticket-archived.php?id='.$data['id']).'" title="Achive"><span class="fa fa-trash"></span> Archive</a>';
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
