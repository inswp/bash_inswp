#!/bin/bash

#set -x
#trap read debug

# Variables
PRGNAM="wp_plugin_creator"
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

# clone WordPress Plugin Boilerplate (https://github.com/DevinVinson/WordPress-Plugin-Boilerplate)

git clone https://github.com/DevinVinson/WordPress-Plugin-Boilerplate
mv WordPress-Plugin-Boilerplate/plugin-name "${CWD}"
rm -rf WordPress-Plugin-Boilerplate
mv plugin-name "${plugin_short_name}"

cd "${plugin_short_name}" || exit 1

# rename all files to our plugin name
for file in $(find . -name "*plugin-name*" -type f);do
  mv $file "${file/plugin-name/$plugin_short_name}";
done

# rename strings
find . -type f -exec sed -i "s/plugin_name/${func_prefix}/g" {} +
find . -type f -exec sed -i "s/plugin-name/${plugin_short_name}/g" {} +
find . -type f -exec sed -i "s/Plugin_Name/${class_prefix}/g" {} +
find . -type f -exec sed -i "s/PLUGIN_NAME_/${constants_prefix}/g" {} +

# rename plugin authoring strings
find . -type f -exec sed -i "s|WordPress Plugin Boilerplate|${plugin_long_name}|g" {} +
find . -type f -exec sed -i "s|1.0.0|${plugin_version}|g" {} +
find . -type f -exec sed -i "s|Your Name or Your Company|${plugin_author}|g" {} +
find . -type f -exec sed -i "s|http:\/\/example.com|${plugin_author_uri}|g" {} +
find . -type f -exec sed -i "s|http:\/\/example.com\/wp-plugin-creator-uri\/|${plugin_uri}|g" {} +
find . -type f -exec sed -i "s|Your Name \<email\@example.com\>|${plugin_author}|g" {} +
find . -type f -exec sed -i "s|This is a short description of what the plugin does. It's displayed in the WordPress admin area.|${plugin_short_desc}|g" {} +
