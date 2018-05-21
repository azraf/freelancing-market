<?php
namespace Libs;

use Models\Category as CatModel;

class Category
{
    public static function getCatList()
    {
        $data = CatModel::with('publicSubSlc2')
            ->select('id','name as text')
            ->where('active','=',1)
            ->where('delete_remove','=',0)
            ->get();
        if(count($data)){
            return $data->toArray();
        }
    }

    public static function getCatSelectList()
    {
        $data = CatModel::where('active','=',1)->where('delete_remove','=',0)->select('id','name as text')->get();
        if(count($data)){
            return $data->toArray();
        }
    }

    public static function getCatTree()
    {
//        $data = CatModel::where('active','=',1)->where('delete_remove','=',0)->select('id','name as text')->get();
//        if(count($data)){
//            return $data->toArray();
//        }
        $data = CatModel::with('publicSubSlc2')
            ->select('id','name')
            ->where('active','=',1)
            ->where('delete_remove','=',0)
            ->get();
        if(count($data)){
            $treeRaw =  $data->toArray();
            $tree = [];
            foreach($treeRaw as $val){
                $tree[$val['id']] = $val['public_sub_slc2'];
            }

            return $tree;
        }
        return false;
    }
}
?>
