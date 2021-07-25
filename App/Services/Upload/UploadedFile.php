<?php

namespace App\Services\Upload;

use App\Services\Upload\Contract\UploadContract;
use App\Utilities\FlashMessage;

class UploadedFile implements UploadContract
{
    private $files;
    private $file_names;
    private $file_tmp_names;
    private $path_in_storage;
    const default_subfolder_format = "Ym";

    public function __construct($file_params, $sub_folder = null)
    {
        if ($sub_folder == null) {
            $sub_folder = date(self::default_subfolder_format);
            $sub_folder_path = BASEPATH . 'Public/Storage/' . $sub_folder;
            if (!file_exists($sub_folder_path)) {
                mkdir($sub_folder_path);
            }
        }
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
            $this->file_names['name'] = $this->files['name'];
            $this->file_tmp_names['tmp_name'] = $this->files['tmp_name'];
            $this->path_in_storage[] = $sub_folder . "/" . $this->basename($i) . '---' . $this->generateRandomStr() . $this->extension();
        }

        echo '<pre>';
        var_dump($this->files['name'][0]);
        echo '</pre><br>';die;
    }


    public function  basename($key)
    {
        return basename($this->name($key), $this->extension());
    }
    private function generateRandomStr()
    {
        return bin2hex(random_bytes(4));
    }
    public function extension()
    {
        $arr = explode('.', $this->name());
        return '.' . end($arr);
    }


    public function name($key)
    {
        return substr($this->file_names[$key], 0, 128);
    }

    private function upload($path)
    {
        return move_uploaded_file($this->file['tmp_name'], $path);
    }

    public function destroy()
    {
        $path        =  BASEPATH . 'Public/Storage/'  . $this->path_in_storage;
        if (!file_exists($path)) {
            return;
        }
        return unlink($path);
    }

    public function save()
    {
        $path        =  BASEPATH . 'Public/Storage/' . $this->path_in_storage;
        if ($this->upload($path)) {
            return storage_url($this->path_in_storage);
        }
        return false;
    }
}
