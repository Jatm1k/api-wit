<?php

namespace App\Http\Requests\Course;

use App\Http\Requests\ApiRequest;
use Illuminate\Foundation\Http\FormRequest;

class AddMemberCourseRequest extends ApiRequest
{
    public function rules(): array
    {
        return [
            'user_id' => ['required', 'int', 'exists:users,id']
        ];
    }
}
