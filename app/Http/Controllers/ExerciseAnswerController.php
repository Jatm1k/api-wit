<?php

namespace App\Http\Controllers;

use App\Http\Requests\Answer\StoreExerciseAnswerRequest;
use App\Http\Requests\Answer\UpdateExerciseAnswerRequest;
use App\Http\Resources\ExerciseAnswerResource;
use App\Models\Exercise\Exercise;
use App\Models\Exercise\ExerciseAnswer;
use App\Models\Exercise\ExerciseAnswerFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ExerciseAnswerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Exercise $exercise)
    {
        if (auth()->user()->role_id === 1) {
            $answer = $exercise->answers()->where('user_id', auth()->id())->first();
            return response()->json([
                'answer' => new ExerciseAnswerResource($answer)
            ]);
        }
        return response()->json([
            'answers' => ExerciseAnswerResource::collection($exercise->answers)
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreExerciseAnswerRequest $request, Exercise $exercise)
    {
        $answer = $exercise->answers()->create([
            'user_id' => auth()->id()
        ]);

        foreach ($request->file('files') as $file) {
            $answer->files()->create([
                'name' => $file->getClientOriginalName(),
                'link' => uploadFile($file, 'answers')
            ]);
        }

        return response()->json([
            'answer' => new ExerciseAnswerResource($answer)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(ExerciseAnswer $answer)
    {
        return response()->json([
            'answer' => new ExerciseAnswerResource($answer)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateExerciseAnswerRequest $request, ExerciseAnswer $answer)
    {
        foreach ($request->file('files') as $file) {
            $answer->files()->create([
                'name' => $file->getClientOriginalName(),
                'link' => uploadFile($file, 'answers')
            ]);
        }

        return response()->json([
            'answer' => new ExerciseAnswerResource($answer)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ExerciseAnswer $answer)
    {
        foreach ($answer->files as $file) {
            $fileName = explode('/', $file->link);
            $fileName = end($fileName);
            Storage::disk('public')->delete("uploads/answers/{$fileName}");
        }

        $answer->delete();

        return response()->json([
            'status' => true
        ]);
    }

    public function destroyAnswerFile(ExerciseAnswer $answer, ExerciseAnswerFile $exerciseAnswerFile)
    {
        $fileName = explode('/', $exerciseAnswerFile->link);
        $fileName = end($fileName);
        Storage::disk('public')->delete("uploads/answers/{$fileName}");

        $exerciseAnswerFile->delete();

        return response()->json([
            'status' => true
        ]);
    }
}
