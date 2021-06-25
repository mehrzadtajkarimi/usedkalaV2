<?php

namespace App\Utilities;

class FlashMessage
{
    const SUCCESS = 1;
    const ERROR = 2;
    const WARNING = 3;
    const INFO = 4;

    public static $has_error = false;

    public static function add($msg, $type = FlashMessage::SUCCESS)
    {
        if (!isset($_SESSION['flash_message'])) {
            $_SESSION['flash_message'] = array();
        }
        $_SESSION['flash_message'][] = (object)['mag' => $msg, 'type' => $type];
        if ($type == FlashMessage::ERROR) {
            self::$has_error = true;
        }
    }


    public static function clean()
    {
        $_SESSION['flash_message'] = array();
        self::$has_error = false;
    }

    public static function get_message()
    {
        return $_SERVER['flash_message'] ?? array();
    }

    public static function show_message()
    {
        $flash_message = self::get_message();
        if (empty($flash_message)) {
            return;
        }
        $data =['flash_message'=>$flash_message];
        view_flash_message('error.flash.notice',$data);
        self::clean();
    }
}