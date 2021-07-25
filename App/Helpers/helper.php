<?php

use App\Models\Category;

function base_url($route = null)
{
    return  $_ENV['BASE_URL'] . $route;
}
function asset_url($route = null)
{
    return  base_url('Assets/' . $route);
}
function view($path, $data = [], $layout = null)
{
    $path = str_replace('.', DIRECTORY_SEPARATOR, $path);
    $path_explode = explode('/', $path);
    $full_path = BASEPATH . "App/Views/$path.php";
    $is_file = is_readable($full_path) && file_exists($full_path);
    if ($path_explode[0] == 'Frontend') {
        $data += inject_menu($path_explode[0]);
    }

    if (is_null($layout)) {
        $is_file ? buffering($full_path, $data, $path_explode[0]) : include_once BASEPATH . "App/Views/Error/404.php";
    }
    $is_file ? buffering($full_path, $data) : include_once BASEPATH . "App/Views/Error/404.php";
}
function inject_menu($path)
{
    $categoryModel = new Category;
    $categoryLevelOne = $categoryModel->get('*', ['parent_id' => 0]);
    foreach ($categoryLevelOne as $LevelOne) {
        $categoryLevelTwo[$LevelOne['id']] = $categoryModel->inner_join('*', 'photos', 'id', 'entity_id', 'categories.parent_id' . '=' . $LevelOne['id']);
    }
    if ($categoryLevelOne) {
        return  [
            'categoryLevelOne' => $categoryLevelOne,
            'categoryLevelTwo' => $categoryLevelTwo
        ];
    }
    return [];
}
function buffering($full_path_view, $data, $dir = null)
{
    if (!is_null($dir)) {
        ob_start();
        extract($data);
        include_once $full_path_view;
        $view = ob_get_clean();
        include_once BASEPATH . "App/Views/$dir/layouts/master.php";
    }
    include_once $full_path_view;
}

function view_flash_message($path, $data = [])
{
    $path = str_replace('.', '/', $path);
    ob_start();
    extract($data);
    include_once BASEPATH . 'App/Views/' . $path . '.php';
    echo  ob_get_clean();
}


function xss_clean($str)
{
    return filter_var(htmlspecialchars($str), FILTER_SANITIZE_STRING);
}


function dd(...$args)
{
    echo "<pre  style='background:#FF5722; border-radius: 10px; padding: 10PX;'>";
    var_dump($args);
    echo "</pre>";
    die();
}

function include_data($full_path_view, $data)
{

    ob_start();
    extract($data);
    include_once $full_path_view;
    echo  ob_get_clean();
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

function storage_url($filename)
{
    return base_url() . "Storage/$filename";
}

function storage_path($filename)
{
    return base_url() . $filename;
}
