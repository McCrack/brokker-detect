<?php namespace Cbble\Broker\Components;

use Cms\Classes\ComponentBase;

class Broker extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Broker Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [
            'slug' => [
                'title' => 'Link',
                'default' => '{{ :slug }}',
            ],
        ];
    }
    public function onRun()
    {
        $broker = \CBBLe\Broker\Models\Broker::where('slug', $this->property('slug'))->first();
        if (empty($broker)) {
            return $this->controller->run('404');
        }
        $this->page['broker'] = $broker;
    }
}
