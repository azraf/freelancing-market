<?php

use Carbon\Carbon;

function appNav()
{
    return SITE;
}

function cpNav()
{
    return SITE . '/' . ADMINKEY;
}

function startsWith($haystack, $needle)
{
    $length = strlen($needle);
    return (substr($haystack, 0, $length) === $needle);
}

function endsWith($haystack, $needle)
{
    $length = strlen($needle);

    return $length === 0 || (substr($haystack, -$length) === $needle);
}

function url($parts = '')
{
    if (!empty($parts)) {
        if (startsWith($parts, '/')) {
            return SITE . $parts;
        }
        return SITE . '/' . $parts;
    }
    return SITE;
}

function cpUrl($parts = '')
{
    if (!empty($parts)) {
        if (startsWith($parts, '/')) {
            return ADMINPATH . $parts;
        }
        return ADMINPATH . '/' . $parts;
    }
    return ADMINPATH;
}

function addUrlPart($url, $part)
{
    if (startsWith($part, '/')) {
        return $url . $part;
    }
    return $url . '/' . $part;
}

function assets($path)
{
    return addUrlPart(SITE . '/assets', $path);
}

function adminAssets($path)
{
    return addUrlPart(ADMINPATH . '/assets', $path);
}

function fieldHStart($id, $name, $width = 3, $apend = '')
{
    $nextWidth = 12 - intval($width);
    $s = '<div class="form-group">';
    $s .= '<label for="' . $id . '" class="col-sm-' . $width . ' control-label">' . ucfirst(strtolower($name)) . $apend . '</label>';
    $s .= '<div class="col-sm-' . $nextWidth . '">';

    return $s;
}

function fieldHEnd()
{
    return '</div></div>';
}

function _d($var, $str = '', $e = false, $arrayType = false)
{
    if (!empty($str)) {
        echo '<br />' . $str;
    }
    if ($arrayType) {
        $var = (array)$var;
    }
    echo '<pre>';
    print_r($var);
    echo '</pre>';

    if ($e) {
        exit(' ---- ' . $e . ' ----');
    }
}

function formValue($needle, $obj)
{
    if (count($obj) > 0) {
        if (is_object($obj) && isset($obj->{$needle})) {
            echo $obj->{$needle};
        } else if (is_array($obj) && isset($obj[$needle])) {
            echo $obj[$needle];
        }
    }
}

function getArraySum($array)
{
    if (is_array($array)) {
        return array_sum($array);
    } else {
        return false;
    }
}

function isEmail($str)
{
    if (strpos($str, '@') !== false) {
        return true;
    }
    return false;
}

function uidStr($max_length = 4)
{
    $string = Carbon::now()->format('Hmd-');
    $characters = 'ABCDEFGHJKMNPQRSTUVWXYZ';
    $max = strlen($characters) - 1;
    for ($i = 0; $i < $max_length; $i++) {
        $string .= $characters[mt_rand(0, $max)];
    }
    return $string;
}

function mws_kp($s)
{
    $output = false;
    $kp_method = "AES-256-CBC";
    $kpk = 'kplsjdfiulskdjflk';
    $kpv = 'kpsrjdlfjksjdgdse';
    $kii = hash('sha256', $kpk);
    $iv = substr(hash('sha256', $kpv), 0, 16);
    $output = openssl_decrypt(base64_decode($s), $kp_method, $kii, 0, $iv);
    return $output;
}

function unqId($max_length = 6)
{
    $string = Carbon::now()->format('Hmd-');
    $characters = 'ABCDEFGHJKMNPQRSTUVWXYZ234789';
    $max = strlen($characters) - 1;
    for ($i = 0; $i < $max_length; $i++) {
        $string .= $characters[mt_rand(0, $max)];
    }
    return $string;
}

function uniquestr($max_length = 3)
{
    $string = Carbon::now()->format('ymdHis');
    $characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    $max = strlen($characters) - 1;
    for ($i = 0; $i < $max_length; $i++) {
        $string .= $characters[mt_rand(0, $max)];
    }
    return $string;
}

