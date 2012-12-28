#!/bin/bash
# @file

setSourceDirectory()
{
  scriptPath=$(which $0)

  if [ -L $scriptPath ]; then

    DIR=$(dirname $(readlink -f $scriptPath))
  else
    DIR=$(dirname $scriptPath)
  fi
}

setSourceDirectory

INCLUDES="$DIR/../casper-includes"

if [ $1 = "selftest" ]
then
  casperjs test --testSlow='yes' --ignore-ssl-errors='yes' --casperIncludes="$INCLUDES" --includes="$INCLUDES/Eval.js" "$INCLUDES/tests/Eval.test.js"
else 
  echo $1
  casperjs --url="$1" --id='node-form' --ignore-ssl-errors='yes' --casperIncludes="$DIR/../casper-includes" "$DIR/../src/form.js"
fi

