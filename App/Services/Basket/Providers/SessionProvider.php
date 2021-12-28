<?php

namespace App\Services\Basket\Providers;

use App\Services\Basket\Basket;
use App\Services\Basket\Contract\BasketContract;

class SessionProvider implements BasketContract
{
    public static $instance = null;

    private  function __construct()
    {
        if (!$this->count()) {
            $_SESSION['cart'] = array();
        }
    }

    public static function instance()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function items()
    {
        return $_SESSION['cart'] ?? array();
    }

    public function add(array $item)
    {
        $count = $_SESSION['cart'][$item['id']]['count'] ?? 0;

        if (!$this->item_exists($item['id'])) {
            $_SESSION['cart'][$item['id']] = $item;
        }

        $_SESSION['cart'][$item['id']]['count'] = $count + $item['product_quantity'];
    }

    public function plus($product_id)
    {
        return  $_SESSION['cart'][$product_id]['count'] += 1;
    }

    public function minus($product_id)
    {
        if ($_SESSION['cart'][$product_id]['count'] > 1) {
            $_SESSION['cart'][$product_id]['count'] -= 1;
        }
        return $_SESSION['cart'][$product_id]['count'];
    }


    public function remove($item_id)
    {
        if ($this->item_exists($item_id)) {
            unset($_SESSION['cart'][$item_id]);
        }
    }
    public function has_coupon(int $percent = null): int
    {
        if (is_null($percent)) {
            return  $_SESSION['cart']['percent'] ?? 0;
        }
        if ($this->item_exists('percent')) {
            if ($_SESSION['cart']['percent'] != $percent) {
                return $_SESSION['cart']['percent'] = $percent;
            }
            return $_SESSION['cart']['percent'];
        }
        return  $_SESSION['cart']['percent'] = $percent;
    }


    public function total($discounts_percent = null)
    {
        $total_price = 0;
        if (is_numeric($discounts_percent)) {
            $item = $this->items()[$discounts_percent];
            $total_price = $item['price'] * $item['count'];
        } else {
            $price = $this->items()[$discounts_percent['id']]['price'];
            $count = $this->items()[$discounts_percent['id']]['count'];
            $total_price = ($price * ((100 - $discounts_percent["discounts_percent"]) / 100)) * $count;
        }

        if ($percent = Basket::has_coupon()) {
            $total_price - (100 - $percent / 100);
        }


        return $total_price;
    }



    public function reset()
    {
        if (isset($_SESSION['cart'])) {
            unset($_SESSION['cart']);
        }
    }



    public function count()
    {
        return count($this->items());
    }


    public function item_exists($item_id)
    {
        return isset($_SESSION['cart'][$item_id]);
    }
}
