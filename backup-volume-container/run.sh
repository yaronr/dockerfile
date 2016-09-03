#!/bin/bash

if [ ! $# -eq 2 ]
  then
    echo "Invalid / incorrect / missing arguments supplied."
    echo "run <s3 url> <quiet period>"
    echo
    echo "example:"
    echo "run.sh s3://s3.amazonaws.com/my_bucker/my_directory 60"
    echo
    echo "This script will first try to restore backup from the given url, and then start backing up to that URL continuously, after every change + quiet period."
    exit 1
fi

if [[   ${AWS_ACCESS_KEY_ID} = "foobar_aws_key_id" || ${AWS_SECRET_ACCESS_KEY} = "foobar_aws_access_key" ]] ; then
	echo "AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables MUST be set"
    exit 1
fi

echo "Using $1 as S3 URL"
echo "Using $2 as required quiet (file system inactivity) period before executing backup"
echo
echo "Updating time data to prevent problems with S3 time mismatch"

inotifywait_events="modify,attrib,move,create,delete"

cd /var/backup

# start by restoring the last backup:
# This could fail if there's nothing to restore.

duplicity $DUPLICITY_OPTIONS --no-encryption $1 .

# Now, start waiting for file system events on this path.
# After an event, wait for a quiet period of N seconds before doing a backup

while inotifywait -r -e $inotifywait_events . ; do
  echo "Change detected."
  while inotifywait -r -t $2 -e $inotifywait_events . ; do
  	echo "waiting for quiet period.."
  done
  
  echo "starting backup"
  duplicity $DUPLICITY_OPTIONS --no-encryption --allow-source-mismatch --full-if-older-than 7D . $1
  echo "starting cleanup"
  duplicity remove-all-but-n-full 3 $DUPLICITY_OPTIONS --force --no-encryption --allow-source-mismatch $1  
  duplicity cleanup $DUPLICITY_OPTIONS --force --no-encryption $1
done
