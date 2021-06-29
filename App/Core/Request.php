<?php

namespace App\Core;

class Request
{
    private  $params;
    private  $rout_params;
    private  $method;
    private  $ip;
    private  $agent;
    private  $uri;

    public  function __construct()
    {
        $this->params = $_REQUEST;
        $this->method = strtolower($_SERVER['REQUEST_METHOD']);
        $this->ip = $_SERVER['SERVER_ADDR'];
        $this->agent = $_SERVER['HTTP_USER_AGENT'];
        $this->uri = strtok($_SERVER['REQUEST_URI'], '?');
    }
    public function set_param($key, $value)
    {
        $this->rout_params[$key] = $value;
    }
    public function get_param($key = null)
    {
        return is_null($key) ? $this->rout_params : $this->rout_params[$key];
    }
    public function segment($key)
    {
        $segment = explode('/', $this->uri());
        return $segment[$key] ?? null;
    }

    public  function params()
    {
        return $this->params;
    }
    public  function method()
    {
        return $this->method;
    }
    public  function ip()
    {
        return $this->ip;
    }
    public  function agent()
    {
        return $this->agent;
    }
    public  function uri()
    {
        return $this->uri;
    }
    public  function input($key)
    {
        return $this->params[$key] ?? null;
    }
    public static  function redirect($rout)
    {
        header('Location: ' . base_url($rout));
        die();
    }
}
