<?php

use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

if(!function_exists('uploadFile')) {
    function uploadFile(UploadedFile $file, $dir) {
        $fileName = time() . '_' . $file->getClientOriginalName();
        $uploadedFile = Storage::putFileAs("public/uploads/{$dir}", $file, $fileName);
        return env('APP_URL') . Storage::url($uploadedFile);
    }
}