function strId($max_length = 4)
{
    $characters = 'abcdefghjkmnpqrstuwxyz';
    $max = strlen($characters) - 1;
    $string = '';
    for ($i = 0; $i < $max_length; $i++) {
        $string .= $characters[mt_rand(0, $max)];
    }
    $string .= '-';
    $string .= Carbon::now()->format('midH');
    return $string;
}

/**
 * Class MyAutoLoader
 *
 * e.g.
 * $autoloader_classes = new MwsAutoLoader('CLASSES');
 * $autoloader_admin = new MwsAutoLoader('ADMIN/TPL/SOME_FOLDER2');
 */
class MwsAutoLoader
{
    private $path;

    public function __construct($path)
    {
        $this->path = $path;
        spl_autoload_register(array($this, 'loading'));
    }

    function loading($file)
    {
        if (is_file($this->path . '/' . $file . '.php')) {
            require_once($this->path . '/' . $file . '.php');
        }
    }
}

/*
 * a_href_fix($_SERVER['REQUEST_URI'],$_SERVER['QUERY_STRING']);
 */
function a_href_fix($uri, $query_str = false)
{

    $var = rtrim($uri, '?');
    $pUrl = parse_url($var);
    preg_match('/.\.php$/', $var, $matches);
    if (!empty($pUrl['query']) || !empty($matches) || ($query_str)) {
        $a_href = '#';
    } else {
        $a_href = 'index.php#';
    }
    echo $a_href;
}


function truncateHtml($text, $length = 400, $ending = '...', $exact = false, $considerHtml = true)
{
    if ($considerHtml) {
        // if the plain text is shorter than the maximum length, return the whole text
        if (strlen(preg_replace('/<.*?>/', '', $text)) <= $length) {
            return $text;
        }
        // splits all html-tags to scanable lines
        preg_match_all('/(<.+?>)?([^<>]*)/s', $text, $lines, PREG_SET_ORDER);
        $total_length = strlen($ending);
        $open_tags = array();
        $truncate = '';
        foreach ($lines as $line_matchings) {
            // if there is any html-tag in this line, handle it and add it (uncounted) to the output
            if (!empty($line_matchings[1])) {
                // if it's an "empty element" with or without xhtml-conform closing slash
                if (preg_match('/^<(\s*.+?\/\s*|\s*(img|br|input|hr|area|base|basefont|col|frame|isindex|link|meta|param)(\s.+?)?)>$/is', $line_matchings[1])) {
                    // do nothing
                    // if tag is a closing tag
                } else if (preg_match('/^<\s*\/([^\s]+?)\s*>$/s', $line_matchings[1], $tag_matchings)) {
                    // delete tag from $open_tags list
                    $pos = array_search($tag_matchings[1], $open_tags);
                    if ($pos !== false) {
                        unset($open_tags[$pos]);
                    }
                    // if tag is an opening tag
                } else if (preg_match('/^<\s*([^\s>!]+).*?>$/s', $line_matchings[1], $tag_matchings)) {
                    // add tag to the beginning of $open_tags list
                    array_unshift($open_tags, strtolower($tag_matchings[1]));
                }
                // add html-tag to $truncate'd text
                $truncate .= $line_matchings[1];
            }
            // calculate the length of the plain text part of the line; handle entities as one character
            $content_length = strlen(preg_replace('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|[0-9a-f]{1,6};/i', ' ', $line_matchings[2]));
            if ($total_length + $content_length > $length) {
                // the number of characters which are left
                $left = $length - $total_length;
                $entities_length = 0;
                // search for html entities
                if (preg_match_all('/&[0-9a-z]{2,8};|&#[0-9]{1,7};|[0-9a-f]{1,6};/i', $line_matchings[2], $entities, PREG_OFFSET_CAPTURE)) {
                    // calculate the real length of all entities in the legal range
                    foreach ($entities[0] as $entity) {
                        if ($entity[1] + 1 - $entities_length <= $left) {
                            $left--;
                            $entities_length += strlen($entity[0]);
                        } else {
                            // no more characters left
                            break;
                        }
                    }
                }
                $truncate .= substr($line_matchings[2], 0, $left + $entities_length);
                // maximum lenght is reached, so get off the loop
                break;
            } else {
                $truncate .= $line_matchings[2];
                $total_length += $content_length;
            }
            // if the maximum length is reached, get off the loop
            if ($total_length >= $length) {
                break;
            }
        }
    } else {
        if (strlen($text) <= $length) {
            return $text;
        } else {
            $truncate = substr($text, 0, $length - strlen($ending));
        }
    }
    // if the words shouldn't be cut in the middle...
    if (!$exact) {
        // ...search the last occurance of a space...
        $spacepos = strrpos($truncate, ' ');
        if (isset($spacepos)) {
            // ...and cut the text in this position
            $truncate = substr($truncate, 0, $spacepos);
        }
    }
    // add the defined ending to the text
    $truncate .= $ending;
    if ($considerHtml) {
        // close all unclosed html-tags
        foreach ($open_tags as $tag) {
            $truncate .= '</' . $tag . '>';
        }
    }
    return $truncate;
}

