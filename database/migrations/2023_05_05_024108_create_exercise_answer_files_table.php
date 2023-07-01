<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('exercise_answer_files', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->foreignId('exercise_answer_id')->constrained('exercise_answers')->cascadeOnDelete();
            $table->string('link');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exercise_answer_files');
    }
};
