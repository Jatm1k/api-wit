<?php

namespace App\Http\Requests\Answer;

use App\Http\Requests\ApiRequest;
use Illuminate\Foundation\Http\FormRequest;

class UpdateExerciseAnswerRequest extends ApiRequest
{
    public function rules(): array
    {
        return [
            'files' => ['nullable', 'array'],
            'files.*' => ['file']
        ];
    }
}
