<?php

namespace App\Http\Requests\Course;

use App\Http\Requests\ApiRequest;
use Illuminate\Foundation\Http\FormRequest;

class IndexCourseRequest extends ApiRequest
{
    public function rules(): array
    {
        return [
            'min' => ['nullable', 'boolean'],
            'sort' => ['nullable', 'string', 'in:id,title,description,direction_id,author_id,age_category_id'],
            'dir' => ['required_with:sort', 'in:desc,asc'],
            'q' => ['nullable', 'string']
        ];
    }
}
