<?php

namespace App\Http\Controllers;

use App\Http\Requests\IdName\StoreIdNameRequest;
use App\Http\Resources\IdNameResource;
use App\Models\Course\AgeCategory;
use Illuminate\Http\Request;

class AgeCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $ageCategories = AgeCategory::all();
        return response()->json([
            'age_categories' => IdNameResource::collection($ageCategories)
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreIdNameRequest $request)
    {
        $ageCategory = AgeCategory::query()->create([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'age_category' => new IdNameResource($ageCategory)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(AgeCategory $ageCategory)
    {
        return response()->json([
            'age_category' => new IdNameResource($ageCategory)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, AgeCategory $ageCategory)
    {
        $ageCategory->update([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'age_category' => new IdNameResource($ageCategory)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(AgeCategory $ageCategory)
    {
        $ageCategory->delete();
        return response()->json([
            'status' => true
        ]);
    }
}
