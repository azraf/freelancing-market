<?php
defined("SITE1")or define('SITE1', 'http://DOMAIN'); //http
defined("SITE2")or define('SITE2', 'https://DOMAIN'); // https
defined("ADMINKEY")or define('ADMINKEY', 'admin'); // URL path without ending /
defined("ROOTPATH")or define('ROOTPATH', dirname(dirname(__DIR__)) . '/');
defined("VENDORPATH")or define('VENDORPATH', dirname(dirname(__DIR__)) . '/vendor/');
defined("ROOTAPPPATH")or define('ROOTAPPPATH', dirname(__DIR__) . '/');
defined("VIEWROOTPATH")or define('VIEWROOTPATH', dirname(__DIR__) . '/Views');
defined("VIEWADMINPATH")or define('VIEWADMINPATH', dirname(__DIR__) . '/Views/admin');
defined("VIEWCACHEPATH")or define('VIEWCACHEPATH', dirname(dirname(__DIR__)) . '/tmp-cache/views');
defined("VIEWADMINCACHEPATH")or define('VIEWADMINCACHEPATH', dirname(dirname(__DIR__)) . '/tmp-cache/admin/views');
defined("SITEMODE")or define('SITEMODE', 'prod'); // set mode:: prod || dev
defined("APP_LEVEL")or define('APP_LEVEL', 'debug'); // Levels: production | test | debug