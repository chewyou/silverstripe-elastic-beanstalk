## Base Elastic Beanstalk Silverstripe Instance 
https://docs.aws.amazon.com/AWSJavaScriptSDK/v3/latest/clients/client-elastic-beanstalk/index.html  

## Deploying to Elastic Beanstalk ##
1. Create a Application. Give it the name of the Company. Set the tags.  
   Add Tag: Key = CLIENT, Value = CLIENT NAME  
   Set the Platform to PHP. And leave the Application code set to Sample application.  
   Click Create. Wait for the environment to finish building, then under Actions, terminate the environment.  
   Wait for the environment to terminate.  
2. Create a new Environment with Sample Application.  
   Click on Applications -> The Application -> Create a new environment  
   Name: TEST or PROD  
   PHP Version: 8  
   Create and wait for environment to build.  
3. Configure to include Database (restarts environment)  
   mysql  
   5GB (or what is needed)  
   username  
   password  
4. Configure .env file with database details once environment has restarted  
   SS_DATABASE_SERVER (Endpoint including the port number)  
   SS_DATABASE_USERNAME  
   SS_DATABASE_PASSWORD  
5. Configure Software:  
   Proxy Server: Apache  
   (restarts environment)  
5. Zip and deploy 0.0.1. Will see 403 Forbidden on site after deployment.  
7. Configure Software:  
   Document root: /public  
   (restarts environment)  
   
   
## To test  
1. After a successful deployment, some changes to the pages and files (uploads)  
   Does another deployment remove the files that were uploaded? 
   The reference to them might still be in the database, but the file itself might be removed