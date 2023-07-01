<?php

namespace App\Http\Controllers;

use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use App\Http\Resources\UserResource;
use App\Models\User\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(RegisterRequest $request)
    {
        if (auth()->user()->role_id === 2 && $request->input('role_id') !== 1) {
            return response()->json([
                'error' => [
                    'code' => 422,
                    'message' => 'У вас недостаточно прав'
                ]
            ], 422);
        }
        $user = User::query()->create([
            'first_name' => $request->input('first_name'),
            'last_name' => $request->input('last_name'),
            'email' => $request->input('email'),
            'role_id' => $request->input('role_id'),
            'password' => Hash::make($request->input('password')),
        ]);

        return response()->json([
            'user' => new UserResource($user)
        ], 201);
    }

    public function login(LoginRequest $request)
    {
        if (!Auth::attempt($request->validated())) {
            return response()->json([
                'error' => [
                    'code' => 422,
                    'message' => 'Неверный логин или пароль',
                    'errors' => [
                        'password' => ['Неверный логин или пароль']
                    ]
                ]
            ]);
        }

        return response()->json([
            'token' => auth()->user()->createToken('auth_token')->plainTextToken,
            'user' => new UserResource(auth()->user())
        ]);
    }
}
