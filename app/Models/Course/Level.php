<?php

namespace App\Models\Course;

use App\Models\Exercise\Exercise;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Level extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'course_id'
    ];

    public function exercises() :HasMany
    {
        return $this->hasMany(Exercise::class);
    }
}
