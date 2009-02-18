svnlook log -t "%2" "%1" | findstr . || echo "Please input a log message." >&2 && exit 1

exit 0
