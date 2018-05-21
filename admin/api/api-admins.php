<?php
require dirname(dirname(__DIR__)) . '/api/BootAPI.php';

use Ozdemir\Datatables\Datatables;
use Ozdemir\Datatables\DB\MySQL;
use Libs\Session;

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
    $str = "Select id, adminid, name, email,username,created_at, isactive from auth_admin WHERE deleted=0";
    $dt->query($str);
    $dt->edit('isactive', function($data){
        if($data['isactive'] != 1){
            $str = '<a class="btn btn-md" href="'.cpUrl('api/api-admin-active.php?id='.$data['id']).'" title="Make Active"><span class="fa fa-check-square"></span> Active</a>';
        }else{
            $str = '<a class="btn btn-md" href="'.cpUrl('api/api-admin-inactive.php?id='.$data['id']).'" title="Make Inactive"><span class="fa fa-close"></span> Inactive</a>';
        }
        $str .= ' &nbsp; <a class="btn btn-danger btn-xs" href="'.cpUrl('api/api-admin-del.php?id='.$data['id']).'"  title="Delete"><span class="fa fa-trash"></span> Delete</a>';
        return $str;
    });
    return $dt->generate();
}

if(
    isset($_SESSION['csrf_ajax_key']) &&
    isset($_SESSION['csrf_ajax_val']) &&
    isset($_POST[$_SESSION['csrf_ajax_key']]) &&
    isset($_SERVER['HTTP_X_REQUESTED_WITH']) &&
    strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest' &&
    $_SERVER['REQUEST_METHOD'] === 'POST' &&
    $_SESSION['csrf_ajax_val'] == $_POST[$_SESSION['csrf_ajax_key']]
){
    echo returnData();
} else {
        echo '';
}
//Unset to stop multiple attempts

?>
