<?php namespace CBBLe\Broker;

use Backend;
use System\Classes\PluginBase;

/**
 * broker Plugin Information File
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
            'name'        => 'Brokers',
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
            'CBBLe\Broker\Components\Broker' => 'Broker',
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
            'cbble.broker.some_permission' => [
                'tab' => 'broker',
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
            'broker' => [
                'label'       => 'Brokers',
                'url'         => Backend::url('cbble/broker/brokers'),
                'icon'        => 'icon-leaf',
                'permissions' => ['cbble.broker.*'],
                'order'       => 500,
            ],
        ];
    }
}
