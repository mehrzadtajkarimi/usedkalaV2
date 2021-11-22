<?php

namespace App\Controllers\Backend;

use App\Controllers\Controller;

class RoleController  extends Controller
{
    public function index()
    {
        $data = array(
            'Examples' => 'Examples',
        );
        return view('Backend.role.index', $data);
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
