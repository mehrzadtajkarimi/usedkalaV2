<?php
namespace App\Utilities;

class Tinyint{

    static function  category_robots()
    {
        return array( 'Index','Noindex', 'Nofollow', 'Follow', 'None', 'Noimageindex', 'Noarchive', 'Nocache');
    }
}
