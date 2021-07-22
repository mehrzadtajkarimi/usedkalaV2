<?php

namespace App\Core\Middleware;

use App\Core\Middleware\Contract\MiddlewareInterface;
use App\Services\Session\SessionManager;

class Auth implements MiddlewareInterface
{
    public function handle()
    {
        global $request;

        if ($request->segment(1) == 'admin') {
            if (!SessionManager::has('auth') ) {
               return $request->redirect('admin/login');
            }
          return ;
        }
    }
}
