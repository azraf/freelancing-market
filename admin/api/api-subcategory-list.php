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

//    $str = "Select cat_sub.id as scid, cat_sub.subcatid as scscid,cat_sub.name as scname,cat_sub.created_at as cdate,cat_sub.active as scactive,cat_id.id as cid, cat_id.name as cname from cat_sub LEFT JOIN cat WHERE cat_sub.cat_id = cat.id AND cat_sub.delete_remove=0";
    $str = "Select cat_sub.id as scid, cat_sub.subcatid as scscid, cat_sub.name as scname, cat_sub.cat_id as sccid, cat_sub.created_at as cdate,cat_sub.active as scactive,cat.id as cid, cat.name as cname from cat_sub LEFT JOIN cat ON cat_sub.cat_id = cat.id WHERE cat_sub.delete_remove=0";
    $dt->query($str);

    $dt->edit('scname', function($data){
        return '<a href="' . cpUrl('categories.php?show=showsubcat&amp;id='.$data['scid']) . '">' . $data['scname'] . '</a>';
    });

    $dt->add('action', function($data){
        if($data['scactive'] != 1){
            $str  = '<a class="btn btn-md green" href="'.cpUrl('api/activate-subcategory.php?id='.$data['scid']).'" title="Activate Category"><span class="fa fa-check-square"></span> Activate</a> || ';
        } else {
            $str  = '<a class="btn btn-md brown" href="'.cpUrl('api/deactivate-subcategory.php?id='.$data['scid']).'" title="Deactivate Category"><span class="fa fa-pause-circle-o"></span> Deactivate</a> || ';
        }
        $str  .= '<a class="btn btn-md green" href="'.cpUrl('categories.php?show=editsubcat&amp;id='.$data['scid']).'" title="Deactivate Category"><span class="fa fa-pencil-square-o"></span> Edit</a> || ';
        $str .= '<a class="btn btn-md red" href="'.cpUrl('api/delete-subcategory.php?id='.$data['scid']).'"  title="Delete Job"><span class="fa fa-trash"></span> Delete</a>';
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
