<?php

namespace Database\Factories\Exercise;

use App\Models\Exercise\ExerciseAnswer;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Exercise\ExerciseAnswerFile>
 */
class ExerciseAnswerFileFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->word(),
            'link' => fake()->imageUrl(),
            'exercise_answer_id' => ExerciseAnswer::inRandomOrder()->first()->id,
        ];
    }
}
