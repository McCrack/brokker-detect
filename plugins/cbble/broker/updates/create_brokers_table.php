<?php namespace Cbble\Broker\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateBrokersTable extends Migration
{
    public function up()
    {
        Schema::create('cbble_broker_brokers', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('logo', 128)->nullable();
            $table->string('name', 64);
            $table->string('slug', 64);
            $table->string('title')->nullable();
            $table->text('excerpt')->nullable();
            $table->longText('content')->nullable();
            $table->json('images');
            $table->boolean('trusted')->default(false);
            $table->boolean('published')->default(false);
            $table->timestamp('published_at')->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('cbble_broker_brokers');
    }
}
