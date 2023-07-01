<?php

namespace App\Http\Requests\Exercise;

use App\Http\Requests\ApiRequest;
use Illuminate\Foundation\Http\FormRequest;

class IndexExerciseRequest extends ApiRequest
{
    public function rules(): array
    {
        return [
            'level_id' => ['required', 'int', 'exists:levels,id'],
        ];
    }
}
