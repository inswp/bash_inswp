# WP Plugin Creator

Clones [WordPress Plugin Boilerplate](https://github.com/DevinVinson/WordPress-Plugin-Boilerplate) and replaces all strings to match values given in config file

## Usage

+ Edit `config.config` file with your variable values

> ***Example***
> ---
> If your plugin is named "My awesome plugin", then
> variable `plugin_long_name="WP Plugin Creator"` becomes:
> `plugin_long_name="My awesome plugin"`

+ Run scipt with `sh wp_plugin_creator.sh` OR make it executable `chmod +x wp_plugin_creator.sh` and run it with `./wp_plugin_creator.sh`
