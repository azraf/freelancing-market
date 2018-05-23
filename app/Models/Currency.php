<?php

namespace Models;

use \Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    protected $table = 'currency';
    protected $fillable = [
        'currency_code'
        , 'currency_name'
        , 'currency_symbol'
        , 'date_added'
    ];
}

?>