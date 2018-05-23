<?php
namespace Models;

use \Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'cat';
//    protected $table = 'category';
    protected $fillable = [
                              'catid'
                            , 'name'
                            , 'icon'
                            , 'item_order'
                            , 'active'
                            , 'delete_remove'
                        ];
    public function publicsub()
    {
        return $this->hasMany('Models\SubCategory', 'cat_id')
            ->select('id','name','cat_id')
            ->where('active','=',1)
            ->where('delete_remove','=',0)
            ;
    }

    public function publicSubSlc2()
    {
        return $this->hasMany('Models\SubCategory', 'cat_id')
            ->select('id','name','cat_id')
            ->where('active','=',1)
            ->where('delete_remove','=',0)
            ;
    }
}

?>