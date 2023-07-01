<?php

namespace App\Http\Requests\Course;

use App\Http\Requests\ApiRequest;

class UpdateCourseRequest extends ApiRequest
{
    public function rules(): array
    {
        return [
            'title' => ['required', 'string', 'max:255'],
            'description' => ['required', 'string'],
            'direction_id' => ['required', 'int', 'exists:directions,id'],
            'author_id' => ['required', 'int', 'exists:users,id'],
            'age_category_id' => ['required', 'int', 'exists:age_categories,id'],
        ];
    }
}
