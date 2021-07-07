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
