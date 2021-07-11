<?php

namespace App\Core;

class Request
{
    private  $params;
    private  $files;
    private  $rout_params;
    private  $form_method;
    private  $method;
    private  $ip;
    private  $agent;
    private  $uri;

    public  function __construct()
    {
        $this->form_method = isset($_REQUEST['_method']) ? $_REQUEST['_method'] : '';
        $this->params = $_REQUEST;
        $this->files = $_FILES;
        $this->method = strtolower($_SERVER['REQUEST_METHOD']);
        $this->ip = $_SERVER['SERVER_ADDR'];
        $this->agent = $_SERVER['HTTP_USER_AGENT'];
        $this->uri = strtok($_SERVER['REQUEST_URI'], '?');
    }

    // get from router  method regex_matched
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

    public  function files()
    {
        return $this->files;
    }

    public  function method()
    {
        if ($this->method == 'post' && !empty($this->form_method)) {
            $this->method = $this->form_method;
        }
        return $this->method;
    }

    public  function form_method()
    {
        return $this->form_method;
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

    public  function isset($key)
    {
        return isset($this->params[$key]);
    }

    public static  function redirect($rout)
    {
        header('Location: ' . base_url($rout));
        exit();
    }

}
