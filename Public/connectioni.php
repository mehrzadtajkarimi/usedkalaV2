<?php
define('BASEPATH', rtrim($_SERVER['DOCUMENT_ROOT'], 'Public'));
// define('BASEPATH', '/home/cp47323/public_html/');
include BASEPATH . "vendor/autoload.php";

$dotenv = Dotenv\Dotenv::createImmutable(BASEPATH);
$dotenv->load();

$CON=mysqli_connect($_ENV['DB_HOST'],$_ENV['DB_USER'],$_ENV['DB_PASS'],$_ENV['DB_NAME']);
mysqli_query($CON,"SET NAMES utf8");
mysqli_query($CON,"SET CHARACTER_SET utf8");
?>