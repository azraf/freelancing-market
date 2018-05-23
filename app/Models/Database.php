<?php

namespace Models;

use Illuminate\Database\Capsule\Manager as Capsule;

class Database
{
    function __construct($prefix='')
    {
        $capsule = new Capsule;
        $capsule->addConnection([
            "driver" => DBDRIVER,
            "host" => DBHOST,
            "database" => DBNAME,
            "username" => DBUSER,
            "password" => DBPASS,
            "charset" => "utf8",
            "collation" => "utf8_unicode_ci",
            "prefix" => $prefix,
        ]);
//        $capsule->setEventDispatcher();
        $capsule->setAsGlobal();
        // Setup the Eloquent ORM
        $capsule->bootEloquent();
    }
}