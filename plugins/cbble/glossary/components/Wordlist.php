<?php namespace CBBLe\Glossary\Components;

use Cms\Classes\ComponentBase;
use CBBLe\Glossary\Models\Term;

class Wordlist extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Wordlist Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties()
    {
        return [];
    }

    public function onRun()
    {
        $wordlist = [];
        $index = Term::orderBy('index', 'ASC')->get();
        foreach ($index as $word) {
            $wordlist[$word['index']][] = $word;
        }
        $this->page['wordlist'] = $wordlist;
    }
}
