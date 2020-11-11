<?php namespace Cbble\Broker\Updates;

use Schema;
use October\Rain\Database\Schema\Blueprint;
use October\Rain\Database\Updates\Migration;

class CreateBrokersTable extends Migration
{
    public function up()
    {
        Schema::create('cbble_broker_brokers', function (Blueprint $table) {

            Schema::dropIfExists('cbble_broker_brokers');

            $table->engine = 'InnoDB';
            $table->increments('id');
            $table->string('name', 64);
            $table->string('slug', 64);
            $table->string('title')->nullable();
            $table->enum('status', ['scam', 'trusted'])->default('scam');
            $table->json('specifics')->nullable();
            $table->text('excerpt')->nullable();
            $table->longText('content')->nullable();
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
