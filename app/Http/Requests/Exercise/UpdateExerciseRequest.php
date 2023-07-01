<?php

namespace App\Http\Requests\Exercise;

use App\Http\Requests\ApiRequest;
use Illuminate\Foundation\Http\FormRequest;

class UpdateExerciseRequest extends ApiRequest
{
    public function rules(): array
    {
        return [
            'title' => ['required', 'string', 'max:255'],
            'text' => ['required', 'string'],
            'video' => ['nullable', 'file'],
            'level_id' => ['required', 'int', 'exists:levels,id'],
            'exercise_type_id' => ['required', 'int', 'exists:exercise_types,id'],
            'files' => ['nullable', 'array'],
            'files.*' => ['file'],
        ];
    }
}
