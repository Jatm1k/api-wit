<?php

namespace Database\Factories\Exercise;

use App\Models\Exercise\Exercise;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Exercise\ExerciseFile>
 */
class ExerciseFileFactory extends Factory
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
            'exercise_id' => Exercise::inRandomOrder()->first()->id,
        ];
    }
}
