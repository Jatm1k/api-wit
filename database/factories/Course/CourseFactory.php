<?php

namespace Database\Factories\Course;

use App\Models\Course\AgeCategory;
use App\Models\Course\Direction;
use App\Models\User\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class CourseFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => fake()->word(),
            'description' => fake()->text(),
            'direction_id' => Direction::inRandomOrder()->first()->id,
            'author_id' => User::query()->where('role_id', 2)->inRandomOrder()->first()->id,
            'age_category_id' => AgeCategory::inRandomOrder()->first()->id
        ];
    }
}
