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

        echo '<pre>'; var_dump($request->ip());

        
        echo '<br>'.'Gate';
        die;
        $activity_log = new LogManager();
        $activity_log->set([
            'user_id' => Auth::is_login(),
            'ip' => $request->ip(),

        ]);

        return;
    }
}
