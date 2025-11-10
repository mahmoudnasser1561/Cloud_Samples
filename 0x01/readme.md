# Upload and Backup 
The gym kiosk server sends customer and sales data files to the AWS Cloud containing an Amazon Simple Storage Service (Amazon S3) bucket. 
The account includes a role with permissions to create and update Amazon S3.

The Gym company needs to automate backups and sales reporting in their kiosk system, 
which is Linux-based. The system stores customer data to a file called gym-customers.csv. 

The company wants the sales and customer data uploaded to the cloud. The company also wants the data backed up locally to a local backup directory. 
It wants the backups zipped to save space.

# Structure 
| File Name   | Description |
|--------------|-------------|
| **config.sh** | Holds location-specific settings like the **location ID** and **S3 bucket name**. Sourced by other scripts. |
| **backup.sh** | Backs up `gym-customers.csv` and `gym-sales.csv` to a backup folder, then zips them into `data_backup.zip`. |
| **upload.sh** | Uploads both CSV files to the **S3 bucket** under the location path, e.g. `.../1001/gym-customers.csv`. |

# Arch diagram
<img width="4000" height="2196" alt="lab-architecture-diagram" src="https://github.com/user-attachments/assets/52369982-52a0-4251-8528-c9519c924512" />

