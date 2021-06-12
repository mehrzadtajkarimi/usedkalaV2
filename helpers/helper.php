<?php
function site_url($route)
{
    return  $_ENV['BASE_URL'] . $route;
}
function asset_url($route)
{
    return  site_url('assets/' . $route);
}
function view($path, $data = [])
{
    extract($data);
    $path = str_replace('.', '/', $path);
    $view_full_path = BASEPATH . "views/$path.php";
    include_once $view_full_path;
}
function xss_clean($str)
{
    return filter_var(htmlspecialchars($str), FILTER_SANITIZE_STRING);
}
