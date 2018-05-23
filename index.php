<?php
require_once __DIR__ . '/app/bootstrap.php';

use Controllers\Controller;
use Models\Job;
use Models\Category;

$page = new Controller();

$jobs = Job::where('active',1)
    ->where('opened', '=', 1)
    ->where('archived', '=', 0)
    ->select('id','title','start_date','perjob_charge')
    ->orderBy('id', 'desc')
    ->take(10)
    ->get()
    ->toArray()
;

$jobs  = insertUrl($jobs,'title','jobpost.php?id=','id');
$page->data['jobs'] =  json_encode($jobs);

$page->data['categories'] = Category::where('active',1)
    ->select('id','name','icon')
    ->orderBy('name', 'asc')
    ->take(15)
    ->get()
    ->toArray()
;

function insertUrl($data,$col,$part1,$id='id',$content='')
{
    $urlOpen1st = '<a href="';
    $urlOpen2nd = '">';
    $urlClose = '</a>';
    foreach($data as $key=>$var)
    {
        foreach($var as $k => $v)
        {
            if($k == $col){
                $data[$key][$k] = $urlOpen1st . $part1 . $data[$key][$id] . $urlOpen2nd . (empty($content) ? $v : $content) . $urlClose;
            }
        }
    }
    return $data;
}

echo $page->tmpl->render("homepage", $page->data);
?>

