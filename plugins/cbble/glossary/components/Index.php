<?php namespace CBBLe\Glossary\Components;

use Cms\Classes\ComponentBase;

class Index extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'index Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [];
    }
    public function onRun()
    {
        $this->page['indexes'] = \CBBLe\Glossary\Models\Term::select('index')->groupBy('index')->orderBy('index', 'ASC')->get();
    }
}
