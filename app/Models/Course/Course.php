<?php

namespace App\Models\Course;

use App\Models\User\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'direction_id',
        'author_id',
        'age_category_id',
    ];

    public function direction() :BelongsTo
    {
        return $this->belongsTo(Direction::class);
    }

    public function author() :BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function ageCategory() :BelongsTo
    {
        return $this->belongsTo(AgeCategory::class);
    }

    public function users() :BelongsToMany
    {
        return $this->belongsToMany(User::class)->withTimestamps();
    }

    public function levels() :HasMany
    {
        return $this->hasMany(Level::class);
    }
}
