<?php

namespace App\Services\Upload;

use App\Services\Upload\Contract\UploadContract;
use App\Utilities\FlashMessage;

class UploadedFile implements UploadContract
{
    private $files;
    private $paths_for_storage;
    private $paths_for_database;
    const default_subfolder_format = "Ym";

    public function __construct($file_params)
    {
        // array_keys($files_param)[0] output : name input file
        unset($file_params[array_keys($file_params)[0]]['error']);
        unset($file_params[array_keys($file_params)[0]]['size']);
        unset($file_params[array_keys($file_params)[0]]['type']);

        foreach ($file_params as  $values) {
            foreach ($values as $key => $value) {
                $this->files[$key] = array_filter($value);
            }
        }

        $count = count($this->files[array_keys($this->files)[0]]);
        for ($i = 0; $i < $count; $i++) {
            $paths_in_storage           = $this->generate_paths_in_storage($i);
            $this->paths_for_database[] = base_url() . "Storage/$paths_in_storage";
            $this->paths_for_storage[]  = BASEPATH . "Public/Storage/$paths_in_storage";
        }
    }


    public function  generate_paths_in_storage($key)
    {
        $name             = substr($this->files['name'][$key], 0, 64);
        $name_explode     = explode('.', $name);
        $type_file        = end($name_explode);
        $basename         = basename($name, $type_file);
        $basename_trim    = trim($basename);
        $sub_folder_date  = date(self::default_subfolder_format);
        $paths_in_storage = BASEPATH . 'Public/Storage/' . $sub_folder_date;
        !file_exists($paths_in_storage) ? mkdir($paths_in_storage) : '';

        return $sub_folder_date . '/' . $basename_trim . '---' . $this->generate_random_str() . '.' . $type_file;
    }
    private function generate_random_str()
    {
        return bin2hex(random_bytes(4));
    }

    public function destroy()
    {
        if (!file_exists($this->paths_for_storage)) {
            return;
        }
        return unlink($this->paths_for_storage);
    }

    private function upload()
    {
        echo '<pre>';
        var_dump($this->paths_for_storage);
        echo '</pre><br>';die;
        foreach ($this->files['tmp_name'] as $key => $path) {
            return move_uploaded_file($path, $this->paths_for_storage[$key]);
        }
    }


    public function save()
    {
        return $this->upload() ? $this->paths_for_database : false;
    }
}
