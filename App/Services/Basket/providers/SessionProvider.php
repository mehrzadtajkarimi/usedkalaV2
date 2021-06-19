<?php

namespace App\Services\Basket\providers;

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


    public function add($item)
    {
        $count = $_SESSION['cart'][$item->id]->count  ?? 0;
        if ($this->item_exists($item->id)) {
            $_SESSION['cart'][$item->id] =$item;
        }
        $_SESSION['cart'][$item->id]->count = ++$count;
    }


    public function remove($item_id)
    {
        if ($this->item_exists($item_id)) {
            unset($_SESSION['cart'][$item_id]);
        }
    }


    public function total()
    {
        $total_price = 0;
        foreach ($this->items() as $item) {
            $total_price += $item->price * $item->count ;
        }
        return $total_price;
    } //total contract



    public function reset()
    {
        if (isset($_SESSION['cart'])) {
            unset($_SESSION['cart']);
        }
    }


    public function items()
    {
        return $_SESSION['cart'] ?? array();
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
