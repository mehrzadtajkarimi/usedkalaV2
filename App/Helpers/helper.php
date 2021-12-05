<?php

use App\Core\Request;
use App\Models\Category;
use App\Models\Discount;
use App\Models\Permission_user;
use App\Models\Photo;
use App\Models\Role_user;
use App\Models\User;
use App\Models\Wish_list;
use App\Services\Auth\Auth;
use App\Services\Basket\Basket;

function base_url($route = null)
{
    return  $_ENV['BASE_URL'] . $route;
}
function base_url_admin($route = null)
{
    return  $_ENV['BASE_URL'] . 'admin/' . $route;
}
function asset_url($route = null)
{
    return  base_url('Assets/' . $route);
}
function view($path, $data = [], $layout = null)
{
    $path = str_replace('.', '/', $path);
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
function inject_menu()
{
    $cart_items = Basket::items();
    $cart_count = count($cart_items);
    foreach ($cart_items as  $value) {
        $cart_total[] = $value['count'] * $value['price'];
    }
    $categoryModel = new Category;
    $categoryLevelOne = $categoryModel->get('*', [
        'parent_id' => 0,
        'type'      => 0,
    ]);
    foreach ($categoryLevelOne as $LevelOne) {
        $level_two = $categoryModel->get('id', [
            'parent_id' => $LevelOne['id'],
            'type'      => 0,
        ]);
        $categoryLevelTwo[$LevelOne['id']] = array();
        foreach ($level_two as $level_two_id) {
            $categories_level_two = $categoryModel->get('*', ['id' => $level_two_id]);
            foreach ($categories_level_two as $key => $category_level_two) {
                $categories_level_two_add_photo = $categoryModel->join_category_to_photo($category_level_two['id']);
                array_push($categoryLevelTwo[$LevelOne['id']], $categories_level_two_add_photo[$key]);
            }
        }
    }

    if ($categoryLevelOne) {
        return  [
            'categoryLevelOne' => $categoryLevelOne,
            'categoryLevelTwo' => $categoryLevelTwo,
            'cart_total'       => array_sum($cart_total ?? []),
            'cart_count'       => $cart_count,
            'cart_items'       => $cart_items ?? [],
            'authenticated'    => Auth::is_login(),
        ];
    }
    return [];
}
function create_slug($string)
{
    // $slug = preg_replace('/[^A-Za-z0-9-]+/', '-', $string);
    $slug = str_replace([
        "+",
        "(",
        ")",
        ".",
        ",",
        ";",
        "/",
        "&",
        " ",
        "'",
        '"',
        "،",
        "؛",
        "\r\n",
        "\n"
    ], [
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "-",
        "",
        "",
        "",
        "",
        "",
        ""
    ], strip_tags($string));
    return $slug;
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

function dd(...$categoryLevelTwo)
{
    echo '<pre style="background:#FF5722; border-radius: 10px; padding: 20PX">';
    var_dump($categoryLevelTwo);
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



function is_active($routeName, $activeClassName = 'active menu-open d-block')
{
    $request = new  Request();
    if (is_array($routeName)) {
        return in_array($request->uri(), $routeName) ? $activeClassName : '';
    }
    return $request->uri() == $routeName ? $activeClassName : '';
}

function admin_name($name)
{
    $admin_id = Auth::is_login();
    $userModel = new User();
    return $userModel->get_admin($admin_id)[$name];
}
function can(string $name): bool
{
    $admin_id        = Auth::is_login();

    $permissionModel = new Permission_user();
    $roleModel       = new Role_user();

    $has_permission = $permissionModel->join_permissionUser_permission($admin_id);
    $has_role       = $roleModel->join_roleUser_role($admin_id);



    foreach ($has_permission as  $value) {
        if ($value['name'] == $name) {
            return true;
        }
    }
    foreach ($has_role as  $value) {
        if ($value['name'] == $name) {
            return true;
        }
    }
    return false;
}
function search_categories()
{
    $categoryModel = new Category();
    return $categoryModel->get('*',['type' => 0]);
}
function wishList()
{
    $whishListModel = new Wish_list();
    return $whishListModel->read_all_wishList_items('Product');
}