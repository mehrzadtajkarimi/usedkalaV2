<?php

namespace App\Controllers;

use App\Controllers\Controller;

class ExamplesController  extends Controller
{
    public function index()
    {
        $data = array(
            'Examples' => 'Examples',
        );
        return view('Backend.examples.index', $data);
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
