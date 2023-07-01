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
        Schema::table('courses', function (Blueprint $table) {
            $table->foreignId('direction_id')->nullable()->after('description')->constrained('directions')->nullOnDelete();
            $table->foreignId('age_category_id')->nullable()->after('author_id')->constrained('age_categories')->nullOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('courses', function (Blueprint $table) {
            $table->dropForeign(['direction_id', 'age_category_id']);
            $table->dropColumn(['direction_id', 'age_category_id']);
        });
    }
};
