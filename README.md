# About #

Leash aspires to be a zero configuration development server for multi-component web applications, similar to Pow or Hoof.

# Installation #

Clone this repository, add leash/bin to your path or symlink it into a directory on your path, and then run

    $ leash setup

Any build failures will be logged into leash/build.log.

# Usage #

To start Leash, run

    $ leash start

If you wish to stop running Leash,

    $ leash stop

should suffice.

# Environment Variables #

## LEASH_CONFIG_PATH ##

When set, leash will use this directory for its configuration rather then the default.
