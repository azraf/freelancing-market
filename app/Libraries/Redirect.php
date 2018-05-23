<?php

namespace Libs;
/**
 *
 */
class Redirect
{
    public static function to($location = null)
    {
        if ($location) {
            if (is_numeric($location)) {
                switch ($location) {
                    case 404:
                        header('HTTP/1.0 404 Not Found');
                        include 'includes/errors/404.php';
                        exit();
                        break;
                }
            }

            header('Location: ' . $location);
            exit();
        } else {
            header('Location: ' . url());
            exit();
        }
    }

    public static function cp($location = null)
    {
        if ($location) {
            if (is_numeric($location)) {
                switch ($location) {
                    case 404:
                        header('HTTP/1.0 404 Not Found');
                        include 'includes/errors/404.php';
                        exit();
                        break;
                }
            } else {
                $location = cpUrl($location);
            }

            header('Location: ' . $location);
            exit();
        } else {
            header('Location: ' . cpUrl());
            exit();
        }
    }
}


?>