<?php

namespace App\Http\Controllers;

use App\Http\Requests\IdName\StoreIdNameRequest;
use App\Http\Requests\IdName\UpdateIdNameRequest;
use App\Http\Resources\IdNameResource;
use App\Models\Course\Direction;

class DirectionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $directions = Direction::all();
        return response()->json([
            'directions' => IdNameResource::collection($directions)
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreIdNameRequest $request)
    {

        $direction = Direction::query()->create([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'direction' => new IdNameResource($direction)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Direction $direction)
    {
        return response()->json([
            'direction' => new IdNameResource($direction)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateIdNameRequest $request, Direction $direction)
    {
        $direction->update([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'direction' => new IdNameResource($direction)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Direction $direction)
    {
        $direction->delete();
        return response()->json([
            'status' => true
        ]);
    }
}
