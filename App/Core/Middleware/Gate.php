<?php

namespace App\Core\Middleware;

use App\Core\Middleware\Contract\MiddlewareInterface;
use App\Services\Auth\Auth;
use App\Services\Log\LogManager;

class Gate implements MiddlewareInterface
{
    public function handle()
    {
        global $request;

        // echo '<pre>'; var_dump($_SERVER['HTTP_REFERER']); echo '</pre>';

        
        // echo '<br>'.'Gate';
        // die;
        // $activity_log = new LogManager();
        // $activity_log->set([
        //     'user_id'      => Auth::is_login(),
        //     'ip'           => $request->ip(),
        //     'http_referer' => $request->http_referer(),
         
        // ]);

        return;
    }
}
