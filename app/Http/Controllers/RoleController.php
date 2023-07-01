<?php

namespace App\Http\Controllers;

use App\Http\Requests\IdName\StoreIdNameRequest;
use App\Http\Requests\IdName\UpdateIdNameRequest;
use App\Http\Resources\IdNameResource;
use App\Models\User\Role;

class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $roles = Role::all();
        return response()->json([
            'roles' => IdNameResource::collection($roles)
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreIdNameRequest $request)
    {
        $role = Role::query()->create([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'role' => new IdNameResource($role)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Role $role)
    {
        return response()->json([
            'role' => new IdNameResource($role)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateIdNameRequest $request, Role $role)
    {
        $role->update([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'role' => new IdNameResource($role)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Role $role)
    {
        $role->delete();
        return response()->json([
            'status' => true
        ]);
    }
}
