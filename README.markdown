ecto
============
Automate component test with casperjs. The idea here is
to point the app to a URL or file and have it spit out some
standard casperjs tests for it.

Install:
--------
1. Pull the code in locally.
1. `cd ecto`
1. `sudo rake install` (Adds  symlink to the ecto command in the /usr/bin folder.)

Synopsis:
---------
* `ecto --help` -- Show this synopsis.
* `ecto selftest` -- Run self tests using casperjs.
* `ecto [<action>] <location> [id]` -- The basic signature for the ecto command.

Details:
---------
* `<action>` -- The type of test to generate (i.e. form, view).
* `<location>` -- The location of the file for URL to generate tests for.

If the action is not given a default action will be selected.


