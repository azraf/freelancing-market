<?php
namespace Libs;

use PHPAuth\Config;

class BaseConfig extends Config{

    public function __construct(\PDO $dbh, $config_table = 'config')
    {
        parent::__construct($dbh, $config_table);
    }
}

?>