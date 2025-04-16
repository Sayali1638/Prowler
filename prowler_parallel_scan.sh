#!/bin/bash

# Change these variables as needed
# profile="your_profile"
# account_id=$(aws sts get-caller-identity --profile "${profile}" --query 'Account' --output text)

# echo "Executing in account: ${account_id}"

# Remove previous output files since Prowler appends, which is stupid.

# Arguments
region=us-east-1

rm -rf /root/prowler_output/*.json

# Maximum number of concurrent processes
MAX_PROCESSES=4

# Loop through the services
while read service; do
    echo "$(date '+%Y-%m-%d %H:%M:%S'): Starting job for service: ${service}"
    # Run the command in the background
    (sudo docker run --rm \
    -v /root/prowler_output/:/home/prowler/output \
    --name "prowler-${service}" toniblyx/prowler:latest aws \
    -f ${region} \
    -M json-asff \
    --verbose \
    --severities medium high critical \
    --status FAIL \
    --service "$service" \
    --output-filename "$service") &
    # (prowler -p "$profile" -s "$service" -F "${account_id}-${service}"  --only-logs; echo "$(date '+%Y-%m-%d %H:%M:%S') - ${service} has completed") &

    # Check if we have reached the maximum number of processes
    while [ $(jobs -r | wc -l) -ge ${MAX_PROCESSES} ]; do
        # Wait for a second before checking again
        sleep 1
    done
done < /root/prowler/services

# Wait for all background processes to finish
wait
echo "All jobs completed"

# Copy json putput files to s3 bucket

aws s3 cp /root/prowler_output/ s3://prowler-reports-latest-test/ --recursive --include "*.json"

