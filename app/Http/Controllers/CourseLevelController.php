<?php

namespace App\Http\Controllers;

use App\Http\Requests\IdName\StoreIdNameRequest;
use App\Http\Requests\IdName\UpdateIdNameRequest;
use App\Http\Resources\IdNameResource;
use App\Http\Resources\LevelFullResource;
use App\Http\Resources\LevelResource;
use App\Models\Course\Course;
use App\Models\Course\Level;
use Illuminate\Http\Request;

class CourseLevelController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth:sanctum', 'teacher'])->except(['index', 'show']);
    }

    /**
     * Display a listing of the resource.
     */
    public function index(Course $course)
    {
        return response()->json([
            'levels' => LevelResource::collection($course->levels)
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreIdNameRequest $request, Course $course)
    {
        $level = Level::query()->create([
            'name' => $request->input('name'),
            'course_id' => $course->id
        ]);

        return response()->json([
            'level' => new LevelResource($level)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Course $course, Level $level)
    {
        return response()->json([
            'level' => new LevelFullResource($level)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateIdNameRequest $request, Course $course, Level $level)
    {
        $level->update([
            'name' => $request->input('name')
        ]);

        return response()->json([
            'level' => new LevelResource($level)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Course $course, Level $level)
    {
        $level->delete();

        return response()->json([
            'status' => true
        ]);
    }
}
