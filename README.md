# Ins-WP bash scripts

Collection of bash scripts that help perform various actions when working with WordPress.

Usage of scripts assumes a regular Linux environment, with bash shell and common commands such as `find`, `sed`, `wget`, `git`, etc.

## Contents

+ [Usage](#usage)
+ [Scripts collection](#scripts-collection)
  - [WP Plugin Creator](#1-wp-plugin-creator)
+ [Changelog](#changelog)

## Usage

- Git clone the repo: `git clone https://github.com/inswp/bash_inswp.git`
- Navigate to the script that interests you
- chmod the script to make it executable `chmod +x script.sh` OR execute it with `sh`: `sh script.sh`
- Read the `README.md` on each script for more detailed information

## Scripts collection

### 1. [WP Plugin Creator](https://github.com/inswp/bash_inswp/tree/master/wp_plugin_creator)

Clones [WordPress Plugin Boilerplate](https://github.com/DevinVinson/WordPress-Plugin-Boilerplate) and replaces all strings to match values given in config file

## Changelog

20190622 - added `wp_simple_plugin` script
20190620 - Started repo, added `wp-plugin-creator` script
