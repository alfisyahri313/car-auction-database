## Designing a Relational Database for a Car Auction Platform
If you are planning to build a car auction platform, one of the most critical components you will need is a database. A good database design is essential to ensure the reliability, scalability, and maintainability of your application.

In this article, we will guide you through the process of designing a relational database for a car auction platform. We will cover the following topics:

* Understanding the requirements
* Creating a data model

## Entity Relationship Diagram (ERD)
![Alt text](/ERD.png "ERD")

## Inserting Dummy Data
Here we have made python script to insert dummy data in Excel into PostgreSQL. You can modify the script by changing the database details such as database name, username, password, host and port. 

## Restore Database Backup
Here we have made a backup data for you to restore in Db_final_project_backup.sql. You can use this backup data to clone the database we have made.
* Open pgAdmin 4
* Go to Servers --> PostgreSQL 15 --> Database
* Right-click Database then Create --> Database
* Fill the Database name then Save
* Right-click on the target database and select "Restore..." from the context menu.
* In the "Restore" dialog, navigate to the backup file you want to restore by clicking on the "..." button next to the "Filename" field.
* In the "Options" tab, select the appropriate restore options, such as whether to drop the existing database before restoring or not.
* Click on the "Restore" button to start the restore process.
* Wait for the restore process to complete, which may take some time depending on the size of the backup file.


### More in medium
https://medium.com/@alfisyahri313/designing-a-relational-database-for-a-car-auction-platform-6fc608f721ab 