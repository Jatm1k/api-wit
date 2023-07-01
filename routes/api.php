<?php

use App\Http\Controllers\AgeCategoryController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\CourseLevelController;
use App\Http\Controllers\DirectionController;
use App\Http\Controllers\ExerciseAnswerController;
use App\Http\Controllers\ExerciseTypeController;
use App\Http\Controllers\ExerciseController;
use App\Http\Controllers\RoleController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::controller(AuthController::class)->group(function () {
    Route::middleware(['auth:sanctum', 'teacher'])->post('register', 'register');
    Route::post('login', 'login');
});

Route::middleware(['auth:sanctum', 'admin'])->group(function () {
    Route::apiResources([
        'roles' => RoleController::class,
        'directions' => DirectionController::class,
        'age-categories' => AgeCategoryController::class,
        'exercise-types' => ExerciseTypeController::class
    ]);
});


Route::apiResource('courses', CourseController::class);
Route::controller(CourseController::class)->prefix('courses')->group(function () {
    Route::post('/{course}/add-member', 'addMember');
});

Route::middleware('auth:sanctum')->get('/my-courses', [CourseController::class, 'getMyCourses']);

Route::apiResource('courses.levels', CourseLevelController::class)->shallow();

Route::apiResource('exercises', ExerciseController::class);
Route::controller(ExerciseController::class)->prefix('exercises')->group(function () {
    Route::delete('/{exercise}/{exerciseFile}', 'destroyExerciseFile');
    Route::patch('/{exercise}/video', 'destroyExerciseVideo');
});
Route::middleware('auth:sanctum')->apiResource('exercises.answers', ExerciseAnswerController::class)->shallow();
Route::middleware('auth:sanctum')->controller(ExerciseAnswerController::class)->prefix('answers')->group(function () {
    Route::delete('/{answer}/{exerciseAnswerFile}', 'destroyAnswerFile');
});




