#!/bin/bash
# Synopsis:
# ecto selftest
# ecto [<action>] <location> [id]
# If the action is not given a default action will be selected.

# Our scripts depend on knowing where things are.
setSourceDirectory()
{
  scriptPath=$(which $0)

  if [ -L $scriptPath ]; then

    DIR=$(dirname $(readlink -f $scriptPath))
  else
    DIR=$(dirname $scriptPath)
  fi
}

# Help.
synopsis()
{
  echo ''
  echo  Synopsis:
  echo '---------'
  echo 'ecto --help                          Show this synopsis.'
  echo 'ecto selftest                        Run self tests using casperjs.'
  echo 'ecto [<action>] <location> [id]      The basic signature for the ecto command.'
  echo ''
  echo  Details:
  echo '---------'
  echo '<action>                             The type of test to generate (i.e. form, view).'
  echo '<location>                           The location of the file for URL to generate tests for.'
  echo '<action>                             The type of tests to generate (i.e. form, view).'
  echo ''
  echo 'If the action is not given a default action will be selected.'
}

setSourceDirectory

# At least one argument must be passed to to ecto.
if [ $# -lt 1 ]
then
  echo "You must provided at least one argument to run ecto."
  synopsis
  exit 0;
fi

# View the help.
if [ $1 = '--help' -o $1 = '-h' -o $1 = '-help' ]
then
  synopsis
  exit 0;
fi

INCLUDES="$DIR/../casper-includes"

# Set up for generating View tests.
if [ $1 = 'view' ]
then
  action='view'
  location=$2

  if [ $# -eq 3 ]
  then
    id=$3
  else
    id='div.view'
  fi

# Set up for generating Form tests.
elif [ $1 = 'form' ]
then
  action='form'
  location=$2
  if [ $# -eq 3 ]
  then
    id=$3
  else
    id='node-form'
  fi

# Default test generator.
else
  action='form'
  id='node-form'
  location=$1
fi


# Run tests or genrate some tests.
if [ $1 = "selftest" ]
then
  casperjs test --testSlow='yes' --ignore-ssl-errors='yes' --casperIncludes="$INCLUDES" --includes="$INCLUDES/Eval.js" "$INCLUDES/tests/Eval.test.js"
else
  casperjs --url="$location" --id="$id" --ignore-ssl-errors='yes' --casperIncludes="$DIR/../casper-includes" "$DIR/../src/$action.js"
fi

