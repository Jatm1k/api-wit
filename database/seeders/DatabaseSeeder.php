<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Course\AgeCategory;
use App\Models\Course\Course;
use App\Models\Course\Direction;
use App\Models\Course\Level;
use App\Models\Exercise\Exercise;
use App\Models\Exercise\ExerciseAnswer;
use App\Models\Exercise\ExerciseAnswerFile;
use App\Models\Exercise\ExerciseFile;
use App\Models\Exercise\ExerciseType;
use App\Models\User\Role;
use App\Models\User\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();
        Role::factory(3)->create();
        $users = User::factory(10)->create();
        Direction::factory(3)->create();
        AgeCategory::factory(3)->create();
        $courses = Course::factory(20)->hasAttached($users)->create();
        Level::factory(50)->create();
        ExerciseType::factory(2)->create();
        Exercise::factory(100)->create();
        ExerciseFile::factory(50)->create();
        ExerciseAnswer::factory(50)->create();
        ExerciseAnswerFile::factory(50)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
