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
 */



Route::group(function () {
    Route::get('/admin', 'HomeController@index');
    Route::get('/admin/users', 'UserController@index');
    Route::get('/admin/login', 'LoginController@login');
    Route::post('/admin/login', 'LoginController@is_login');
    Route::get('/admin/register', 'LoginController@register');
});
