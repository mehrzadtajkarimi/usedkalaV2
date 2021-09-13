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
 * Route::get('/category', 'CategoryController@index');
 * Route::get('/category/create', 'CategoryController@create');
 * Route::post('/category', 'CategoryController@store');
 * Route::get('/category/{id}', 'CategoryController@show');
 * Route::get('/category/{id}/edit', 'CategoryController@edit');
 * Route::put('/category/{id}', 'CategoryController@update');
 * Route::delete('/category/{id}', 'CategoryController@destroy');
 * 
 */

Route::group(function () {

    Route::get('/', 'HomeController@index');
});

Route::group(function () {

    Route::get('/login', 'LoginController@login');
    Route::post('/login', 'LoginController@is_login');
    Route::get('/token', 'LoginController@token');
    Route::post('/token', 'LoginController@is_token');
    Route::get('/logout', 'LoginController@logout');
    Route::get('/profile', 'ProfileController@is_login');
});

Route::group(function () {
    Route::get('/category/{id}/{slug}', 'CategoryController@show');
});

Route::group(function () {
    Route::get('/product/{id}', 'ProductController@show');
    Route::get('/product/category/{id}/{slug}', 'ProductController@index');
});

Route::group(function () {
    Route::post('/payment', 'PayController@pay');
    Route::get('/payment-verification', 'PayController@verify');
});

Route::group(function () {
    Route::get('/cart', 'CartController@index');
    Route::post('/cart/add/{id}', 'CartController@add');
    Route::get('/cart/add/{id}', 'CartController@add');
    Route::get('/cart/plus/{id}', 'CartController@plus');
    Route::get('/cart/minus/{id}', 'CartController@minus');
    Route::get('/cart/remove/{id}', 'CartController@remove');
});
