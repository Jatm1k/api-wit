<?php

namespace App\Models\Exercise;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Exercise extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'text',
        'video',
        'level_id',
        'exercise_type_id'
    ];

    public function exerciseType() :BelongsTo
    {
        return $this->belongsTo(ExerciseType::class);
    }

    public function files() :HasMany
    {
        return $this->hasMany(ExerciseFile::class);
    }

    public function answers() :HasMany
    {
        return $this->hasMany(ExerciseAnswer::class);
    }
}
