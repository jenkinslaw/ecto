#!/bin/bash
# @file

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

casperjs --url="$1" --id='node-form' --ignore-ssl-errors='yes' --casperIncludes="$DIR/../casper-includes" "$DIR/../src/form.js"
