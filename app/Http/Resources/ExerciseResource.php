<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ExerciseResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'text' => $this->text,
            'video' => $this->video,
            'exercise_type' => new IdNameResource($this->exerciseType),
            'files' => FileLinkResource::collection($this->files),
            'answers' => ExerciseAnswerResource::collection($this->answers)
        ];
    }
}
