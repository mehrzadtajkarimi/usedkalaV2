<?php

use App\Core\Routing\Route;
use App\Middleware\Gate;


/**
 * add middleware example =
 * Route::get('/','exampleController@index',[Gate::class]);
 *
 * adexample =
 * Route::get('/example','exampleController@index');
 * Route::get('/example/example2/{id}','exampleController@index');
 * 
 * 
 * 
 * Route::get('/admin/category', 'CategoryController@index');
 * Route::get('/admin/category/create', 'CategoryController@create');
 * Route::post('/admin/category', 'CategoryController@store');
 * Route::get('/admin/category/{id}', 'CategoryController@show');
 * Route::get('/admin/category/{id}/edit', 'CategoryController@edit');
 * Route::put('/admin/category/{id}', 'CategoryController@update');
 * Route::delete('/admin/category/{id}', 'CategoryController@destroy');
 * 
 * 
 */



Route::group(function () {
    Route::get('/admin', 'HomeController@index');
});
Route::group(function () {
    Route::get('/admin/users', 'UserController@index');
    Route::get('/admin/user/makeadmin/{id}', 'UserController@make_admin');
    Route::post('/admin/user/city/{id}', 'UserController@get_city');
    Route::patch('/admin/user/{id}', 'UserController@update');
    Route::delete('/admin/user/{id}', 'UserController@destroy');
});

Route::group(function () {
    Route::get('/admin/login', 'LoginController@login');
    Route::post('/admin/login', 'LoginController@is_login');
    Route::get('/admin/token', 'LoginController@token');
    Route::post('/admin/token', 'LoginController@is_token');
    Route::get('/admin/logout', 'LoginController@logout');
});

Route::group(function () {
    Route::get('/admin/profile', 'ProfileController@index');
    Route::post('/admin/user/photo', 'ProfileController@photo');
});

Route::group(function () {
    Route::get('/admin/category/{type}', 'CategoryController@index');
    Route::get('/admin/category/{id}/create/{type}', 'CategoryController@create');
    Route::post('/admin/category/{id}/{type}', 'CategoryController@store');
    Route::get('/admin/category/{id}/edit/{type}', 'CategoryController@edit');
    Route::patch('/admin/category/{id}/{type}', 'CategoryController@update');
    Route::delete('/admin/category/{id}/{type}', 'CategoryController@destroy');
});

Route::group(function () {
    Route::get('/admin/product', 'ProductController@index');
    Route::get('/admin/product/create', 'ProductController@create');
    Route::post('/admin/product', 'ProductController@store');
    Route::get('/admin/product/{id}/edit', 'ProductController@edit');
    Route::patch('/admin/product/{id}', 'ProductController@update');
    Route::delete('/admin/product/{id}', 'ProductController@destroy');
});

Route::group(function () {
    Route::get('/admin/brand', 'BrandController@index');
    Route::get('/admin/brand/create', 'BrandController@create');
    Route::post('/admin/brand', 'BrandController@store');
    Route::get('/admin/brand/{id}/edit', 'BrandController@edit');
    Route::patch('/admin/brand/{id}', 'BrandController@update');
    Route::delete('/admin/brand/{id}', 'BrandController@destroy');
});

Route::group(function () {
    Route::get('/admin/order', 'OrderController@index');
    Route::get('/admin/order/create', 'OrderController@create');
    Route::post('/admin/order', 'OrderController@store');
    Route::get('/admin/order/{id}/edit', 'OrderController@edit');
    Route::patch('/admin/order/{id}', 'OrderController@update');
    Route::delete('/admin/order/{id}', 'OrderController@destroy');

    Route::post('/admin/order/get_orders', 'OrderController@get_orders');
    Route::post('/admin/order/get_admin', 'OrderController@get_admin');
    Route::post('/admin/order/status/{id}', 'OrderController@status');
});

Route::group(function () {
    Route::get('/admin/tag', 'TagController@index');
    Route::get('/admin/tag/create', 'TagController@create');
    Route::post('/admin/tag', 'TagController@store');
    Route::get('/admin/tag/{id}/edit', 'TagController@edit');
    Route::patch('/admin/tag/{id}', 'TagController@update');
    Route::delete('/admin/tag/{id}', 'TagController@destroy');
});

Route::group(function () {
    Route::get('/admin/discount', 'DiscountController@index');
    Route::get('/admin/discount/create', 'DiscountController@create');
    Route::post('/admin/discount', 'DiscountController@store');
    Route::get('/admin/discount/{id}/edit', 'DiscountController@edit');
    Route::patch('/admin/discount/{id}', 'DiscountController@update');
    Route::delete('/admin/discount/{id}', 'DiscountController@destroy');
});

Route::group(function () {
    Route::get('/admin/sample', 'SampleController@index');
    Route::get('/admin/sample/create', 'SampleController@create');
    Route::post('/admin/sample', 'SampleController@store');
    Route::get('/admin/sample/{id}/edit', 'SampleController@edit');
    Route::patch('/admin/sample/{id}', 'SampleController@update');
    Route::delete('/admin/sample/{id}', 'SampleController@destroy');
});

