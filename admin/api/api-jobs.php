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
    $str = "Select id,title,clientid,start_date,budget,job_seated,job_seats_max,total_charge,has_countries,active,completed from job WHERE delete_remove=0";
    $dt->query($str);
    $dt->edit('title', function($data){
        return '<a target="_blank" href="jobpost.php?id=' . $data['id'] . '">' . $data['title'] . '</a>';
    });
    $dt->edit('job_seated', function($data){
        return  '<b>'. $data['job_seated'] . '</b> / <b>' . $data['job_seats_max'] . '</b>';
    });
    $dt->edit('has_countries', function($data){
        if($data['has_countries'] != 1){
            return  'International';
        } else {
            return  'selected';
        }
    });
    $dt->edit('completed', function($data){
        $str = '';
        if($data['active'] != 1){
            $str  = '<a class="btn btn-md" href="'.cpUrl('api/activatejob.php?id='.$data['id']).'" title="Approve Job"><span class="fa fa-check-square"></span> Accept</a> || ';
            $str .= '<a class="btn btn-md red" href="'.cpUrl('api/deletejob.php?id='.$data['id']).'"  title="Delete Job"><span class="fa fa-trash"></span> Delete</a>';
        }
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






?>
