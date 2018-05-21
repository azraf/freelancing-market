<?php
function bootBase()
{
    if (!defined('BASE')) {
        $p = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? false : true;
        if ($p == false) {
            define('BASE', SITE1);
        } else {
            define('BASE', SITE2);
        }
    }
    if (!defined('ADMINPATH')) {
        define('ADMINPATH', BASE . '/' . ADMINKEY);
    }
}
