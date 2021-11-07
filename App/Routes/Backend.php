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
    Route::get('/admin/users', 'UserController@index');
    Route::get('/admin/login', 'LoginController@login');
    Route::post('/admin/login', 'LoginController@is_login');
    Route::get('/admin/token', 'LoginController@token');
    Route::post('/admin/token', 'LoginController@is_token');
    Route::get('/admin/logout', 'LoginController@logout');
    Route::get('/admin/profile', 'ProfileController@index');
    Route::post('/admin/user/photo', 'ProfileController@photo');
});


Route::group(function () {
    Route::get('/admin/category', 'CategoryController@index');
    Route::get('/admin/category/{type}', 'CategoryController@index');

    Route::get('/admin/category/{id}/create', 'CategoryController@create');
    Route::get('/admin/category/{id}/create/{type}', 'CategoryController@create');

    Route::post('/admin/category/{id}', 'CategoryController@store');
    Route::post('/admin/category/{id}/{type}', 'CategoryController@store');

    Route::get('/admin/category/{id}/edit', 'CategoryController@edit');
    Route::get('/admin/category/{id}/edit/{type}', 'CategoryController@edit');

    Route::patch('/admin/category/{id}', 'CategoryController@update');

    Route::delete('/admin/category/{id}', 'CategoryController@destroy');
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