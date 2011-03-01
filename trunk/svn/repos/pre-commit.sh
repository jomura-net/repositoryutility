#!/bin/sh

REPOS="$1"
TXN="$2"

# Make sure that the log message contains some text.
SVNLOOK=/usr/local/bin/svnlook
$SVNLOOK log -t "$TXN" "$REPOS" | grep . > /dev/null || { echo "Please enter a commit message which details what has changed during this commit." 1>&2; exit 1; }

# All checks passed, so allow the commit.
exit 0
