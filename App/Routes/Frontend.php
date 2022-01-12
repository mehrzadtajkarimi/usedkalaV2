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
});
Route::group(function () {
    Route::get('/profile', 'ProfileController@is_login');
    Route::get('/profile/orders', 'OrderController@index');
    Route::get('/profile/orders/status/{id}', 'OrderController@status');
    Route::get('/profile/orders/{id}', 'OrderController@show');
    Route::patch('/profile/{id}', 'ProfileController@update');
    Route::post('/profile/orders/note/{id}', 'OrderController@store_note');
    Route::post('/profile/city/{id}', 'CityController@index');
    Route::get('/profile/comment', 'CommentController@index');
    Route::get('/profile/comment/{id}', 'CommentController@show');
});

Route::group(function () {
    Route::get('/category/{slug}', 'CategoryController@show');
});

Route::group(function () {
    Route::get('/product/{id}/{slug}', 'ProductController@show');
    Route::get('/product/{slug}', 'ProductController@index');
    // Route::get('/product/discounts', 'ProductController@discounts');
    Route::get('/search', 'ProductController@search');
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
    Route::post('/cart/has_coupon', 'CartController@has_coupon');
});


Route::group(function () {
    Route::get('/about/{slug}', 'SettingController@about');
    // Route::get('/about/posts/{slug}', 'SettingController@post');
    // Route::get('/about/rules/{slug}', 'SettingController@rule');
    Route::get('/contact', 'SettingController@contact');
});

Route::group(function () {
    Route::get('/blog', 'BlogController@index');
    Route::get('/blog/{slug}', 'BlogController@show');
    Route::get('/blog/category/{slug}', 'BlogController@category');
});

Route::group(function () {
    Route::post('/like', 'LikeController@like');
    Route::post('/dislike', 'LikeController@dislike');
});

Route::group(function () {
    Route::post('/comment/{type}/{id}/{slug}', 'CommentController@add');
    Route::get('/comment', 'CommentController@index');
    Route::get('/comment/{id}', 'CommentController@show');
});

Route::group(function () {
    Route::get('/tags/{id}/{type}', 'TagController@index');
    Route::get('/tags/{id}/{type}/{slug}', 'TagController@show');
});

Route::group(function () {
    Route::post('/wishlist', 'WishListController@add');
    Route::get('/wishlist', 'WishListController@index');
    Route::post('/wishlist/remove', 'WishListController@remove');
    // Route::get('/wishList/create', 'WishListController@create');
    // Route::post('/wishList', 'WishListController@store');
    // Route::get('/wishList/{id}', 'WishListController@show');
    // Route::get('/wishList/{id}/edit', 'WishListController@edit');
    // Route::put('/wishList/{id}', 'WishListController@update');
    // Route::delete('/wishList/{id}', 'WishListController@destroy');
});

Route::group(function () {
    Route::post('/order/create', 'OrderController@create');
});