function escape($string)
{
    return htmlentities($string, ENT_QUOTES, 'UTF-8');
}

//function genUniqueId($max_length=5)
//{
//    $time = new DateTime;
//    $string = $time->format('ymdHis');
//    $characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
//    $max = strlen($characters) - 1;
//    for ($i = 0; $i < $max_length; $i++) {
//        $string .= $characters[mt_rand(0, $max)];
//    }
//    return $string;

//}

function genUnique($char_max = 3)
{
    $characters = 'abcdefghjkmnopqrstuvwxyz';
    $max = strlen($characters) - 1;
    $str = '';
    for ($i = 0; $i < $char_max; $i++) {
        $str .= $characters[mt_rand(0, $max)];
    }
    $str .= '-';
    $time = new DateTime;
    $str .= $time->format('mdH');
    $numCharacters = 'abcdefghjklmnopqrstuvwxyz';
    $max2 = strlen($numCharacters) - 1;
    $str .= '-';
    for ($j = 0; $j < $char_max; $j++) {
        $str .= $numCharacters[mt_rand(0, $max2)];
    }
    return $str;
}

function uniqueid($char_max = 3)
{
    $characters = 'abcdefghjkmnopqrstuvwxyz';
    $max = strlen($characters) - 1;
    $str = '';
    for ($i = 0; $i < $char_max; $i++) {
        $str .= $characters[mt_rand(0, $max)];
    }
    $time = new DateTime;
    $str .= $time->format('mdHi');
    $numCharacters = 'abcdefghjklmnopqrstuvwxyz';
    $max2 = strlen($numCharacters) - 1;
    for ($j = 0; $j < $char_max; $j++) {
        $str .= $numCharacters[mt_rand(0, $max2)];
    }
    return $str;
}

function uniquename($char_max = 2, $char_max2 = 5)
{
    $characters = 'abcdefghijklmnopqrstuvwxyz';
    $max = strlen($characters) - 1;
    $str = '';
    for ($i = 0; $i < $char_max; $i++) {
        $str .= $characters[mt_rand(0, $max)];
    }
    $time = new DateTime;
    $str .= $time->format('dimH');
    $numCharacters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    $max2 = strlen($numCharacters) - 1;
    for ($j = 0; $j < $char_max2; $j++) {
        $str .= $numCharacters[mt_rand(0, $max2)];
    }
    return $str;
}

//function uniqueid()
//{
//    $un = substr(number_format(time() * rand(10,9999),0,'',''),0,12);
//    return $un;
//}
function auto_copyright($year = 'auto', $name)
{
    $copy = ' &copy; ';
    if (intval($year) == 'auto') {
        $year = date('Y') . $copy . $name;
    }
    if (intval($year) == date('Y')) {
        echo intval($year) . $copy . $name;
    }
    if (intval($year) < date('Y')) {
        echo intval($year) . ' - ' . date('Y') . $copy . $name;
    }
    if (intval($year) > date('Y')) {
        echo date('Y') . $copy . $name;
    }
}

