<?php

namespace App\Models\Exercise;

use App\Models\User\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ExerciseAnswer extends Model
{
    use HasFactory;

    protected $fillable = [
        'exercise_id',
        'user_id'
    ];

    public function user() :BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function files() :HasMany
    {
        return $this->hasMany(ExerciseAnswerFile::class);
    }
}
