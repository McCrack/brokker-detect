<?php namespace CBBLe\Glossary\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateTermsTable extends Migration
{
    public function up()
    {
        Schema::create('cbble_glossary_terms', function (Blueprint $table) {

            Schema::dropIfExists('cbble_glossary_terms');

            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->char('index', 1)->index();
            $table->string('term', 128);
            $table->string('slug', 128);
            $table->text('definition');
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('cbble_glossary_terms');
    }
}
