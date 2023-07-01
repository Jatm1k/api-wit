<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    protected function unauthenticated($request, array $guards)
    {
        return response()->json([
            'error' => [
                'code' => 403,
                'message' => 'Вы не авторизованы'
            ]
        ], 403);
    }
}
