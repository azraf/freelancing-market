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

    $str = "Select id, title, start_date, budget,job_seated,job_seats_max,total_charge,has_countries,active,completed from job WHERE delete_remove=0";
    $dt->query($str);
    $dt->edit('title', function($data){
        return '<a href="jobpost.php?id=' . $data['id'] . '">' . $data['title'] . '</a>';
    });
    $dt->edit('job_seated', function($data){
        return  '<b>'. $data['job_seated'] . '</b> / <b>' . $data['job_seats_max'] . '</b>';
    });
    $dt->edit('completed', function($data){
        if($data['active'] != 1){
            $str = '<a class="btn btn-md" href="'.cpUrl('api/deposit-.php?id='.$data['id']).'" title="Active"><span class="fa fa-check-square"></span></a>';
        }else{
            $str = '<a class="btn btn-md" href="'.cpUrl('api/makepublicoff.php?id='.$data['id']).'" title="Active"><span class="fa fa-close"></span></a>';
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
    echo returnData();
} else {
    echo '';
}
//Unset to stop multiple attempts
?>
