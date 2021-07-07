<?php

use App\Core\Routing\Router;

include "bootstrap/init.php";

$router = new Router;
$router->run();




// $data=[
//     'name'=>'mehrzad',
//     'email' => ' mehrzad@gmail.com',
//     'password'=>'123456'
// ];
// echo '<pre>';
// $userModel= new User(1);
// $result=$userModel->email;
// var_dump($result);





// echo '<pre>';
// $userModel= new User(2);
// $result=$userModel->remove();
// var_dump($result);

// echo '<pre>';
// $userModel= new User(3);
// $userModel->name = 'ali';
// $userModel->save();
// var_dump($result);



// echo Asset::css('style.css');
// echo '<hr>';
// echo'<pre>';var_dump(Url::current());die;
