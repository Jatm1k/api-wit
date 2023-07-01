<?php

namespace App\Http\Controllers;

use App\Http\Requests\IdName\StoreIdNameRequest;
use App\Http\Requests\IdName\UpdateIdNameRequest;
use App\Http\Resources\IdNameResource;
use App\Models\Exercise\ExerciseType;
use Illuminate\Http\Request;

class ExerciseTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $exerciseTypes = ExerciseType::all();
        return response()->json([
            'exercise_types' => IdNameResource::collection($exerciseTypes)
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreIdNameRequest $request)
    {
        $exerciseType = ExerciseType::query()->create([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'exercise_type' => new IdNameResource($exerciseType)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(ExerciseType $exerciseType)
    {
        return response()->json([
            'exercise_type' => new IdNameResource($exerciseType)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateIdNameRequest $request, ExerciseType $exerciseType)
    {
        $exerciseType->update([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'exercise_type' => new IdNameResource($exerciseType)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExerciseType $exerciseType)
    {
        $exerciseType->delete();

        return response()->json([
            'status' => true
        ]);
    }
}
