<?php

namespace App\Core\Middleware;

use App\Core\Middleware\Contract\MiddlewareInterface;

class GlobalMiddleware implements MiddlewareInterface
{
    public function handle()
    {
        $this->sanitizeGetParams();
    }


    private function sanitizeGetParams()
    {

        foreach ($_REQUEST as $key => $request) {
            if (is_array($request)) {
                $_REQUEST[$key] = xss_clean($request);
            }
        }
    }
}
