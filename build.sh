#!/bin/sh
# build the project

# Determine the directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/sourcemod/addons/sourcemod/scripting/spcomp $DIR/$1 -o="$DIR/build/$1.smx"
