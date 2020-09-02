#!/bin/sh

sudo service apache2 stop && echo 'Server deactivated'

# used for debugging
# ref: https://www.baeldung.com/linux/cron-job-testing-debugging
#printenv 
#set -x
# insert command here 
#
#set +x
