<?php

namespace App\database\seeders;

use App\Models\Setting;
use App\Models\SiteContent;


class SiteContentSeeder
{


    public function seedSiteContents()
    {
        $objects = [

            [
                'tag' => 'contact_info',
                'key' => 'support',
                'value' => 'همه روزه از ساعت ۸صبح تا ۳ بامداد 02191070771',
            ],
            [
                'tag' => 'contact_info',
                'key' => 'trade',
                'value' => 'همه روزه حتی در ایام تعطیل',
            ],
            [
                'tag' => 'contact_info',
                'key' => 'auth',
                'value' => 'همه روزه بجز ایام تعطیل از ساعت ۸صبح تا ۱۷ عصر',
            ],
            [
                'tag' => 'contact_info',
                'key' => 'address',
                'value' => 'ایران، تهران، منطقه ۲، سعادت آباد، سرو غربی، خیابان صدف، تی بیتو',
            ]
        ];

        foreach ($objects as $object) {
            $obj = new Setting();
        }
    }
}
