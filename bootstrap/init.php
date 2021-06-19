<?php

use App\Core\Request;

session_start();

define('BASEPATH',$_SERVER['DOCUMENT_ROOT'].'/');


include BASEPATH . "vendor/autoload.php";

$dotenv = Dotenv\Dotenv::createImmutable(BASEPATH);
$dotenv->load();
$request = new Request;

include BASEPATH . "helpers/helper.php";
include BASEPATH . "routes/backend.php";
include BASEPATH . "routes/frontend.php";

