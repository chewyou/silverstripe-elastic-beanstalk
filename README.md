## Base Elastic Beanstalk Silverstripe Instance 

## Deploying to Elastic Beanstalk
1. Create an Application. Give it the name of the Company/Project. Set the tags.  
   Add Tag: Key = CLIENT, Value = CLIENT NAME for example  
   Set the Platform to PHP. And leave the Application code set to Sample application.  
   Click Create. Wait for the environment to finish building.  


2. Create a new Environment with Sample Application.  
   Click on Applications -> The Application -> Create a new environment -> Web server environment -> Select    
   Name: TEST or PROD // Or something similar    
   PHP Version: 8  
   Sample application  
   Create and wait for environment to build.  


3. Configure to include Database (restarts environment)  
   Configuration -> Edit Database
   mysql  
   5GB (or what is needed)  
   username  
   password  
   Save. This will restart the environment and create the RDS  (database)  


4. Create a S3 bucket with full public access. Take note of the bucket name.  
   Update the .env file with the details of the bucket.  
   AWS_REGION  
   AWS_BUCKET_NAME  


5. Create a new IAM API Access User with full S3 Bucket access and update the .env file   
   AWS_ACCESS_KEY_ID  
   AWS_SECRET_ACCESS_KEY  


6. Configure .env file with database details once environment has restarted  
   SS_DATABASE_SERVER (Endpoint including the port number)  
   SS_DATABASE_USERNAME  
   SS_DATABASE_PASSWORD  


7. Configure Software:  
   Proxy Server: Apache  
   (restarts environment)  


8. Composer and Zip.  
   Run a `composer install` in the root `directory` to build the vendor directory.  
   Zip and deploy 0.0.1. Will see 403 Forbidden on site after deployment.  
   To zip the project files, select the files while inside the root directory and zip.  
   Do not zip the main directory.  


9. Configure Software:  
   Document root: /public  
   (restarts environment)


10. Done. Almost.  
   Visit the site using the given URL for the environment.  
   Note: You can also add all the environment variable to the Environment Configuration Software space and remove the .env file.  
   

11. Remove the initial Environment create when creating the Application. 
   Environments -> Select checkbox next to environment  
   Under Actions, Terminate Environment  

   
## To test  
1. After a successful deployment, some changes to the pages and files (uploads)  
   Does another deployment remove the files that were uploaded? 
   The reference to them might still be in the database, but the file itself might be removed  
   **Result:** Yes. The files are removes, but the reference to them still exist.  
   **Solution:** The deployment script will need to **copy** the _/assets_ directory to a temporary directory before the package/code is deployed, it will be moved back after deployment is completed.  
 

3. Software Environment Values. Can the values from the .env file be moved to these fields?  
   **Result:** Yes.  
   **Solution:** Update ReadMe to include this information so that the .env file does not get uploaded to any git repository 


## AWS JavaScript SDK Documentation  
https://docs.aws.amazon.com/AWSJavaScriptSDK/v3/latest/clients/client-elastic-beanstalk/index.html  