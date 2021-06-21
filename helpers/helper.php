<?php
function base_url($route = null)
{
    return  $_ENV['BASE_URL'] . $route;
}
function asset_url($route = null)
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
function view_back($content_path, $data = [])
{
    $content_path = str_replace('.', DIRECTORY_SEPARATOR, $content_path);
    $full_view_path = BASEPATH . "views/backend/$content_path.php";
    if (file_exists($full_view_path) && is_readable($full_view_path)) {
        ob_start();
        extract($data);
        include_once $full_view_path;
        $view = ob_get_clean();
        include_once BASEPATH . "views/backend/layouts/master.php";
    }
    include_once BASEPATH . "views/error/404.php";

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
