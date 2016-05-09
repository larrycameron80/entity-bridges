#!/bin/sh -x

scripts="${scripts:-scriptsdir}"

cd $scripts;

/bin/sh index_build.sh;

/bin/sh credits_build.sh;

/bin/sh about_build.sh;

/bin/sh help_build.sh;

/bin/sh torrc_build.sh;

/bin/sh logs_build.sh;

true
