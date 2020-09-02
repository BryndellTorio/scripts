#!/bin/sh

sudo service apache2 start && echo 'Server activated'

# used for debugging
# ref: https://www.baeldung.com/linux/cron-job-testing-debugging
#printenv 
#set -x
# insert command here 
#
#set +x
