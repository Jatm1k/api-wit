<?php

namespace App\Http\Controllers;

use App\Http\Requests\Exercise\IndexExerciseRequest;
use App\Http\Requests\Exercise\StoreExerciseRequest;
use App\Http\Requests\Exercise\UpdateExerciseRequest;
use App\Http\Resources\ExerciseMinifiedResource;
use App\Http\Resources\ExerciseResource;
use App\Models\Course\Level;
use App\Models\Exercise\Exercise;
use App\Models\Exercise\ExerciseFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ExerciseController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth:sanctum', 'teacher'])->except(['index', 'show']);
    }

    /**
     * Display a listing of the resource.
     */
    public function index(IndexExerciseRequest $request)
    {
        $exercises = Exercise::query()
            ->where('level_id', $request->input('level_id'))
            ->get();
        return response()->json([
            'exercises' => ExerciseMinifiedResource::collection($exercises)
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreExerciseRequest $request)
    {
        $exercise = Exercise::query()->create([
            'title' => $request->input('title'),
            'text' => $request->input('text'),
            'video' => $request->file('video') ? uploadFile($request->file('video'), 'videos') : null,
            'level_id' => $request->input('level_id'),
            'exercise_type_id' => $request->input('exercise_type_id')
        ]);

        if(!is_null($request->file('files'))) {
            foreach ($request->file('files') as $file) {
                $exercise->files()->create([
                    'name' => $file->getClientOriginalName(),
                    'link' => uploadFile($file, 'files')
                ]);
            }
        }


        return response()->json([
            'exercise' => new ExerciseResource($exercise)
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Exercise $exercise)
    {
        return response()->json([
            'exercise' => new ExerciseResource($exercise)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateExerciseRequest $request, Exercise $exercise)
    {
        $exercise->update([
            'title' => $request->input('title'),
            'text' => $request->input('text'),
            'video' => $request->file('video') ? uploadFile($request->file('video'), 'videos') : $exercise->video,
            'level_id' => $request->input('level_id'),
            'exercise_type_id' => $request->input('exercise_type_id')
        ]);

        if(!is_null($request->file('files'))) {
            foreach ($request->file('files') as $file) {
                $exercise->files()->create([
                    'name' => $file->getClientOriginalName(),
                    'link' => uploadFile($file, 'files')
                ]);
            }
        }

        return response()->json([
            'exercise' => new ExerciseResource($exercise)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Exercise $exercise)
    {
        $fileName = explode('/', $exercise->video);
        $fileName = end($fileName);
        Storage::disk('public')->delete("uploads/videos/{$fileName}");

        foreach ($exercise->files as $file) {
            $fileName = explode('/', $file->link);
            $fileName = end($fileName);
            Storage::disk('public')->delete("uploads/files/{$fileName}");
        }

        $exercise->delete();

        return response()->json([
            'status' => true
        ]);
    }

    public function destroyExerciseFile(Exercise $exercise, ExerciseFile $exerciseFile)
    {
        $fileName = explode('/', $exerciseFile->link);
        $fileName = end($fileName);
        Storage::disk('public')->delete("uploads/files/{$fileName}");

        $exerciseFile->delete();

        return response()->json([
            'status' => true
        ]);
    }

    public function destroyExerciseVideo(Exercise $exercise)
    {
        $fileName = explode('/', $exercise->video);
        $fileName = end($fileName);
        Storage::disk('public')->delete("uploads/videos/{$fileName}");
        $exercise->update([
            'video' => null
        ]);

        return response()->json([
            'status' => true
        ]);
    }
}
