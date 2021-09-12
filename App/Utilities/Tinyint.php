<?php
namespace App\Utilities;

class Tinyint{

    static function  category_robots()
    {
        return array('Noindex', 'Index', 'Nofollow', 'Follow', 'None', 'Noimageindex', 'Noarchive', 'Nocache');
    }
}
