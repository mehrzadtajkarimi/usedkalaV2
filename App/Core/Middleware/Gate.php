<?php

namespace App\Middleware;

use App\Core\Middleware\Contract\MiddlewareInterface;

class Gate implements MiddlewareInterface
{
    public function handle()
    {
        // global $request;

        // echo '<pre>'; var_dump($request);

        echo '<br>'.'Gate';

        return;
    }
}
