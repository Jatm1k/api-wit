<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class TeacherAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (is_null(auth()->user())) {
            return response()->json([
                'error' => [
                    'code' => 403,
                    'message' => 'Вы не авторизованы'
                ]
            ], 403);
        }
        if(auth()->user()->role_id !== 3 && auth()->user()->role_id !== 2) {
            return response()->json([
                'error' => [
                    'code' => 403,
                    'message' => 'У вас недостаточно прав'
                ]
            ], 403);
        }
        return $next($request);
    }
}
