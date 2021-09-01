<?php

use App\Core\Routing\Route;
use App\Middleware\Gate;


/**
 * add middleware example =
 * Route::get('/','exampleController@index',[Gate::class]);
 *
 * add slug example =
 * Route::get('/example/{slug}','exampleController@index');
 * Route::get('/example/{slug}/example2/{id}','exampleController@index');
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
    Route::get('/admin/category/{id}/create', 'CategoryController@create');
    Route::post('/admin/category/{id}', 'CategoryController@store');
    Route::get('/admin/category/{id}/edit', 'CategoryController@edit');
    Route::patch('/admin/category/{id}', 'CategoryController@update');
    Route::delete('/admin/category/{id}', 'CategoryController@destroy');
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




