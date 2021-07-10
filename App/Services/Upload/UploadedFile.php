<?php

namespace App\Services\Upload;

use App\Services\Upload\Contract\UploadContract;
use App\Utilities\FlashMessage;

class UploadedFile implements UploadContract
{
    private $file;
    private $path_in_storage;
    const default_subfolder_format = "Ym";

    public function __construct($fileName, $sub_folder = null)
    {
        $this->file = $_FILES[$fileName];

        if ($sub_folder == null) {
            $sub_folder = date(self::default_subfolder_format);
            $sub_folder_path = base_url(). 'storage/' . $sub_folder;
            if (!file_exists($sub_folder_path)) {
                mkdir($sub_folder_path);
            }
        }
        FlashMessage::add("این فقط یه مثال در کانستراکتور آپلودفایل است.", FlashMessage::INFO);

        $this->path_in_storage = $sub_folder . "/" . $this->basename() . '-' . $this->generateRandomStr() . $this->extension();
    }

    public function mimeType()
    {
        return $this->file['type'];
    }

    public function size()
    {
        return $this->file['size'];
    }

    public function name()
    {
        return substr($this->file['name'], 0, 32);
    }

    public function extension()
    {
        $arr = explode('.', $this->name());
        return '.' . end($arr);
    }

    public function basename()
    {
        return basename($this->name(), $this->extension());
    }


    private function generateRandomStr()
    {
        return bin2hex(random_bytes(2));
    }

    private function upload($path)
    {
        return move_uploaded_file($this->file['tmp_name'], $path);
    }

    public function destroy()
    {
        $path        =  base_url(). 'storage/'  . $this->path_in_storage;
        if (!file_exists($path)) {
            return;
        }
        return rename($path, "$path.deleted");
    }

    public function save()
    {
        $path        =  base_url(). 'storage/'  . $this->path_in_storage;
        if ($this->upload($path)) {
            return storage_url($this->path_in_storage);
        }
        return false;
    }
}
