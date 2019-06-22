#!/bin/bash

#set -x
#trap read debug

# Variables
PRGNAM="wp_simple_plugin"
PRGVERS="1.0.0"
CWD=$(pwd -P)
TMP="${PRGNAM}_${PRGVERS}-${UID}-$(date +%y_%m_%d-%H_%M)-$$)"
TMPDIR=$CWD/.$TMP

mycnf="${CWD}"/config.config

# Source config file or complain for lack of config

if [ ! -f "${mycnf}" ]; then
  echo "No config file found"
else
  source "${mycnf}"
fi

# Create plugin dir
mkdir "${plugin_short_name}"
cd "${plugin_short_name}" || exit 1

# Create README.txt

cat>README.txt<<EOF
=== ${plugin_long_name} ===

Requires at least: ${version_min}
Tested up to: ${version_max}
Stable tag: ${plugin_version}

${plugin_short_desc}

== Description ==

EDIT HERE WITH LONG DESCRIPTION

== Installation ==
 
1. Upload \`${plugin_short_name}.php\` to the \`/wp-content/plugins/\` directory
2. Activate the plugin through the 'Plugins' menu in WordPress

== Frequently Asked Questions ==

EDIT HERE WITH F.A.Q.

== Changelog ==

= 1.0.0 =
EDIT HERE WITH CHANGES ON THE MOST RECENT VERSION
EOF

# Create `mypluginname.php`
cat>"${plugin_short_name}".php<<EOF
<?php
/* *
 * Plugin Name: ${plugin_long_name}
 * Plugin URI: ${plugin_uri}
 * Description: ${plugin_short_desc}
 * Author: ${plugin_author}
 * License: ${plugin_license}
 * License URI: http://www.gnu.org/licenses
 * Text Domain: ${plugin_domain}
 * Version: ${plugin_version}
 * Author URI: ${plugin_author_uri}
 * */

/* If this file is called directly, abort. */
if ( !defined( "WPINC" ) ) {
  die;
}

/* Plugin functions */
EOF

# Generate empty index.php to prevent dir listing
cat>index.php<<EOF
<?php

/* Silence is gold */
EOF
