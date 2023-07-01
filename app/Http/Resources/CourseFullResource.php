<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CourseFullResource extends JsonResource
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
            'description' => $this->description,
            'direction' => new IdNameResource($this->direction),
            'author' => new UserResource($this->author),
            'age_category' => new IdNameResource($this->ageCategory),
            'levels' => LevelFullResource::collection($this->levels)
        ];
    }
}
