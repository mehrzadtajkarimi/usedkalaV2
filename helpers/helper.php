<?php
function base_url($route = null)
{
    return  $_ENV['BASE_URL'] . $route;
}
function asset_url($route = null)
{
    return  base_url('assets/' . $route);
}
function view($path, $data = [], $layout = null)
{
    $path = str_replace('.', DIRECTORY_SEPARATOR, $path);
    $path_explode = explode('/', $path);
    $full_path = BASEPATH . "views/$path.php";
    $is_file = is_readable($full_path) && file_exists($full_path);

    if (is_null($layout)) {
        $is_file ? buffering($full_path, $data, $path_explode[0]) : include_once BASEPATH . "views/error/404.php";
    }
    $is_file ? buffering($full_path, $data) : include_once BASEPATH . "views/error/404.php";
}
function buffering($full_path_view, $data, $dir = null)
{
    if (!is_null($dir)) {
        ob_start();
        extract($data);
        include_once $full_path_view;
        $view = ob_get_clean();
        include_once BASEPATH . "views/$dir/layouts/master.php";
    }
    include_once $full_path_view;
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

function include_data($full_path_view, $data)
{
    ob_start();
    extract($data);
    include_once $full_path_view;
    return ob_get_clean();
}

function contains_array($array)
{
    foreach ($array as $value) {
        if (is_array($value)) {
            return true;
        }
    }
    return false;
}

function menu_generator(array $menu_items)
{
    $html_wrapper = [];
    foreach ($menu_items as $category => $item) {
        if (is_array($item)) {
            $html_wrapper .= "<li class='list-group-item'>" . $category . menu_generator($item['name']) . "</li>";
            continue;
        }
        $html_wrapper .= "<li class='list-group-item'>" . $item['name'] . "</li>";
    }
    return "<ul>$html_wrapper</ul>";
}
