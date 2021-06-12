<?php
function base_url($route=null)
{
    return  $_ENV['BASE_URL'] . $route;
}
function asset_url($route=null)
{
    return  base_url('assets/' . $route);
}
function view($path, $data = [])
{
    extract($data);
    $path = str_replace('.', '/', $path);
    include_once BASEPATH . "views/layouts/header.php";
    include_once BASEPATH . "views/$path.php";
    include_once BASEPATH . "views/layouts/footer.php";
}
function xss_clean($str)
{
    return filter_var(htmlspecialchars($str), FILTER_SANITIZE_STRING);
}
