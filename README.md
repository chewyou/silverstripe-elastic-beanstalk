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
   Apply. This will restart the environment and create the RDS  (database)  


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
   Run a `composer install` in the root directory to build the `vendor` directory.  
   Zip and deploy. Will see 403 Forbidden on site after deployment.  
   To zip the project files, select the files while inside the root directory and zip.  
   Do not zip the root directory itself.  
   Name to something like `0.0.1.zip`. Could do `1.0.0.zip`?  
   If you have docker installed, you can run the following to spin up composer to run the install command.  
   `docker run --rm --interactive --tty --volume $PWD:/app composer install`


9. Configure Software:  
   Document root: /public  
   (restarts environment)


10. Almost done.  
    You can add all the environment variables to the Environment Configuration Software space and remove the .env file from your deployment package.  
 ```text
SS_DATABASE_CLASS="MySQLDatabase"
SS_DATABASE_NAME="SS_WebApp"
SS_DATABASE_SERVER=""
SS_DATABASE_USERNAME=""
SS_DATABASE_PASSWORD=""
SS_DEFAULT_ADMIN_USERNAME=""
SS_DEFAULT_ADMIN_PASSWORD=""

# "live" or "dev"
SS_ENVIRONMENT_TYPE="dev"

AWS_REGION=""
AWS_BUCKET_NAME=""
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
```
   

11. Remove the initial Environment create when creating the Application. 
   Environments -> Select checkbox next to environment  
   Under Actions, Terminate Environment  


## Local Development  
`composer install`, `dev/build` and run however you run php applications :)   


## AWS JavaScript SDK Documentation  
https://docs.aws.amazon.com/AWSJavaScriptSDK/v3/latest/clients/client-elastic-beanstalk/index.html  
