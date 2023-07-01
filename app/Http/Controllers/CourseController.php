<?php

namespace App\Http\Controllers;

use App\Http\Requests\Course\AddMemberCourseRequest;
use App\Http\Requests\Course\IndexCourseRequest;
use App\Http\Requests\Course\StoreCourseRequest;
use App\Http\Requests\Course\UpdateCourseRequest;
use App\Http\Resources\CourseFullResource;
use App\Http\Resources\CourseMinifiedResource;
use App\Http\Resources\CourseResource;
use App\Models\Course\Course;
use Illuminate\Database\Eloquent\Builder;

class CourseController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth:sanctum', 'teacher'])->except(['index', 'show', 'getMyCourses']);
    }

    /**
     * Display a listing of the resource.
     */
    public function index(IndexCourseRequest $request)
    {
        $courses = Course::query()
            ->when(!is_null($request->input('sort')), function (Builder $query) use ($request) {
                return $query->orderBy($request->input('sort'), $request->input('dir'));
            })
            ->when(!is_null($request->input('q')), function (Builder $query) use ($request) {
                return $query->where('title', 'like', "%{$request->input('q')}%")
                    ->orWhere('description', 'like', "%{$request->input('q')}%");
            })
            ->get();

        if ($request->input('min')) {
            return response()->json([
                'courses' => CourseMinifiedResource::collection($courses)
            ]);
        }

        return response()->json([
            'courses' => CourseResource::collection($courses)
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCourseRequest $request)
    {
        $course = Course::query()->create([
            'title' => $request->input('title'),
            'description' => $request->input('description'),
            'direction_id' => $request->input('direction_id'),
            'author_id' => $request->input('author_id'),
            'age_category_id' => $request->input('age_category_id'),
        ]);

        $course->users()->attach($request->input('author_id'));

        return response()->json([
            'course' => new CourseResource($course)
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Course $course)
    {
        return response()->json([
            'course' => new CourseFullResource($course)
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCourseRequest $request, Course $course)
    {
        $course->update([
            'title' => $request->input('title'),
            'description' => $request->input('description'),
            'direction_id' => $request->input('direction_id'),
            'author_id' => $request->input('author_id'),
            'age_category_id' => $request->input('age_category_id'),
        ]);

        return response()->json([
            'course' => new CourseResource($course)
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Course $course)
    {
        $course->delete();

        return response()->json([
            'status' => true
        ]);
    }


    public function addMember(Course $course, AddMemberCourseRequest $request)
    {
        if ($course->users()->where('user_id', $request->input('user_id'))->exists()) {
            return response()->json([
                'error' => [
                    'code' => 422,
                    'message' => 'Данный пользователь уже зарегистрирован в курсе'
                ]
            ]);
        }
        $course->users()->attach($request->input('user_id'));
        return response()->json([
            'status' => true
        ], 201);
    }

    public function getMyCourses()
    {
        $courses = auth()->user()->courses;
        return response()->json([
            'courses' => CourseMinifiedResource::collection($courses)
        ]);
    }
}