function ratingGen($star)
{

    $name = '';
    if ($star === '1'):
        $name .= '
			<i class="fa fa-star fa-3x star-null star-checked" id="star-1"></i>
			<i class="fa fa-star fa-3x star-null" id="star-2"></i>
			<i class="fa fa-star fa-3x star-null" id="star-3"></i>
			<i class="fa fa-star fa-3x star-null" id="star-4"></i>
			<i class="fa fa-star fa-3x star-null" id="star-5"></i>
            ';
    elseif ($star === '2'):
        $name .= '
			<i class="fa fa-star fa-3x star-null star-checked" id="star-1"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-2"></i>
			<i class="fa fa-star fa-3x star-null" id="star-3"></i>
			<i class="fa fa-star fa-3x star-null" id="star-4"></i>
			<i class="fa fa-star fa-3x star-null" id="star-5"></i>';
    elseif ($star === '3'):
        $name .= '
			<i class="fa fa-star fa-3x star-null star-checked" id="star-1"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-2"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-3"></i>
			<i class="fa fa-star fa-3x star-null" id="star-4"></i>
			<i class="fa fa-star fa-3x star-null" id="star-5"></i>';
    elseif ($star === '4'):
        $name .= '
			<i class="fa fa-star fa-3x star-null star-checked" id="star-1"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-2"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-3"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-4"></i>
			<i class="fa fa-star fa-3x star-null" id="star-5"></i>';
    elseif ($star === '5'):
        $name .= '
			<i class="fa fa-star fa-3x star-null star-checked" id="star-1"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-2"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-3"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-4"></i>
			<i class="fa fa-star fa-3x star-null star-checked" id="star-5"></i>';
    endif;


    return $name;
}

//Clean URL
function seoUrl($string)
{
    //Lower case everything
    $string = strtolower($string);
    //Make alphanumeric (removes all other characters)
    $string = preg_replace("/[^a-z0-9_\s-]/", "", $string);
    //Clean up multiple dashes or whitespaces
    $string = preg_replace("/[\s-]+/", " ", $string);
    //Convert whitespaces and underscore to dash
    $string = preg_replace("/[\s_]/", "-", $string);
    return $string;
}


//Date Difference
function datediff($timestart, $timeend)
{

    // If not numeric then convert texts to unix timestamps
    if (!is_int($timestart)) {
        $time1 = strtotime($timestart, 0);
    }
    if (!is_int($timeend)) {
        $time2 = strtotime($timeend, 0);
    }

    // Difference in seconds
    $difference = $time2 - $time1;

    $numberDays = $difference / 86400;  // 86400 seconds in one day

    // and you might want to convert to integer
    $numberDays = intval($numberDays);

    // Difference in seconds
    //$ti = gmdate("H:i", $difference);

    return $numberDays;
}

//Money As Cents
function getMoneyAsCents($value)
{
    // strip out commas
    $value = preg_replace("/\,/i", "", $value);
    // strip out all but numbers, dash, and dot
    $value = preg_replace("/([^0-9\.\-])/i", "", $value);
    // make sure we are dealing with a proper number now, no +.4393 or 3...304 or 76.5895,94
    if (!is_numeric($value)) {
        return 0.00;
    }
    // convert to a float explicitly
    $value = (float)$value;
    return round($value, 2) * 100;
}


//Time Ago
function ago($i)
{
    $m = time() - $i;
    $o = 'just now';
    $t = array('year' => 31556926, 'month' => 2629744, 'week' => 604800, 'day' => 86400, 'hour' => 3600, 'minute' => 60, 'second' => 1);
    foreach ($t as $u => $s) {
        if ($s <= $m) {
            $v = floor($m / $s);
            $o = "$v $u" . ($v == 1 ? '' : 's') . ' ago';
            break;
        }
    }
    return $o;
}
function makeHtml($string){
    /*
    .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
    */
    return str_replace(
        [
            '&amp;','&lt;','&gt;','&quot;','&#039;'
        ]
        , [
            '&','<','>','"',"'"
        ]
        ,$string);
}

?>