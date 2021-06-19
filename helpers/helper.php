<?php
function base_url($route=null)
{
    return  $_ENV['BASE_URL'] . $route;
}
function asset_url($route=null)
{
    return  base_url('assets/' . $route);
}
function view_front($path, $data = [])
{
    extract($data);
    $path = str_replace('.', '/', $path);
    include_once BASEPATH . "views/frontend/layouts/header.php";
    include_once BASEPATH . "views/frontend/$path.php";
    include_once BASEPATH . "views/frontend/layouts/footer.php";
}
function view_back($path, $data = [])
{
    extract($data);
    $path = str_replace('.', '/', $path);
    include_once BASEPATH . "views/backend/layouts/head.php";
    include_once BASEPATH . "views/backend/layouts/nav.php";
    include_once BASEPATH . "views/backend/layouts/mainSidebar.php";
    include_once BASEPATH . "views/backend/$path.php";
    include_once BASEPATH . "views/backend/layouts/footer.php";
}
function view_flash_message($path, $data = [])
{
    extract($data);
    $path = str_replace('.', '/', $path);

    include_once BASEPATH . "views/$path.php";

}


function xss_clean($str)
{
    return filter_var(htmlspecialchars($str), FILTER_SANITIZE_STRING);
}
