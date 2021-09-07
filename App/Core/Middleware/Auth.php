<?php

namespace App\Core\Middleware;

use App\Core\Middleware\Contract\MiddlewareInterface;
use App\Models\User;
use App\Services\Session\SessionManager;

class Auth extends User implements MiddlewareInterface
{
    public function handle()
    {
        global $request;

        // $this->already_exists();
        dd($_SESSION);
        if ($request->segment(1) == 'admin') {
            if (SessionManager::has('phone') ) {
               return ;
            }
            if (!SessionManager::has('auth') ) {
               return $request->redirect('admin/login');
            }
          return ;
        }
    }
}
