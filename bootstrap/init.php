<?php

use App\Core\Request;
session_start();
ini_set('display_errors', '1');
error_reporting(E_ALL);
date_default_timezone_set("Asia/Tehran");

define('BASEPATH',$_SERVER['DOCUMENT_ROOT'].'/');


include BASEPATH . "vendor/autoload.php";
include BASEPATH . "App/Services/jdf.php";

$dotenv = Dotenv\Dotenv::createImmutable(BASEPATH);
$dotenv->load();
$request = new Request;

include BASEPATH . "helpers/helper.php";
include BASEPATH . "App/Services/sms.php";
include BASEPATH . "routes/backend.php";
include BASEPATH . "routes/frontend.php";

