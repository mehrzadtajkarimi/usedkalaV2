<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;

class PermissionController  extends Controller
{
    public function index()
    {
        $data = array(
            'categories' => '',
        );
        return view('Backend.permission.index', $data);
    }


    public function create()
    {
    }


    public function store()
    {
    }



    public function edit()
    {
    }



    public function update()
    {
    }



    public function destroy()
    {
    }
}
