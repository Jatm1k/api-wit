<?php

namespace App\Models\Exercise;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExerciseFile extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'exercise_id',
        'link'
    ];
}
