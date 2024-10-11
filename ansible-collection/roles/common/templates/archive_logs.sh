#!/bin/bash

set -e
set -u

export BUCKET_NAME="{{ ggn_application_logs_bucket }}"
export BUCKET_PATH="$(hostname)"
LOG_PATH="{{ ggn_application_logs_path }}"
DATE=$(date --rfc-3339=date)

cd $LOG_PATH
for log in `ls catalina.*.log host-manager*.log localhost*.log localhost_access*.txt manager*.log | grep -v $DATE`
do
  gzip $log
done

find $LOG_PATH -type f -name '*.gz' -exec sh -c 'aws s3 mv {} "s3://${BUCKET_NAME}/${BUCKET_PATH}/$(basename {})"' \;
