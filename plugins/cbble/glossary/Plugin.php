<?php namespace CBBLe\Glossary;

use Backend;
use System\Classes\PluginBase;

/**
 * Glossary Plugin Information File
 */
class Plugin extends PluginBase
{
    /**
     * Returns information about this plugin.
     *
     * @return array
     */
    public function pluginDetails()
    {
        return [
            'name'        => 'Glossary',
            'description' => 'No description provided yet...',
            'author'      => 'CBBLe',
            'icon'        => 'icon-leaf'
        ];
    }

    /**
     * Register method, called when the plugin is first registered.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Boot method, called right before the request route.
     *
     * @return array
     */
    public function boot()
    {

    }

    /**
     * Registers any front-end components implemented in this plugin.
     *
     * @return array
     */
    public function registerComponents()
    {
        return [
            'CBBLe\Glossary\Components\Index' => 'Index',
            'CBBLe\Glossary\Components\Wordlist' => 'Wordlist',
        ];
    }

    /**
     * Registers any back-end permissions used by this plugin.
     *
     * @return array
     */
    public function registerPermissions()
    {
        return []; // Remove this line to activate

        return [
            'cbble.glossary.some_permission' => [
                'tab' => 'Glossary',
                'label' => 'Some permission'
            ],
        ];
    }

    /**
     * Registers back-end navigation items for this plugin.
     *
     * @return array
     */
    public function registerNavigation()
    {
        return [
            'glossary' => [
                'label'       => 'Glossary',
                'url'         => Backend::url('cbble/glossary/terms'),
                'icon'        => 'icon-list-alt',
                'permissions' => ['cbble.glossary.*'],
                'order'       => 500,
            ],
        ];
    }
}