Route::group(function () {
    Route::get('/admin/coupon', 'CouponController@index');
    Route::get('/admin/coupon/create', 'CouponController@create');
    Route::post('/admin/coupon', 'CouponController@store');
    Route::get('/admin/coupon/{id}/edit', 'CouponController@edit');
    Route::patch('/admin/coupon/{id}', 'CouponController@update');
    Route::delete('/admin/coupon/{id}', 'CouponController@destroy');
});

Route::group(function () {
    Route::get('/admin/cart', 'CartController@index');
    Route::get('/admin/cart/add/{id}', 'CartController@add');
    Route::delete('/admin/cart/destroy/{id}', 'CartController@destroy');
});

Route::group(function () {
    Route::get('/admin/slider', 'SliderController@index');
    Route::get('/admin/slider/create', 'SliderController@create');
    Route::post('/admin/slider', 'SliderController@store');
    Route::get('/admin/slider/{id}/edit', 'SliderController@edit');
    Route::patch('/admin/slider/{id}', 'SliderController@update');
    Route::delete('/admin/slider/{id}', 'SliderController@destroy');
});

Route::group(function () {
    Route::get('/admin/setting', 'SettingController@index');
    Route::post('/admin/setting/upload', 'SettingController@upload');
    Route::get('/admin/setting/create', 'SettingController@create');
    Route::post('/admin/setting', 'SettingController@store');
    Route::get('/admin/setting/{id}/edit', 'SettingController@edit');
    Route::patch('/admin/setting/{id}', 'SettingController@update');
    Route::delete('/admin/setting/{id}', 'SettingController@destroy');
});

Route::group(function () {
    Route::get('/admin/permission', 'PermissionController@index');
    Route::post('/admin/permission/upload', 'PermissionController@upload');
    Route::get('/admin/permission/create', 'PermissionController@create');
    Route::post('/admin/permission', 'PermissionController@store');
    Route::get('/admin/permission/{id}/edit', 'PermissionController@edit');
    Route::patch('/admin/permission/{id}', 'PermissionController@update');
    Route::delete('/admin/permission/{id}', 'PermissionController@destroy');
});

Route::group(function () {
    Route::get('/admin/role', 'RoleController@index');
    Route::post('/admin/role/upload', 'RoleController@upload');
    Route::get('/admin/role/create', 'RoleController@create');
    Route::post('/admin/role', 'RoleController@store');
    Route::get('/admin/role/{id}/edit', 'RoleController@edit');
    Route::patch('/admin/role/{id}', 'RoleController@update');
    Route::delete('/admin/role/{id}', 'RoleController@destroy');
});

Route::group(function () {
    Route::get('/admin/access', 'AccessController@index');
    Route::post('/admin/access/upload', 'AccessController@upload');
    Route::get('/admin/access/create', 'AccessController@create');
    Route::post('/admin/access', 'AccessController@store');
    Route::get('/admin/access/{id}/edit', 'AccessController@edit');
    Route::patch('/admin/access/{id}', 'AccessController@update');
    Route::delete('/admin/access/{id}', 'AccessController@remove_admin');

    Route::post('/admin/access/add_access/{type}/{admin_id}', 'AccessController@add_access');
    Route::post('/admin/access/get_access', 'AccessController@get_access');
    Route::get('/admin/access/delete_access/{type}/{id}', 'AccessController@delete_access');
});

Route::group(function () {
    Route::get('/admin/blog', 'BlogController@index');
    Route::get('/admin/blog/create', 'BlogController@create');
    Route::post('/admin/blog', 'BlogController@store');
    Route::get('/admin/blog/{id}', 'BlogController@show');
    Route::get('/admin/blog/{id}/edit', 'BlogController@edit');
    Route::patch('/admin/blog/{id}', 'BlogController@update');
    Route::delete('/admin/blog/{id}', 'BlogController@destroy');
});

Route::group(function () {
    Route::get('/admin/sample', 'SampleController@index');
    Route::get('/admin/sample/create', 'SampleController@create');
    Route::post('/admin/sample/create', 'SampleController@create_ajax');
    Route::post('/admin/sample', 'SampleController@store');
    Route::get('/admin/sample/{id}', 'SampleController@show');
    Route::get('/admin/sample/{id}/edit', 'SampleController@edit');
    Route::patch('/admin/sample/{id}', 'SampleController@update');
    Route::delete('/admin/sample/{id}', 'SampleController@destroy');
});

Route::group(function () {
    Route::get('/admin/comment', 'CommentController@index');
    Route::get('/admin/comment/create', 'CommentController@create');
    Route::post('/admin/comment', 'CommentController@store');
    Route::post('/admin/comment/status/{id}', 'CommentController@status');
    Route::get('/admin/comment/{id}', 'CommentController@show');
    Route::get('/admin/comment/{id}/edit', 'CommentController@edit');
    Route::patch('/admin/comment/{id}', 'CommentController@update');
    Route::delete('/admin/comment/{id}', 'CommentController@destroy');
});
