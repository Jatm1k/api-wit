<?php

namespace Database\Factories\Exercise;

use App\Models\Course\Level;
use App\Models\Exercise\ExerciseType;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Exercise\Exercise>
 */
class ExerciseFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => fake()->text(10),
            'text' => fake()->text(),
            'video' => fake()->imageUrl(),
            'level_id' => Level::inRandomOrder()->first()->id,
            'exercise_type_id' => ExerciseType::inRandomOrder()->first()->id
        ];
    }
}
