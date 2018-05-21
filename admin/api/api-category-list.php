<?php
require dirname(dirname(__DIR__)) . '/api/BootAPI.php';

use Ozdemir\Datatables\Datatables;
use Ozdemir\Datatables\DB\MySQL;
session_start();

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

    $str = "Select id,catid,name,created_at,active from cat WHERE delete_remove=0";
    $dt->query($str);

    $dt->edit('name', function($data){
        return '<a href="' . cpUrl('categories.php?show=showcat&amp;id='.$data['id']) . '">' . $data['name'] . '</a>';
    });

    $dt->add('action', function($data){
        if($data['active'] != 1){
            $str  = '<a class="btn btn-md green" href="'.cpUrl('api/activate-category.php?id='.$data['id']).'" title="Activate Category"><span class="fa fa-check-square"></span> Activate</a> || ';
        } else {
            $str  = '<a class="btn btn-md brown" href="'.cpUrl('api/deactivate-category.php?id='.$data['id']).'" title="Deactivate Category"><span class="fa fa-pause-circle-o"></span> Deactivate</a> || ';
        }
//        $str .= '<a class="btn btn-md brown" href="'.cpUrl('api/pausejob.php?id='.$data['id']).'"  title="Delete Job"><span class="fa fa-trash"></span> Pause</a>';
        $str  .= '<a class="btn btn-md borwn" href="'.cpUrl('categories.php?show=editcat&amp;id='.$data['id']).'" title="Deactivate Category"><span class="fa fa-pencil-square-o"></span> Edit</a> || ';
        $str  .= '<a class="btn btn-md red" href="'.cpUrl('api/delete-category.php?id='.$data['id']).'"  title="Delete Job"><span class="fa fa-trash"></span> Delete</a>';
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
