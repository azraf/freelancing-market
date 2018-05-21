<?php
require dirname(dirname(__DIR__)) . '/api/BootAPI.php';

use Libs\APISSP;
use Controllers\ApiController;
use Ozdemir\Datatables\Datatables;
use Ozdemir\Datatables\DB\MySQL;
use Libs\Session;

session_start();

//$userId = Session::getUserId();
//if(!$userId){
//    exit();
//}
//_d($userId,'$userId',1);

// SELECT freelancerid,jobid FROM `proof_submit` WHERE `client_approve`=0 AND `status`=1
//

$post = false;
if(isset($_POST)){
    $post = $_POST;
//    echo returnData($post,$cols);
} else if(isset($_GET)){
    $post = $_GET;
//    echo returnData($post,$cols);
}
//if($post){
//    echo returnData();
//}

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


//    $str = "Select id, userid, name,email,username,created_at,country_id,active from users WHERE delete_remove=0";
    $str = "Select u.id, u.userid, u.name as uname,u.email,u.username,u.created_at,c.name as cname, u.active from auth_users as u LEFT JOIN regions as c ON u.country_id =c.id WHERE u.delete_remove=0";
    $dt->query($str);

    $dt->edit('uname', function($data){
        return '<a target="_blank" href="user.php?id=' . $data['id'] . '">' . $data['uname'] . '</a>';
    });

    $dt->edit('active', function($data){
        if($data['active'] != 1){
//            $str = '<a id="' . $data['id'] . '" class="btnpublic btn btn-xs" data-toggle="tooltip" title="Active"><span class="fa fa-check-square"></span></a>';
            $str = '<a class="btn btn-md" href="'.cpUrl('api/api-user-active.php?id='.$data['id']).'" title="Make Active"><span class="fa fa-check-square"></span> Activate</a>';
        }else{
            $str = '<a class="btn btn-md" href="'.cpUrl('api/api-user-inactive.php?id='.$data['id']).'" title="Make Inactive"><span class="fa fa-close"></span> Hold</a>';
//            $str = '<a id="' . $data['id'] . '" class="btnunpublic" title="Deactive"><span class="fa fa-close"></span></a>';
        }
            $str .= ' &nbsp; <a class="btn btn-danger btn-xs" href="'.cpUrl('api/api-user-del.php?id='.$data['id']).'"  title="Delete"><span class="fa fa-trash"></span> Delete</a>';
        return $str;
    });
    return $dt->generate();
}

//$sql_details = array(
//    'user' => DBUSER,
//    'pass' => DBPASS,
//    'db'   => DBNAME,
//    'host' => DBHOST
//);
//echo json_encode( APISSP::simple( $post, $sql_details, 'job', 'id', $cols ));
//echo '<pre>';
//print_r($_SESSION);
//echo '</pre>';
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
