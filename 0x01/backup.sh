#!/bin/bash

source /home/ec2-user/gym-kiosk/bin/config.sh

echo -e "\n\nS3 Bucket = $S3_BUCKET_NAME"
DATA_DIRECTORY="/home/ec2-user/gym-kiosk/data"
BACKUP_DIRECTORY="/home/ec2-user/gym-kiosk/backup"
BACKUP_FILE_NAME="data-backup-$(date +%Y-%m-%d-%H-%M).zip"

echo "BACKUP_DIRECTORY = $BACKUP_DIRECTORY"
echo -e "BACKUP_FILE_NAME = $BACKUP_FILE_NAME \n\n"
echo -e "Copying customer_data.csv and sales_data.csv to the backup directory...\n"

success=true

cp $DATA_DIRECTORY/gym-customers.csv $DATA_DIRECTORY/gym-sales.csv $BACKUP_DIRECTORY
if [ $? -ne 0 ]; then
  echo -e "\nError: Failed to copy files to backup directory. Check permissions.\n\n"
  success=false
fi

cd $BACKUP_DIRECTORY
echo -e "Attempting to zip up the csv files...\n"
zip -r $BACKUP_FILE_NAME gym-customers.csv gym-sales.csv
if [ $? -ne 0 ]; then
  echo -e "Error: Failed to create backup zip file. Check that the files are present in the backup directory.\n"
  success=false
fi

echo -e "\nRemoving the csv files...\n"
rm gym-customers.csv gym-sales.csv
if [ $? -ne 0 ]; then
  echo -e "\nWarning: Failed to remove source files from backup directory."
  success=false
fi

if $success; then
  echo -e "\nBackup successful.\n\nThe backup file is located at $BACKUP_DIRECTORY/$BACKUP_FILE_NAME\n"
else
  echo -e "\nBackup failed. Please check the error messages and try again.\n"