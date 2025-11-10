#!/bin/bash
source /home/ec2-user/gym-kiosk/bin/config.sh

DATA_DIRECTORY="/home/ec2-user/gym-kiosk/data"

echo -e "\n\nUploading sales and customer data for location $LOCATION_NUMBER"
echo -e "\nS3_BUCKET_NAME=$S3_BUCKET_NAME"
echo -e "LOCATION_NUMBER=$LOCATION_NUMBER\n"

# upload sales data to s3 with a $location prefix
aws s3 cp $DATA_DIRECTORY/gym-customers.csv s3://$S3_BUCKET_NAME/$LOCATION_NUMBER/gym-customers.csv
customers_upload_status=$?
aws s3 cp $DATA_DIRECTORY/gym-sales.csv s3://$S3_BUCKET_NAME/$LOCATION_NUMBER/gym-sales.csv
sales_upload_status=$?

if [ $customers_upload_status -eq 0 ] && [ $sales_upload_status -eq 0 ]; then
    echo -e "\n\nUpload complete!\n"