# Infrastructure description:

## Database
The used database is PostgreSQL DB, it is hosted in AWS RDS at database-1.cote4hqwlcgt.us-east-1.rds.amazonaws.com and access to database is allowed only to the API using the supplied credentials at `.env` file.

## Backend
The backend is an API written using ExpressJS framework and hosted on AWS Elastic Beanstalk. The URL of the Api is http://udagram-env.eba-mw5uxmb3.us-east-1.elasticbeanstalk.com/api/v0. The AWS credentials are set as environment variables within EB.

## Frontend
The frontend UI is written using Angular framework and hosted at S3 bucket for static hosting. The frontend can be accessed at accessed from a web browser at http://udagram-frontend123.s3-website-us-east-1.amazonaws.com which is the main entry point for the app. ACL policy and CORS configurations allow the necessary access.

## App Images
The images are stored in an S3 bucket called udagram-backend-pics123.

## Componenets communication:
Architecture diagram is available at `diagrams.pdf` file showing the communications between components

# App dependencies and Pipeline process:

CircleCI has been setup to execute the pipeline with every push to the configured GitHub repository. The pipeline contains jobs for the following tasks:

* Prepare environment default docker instance and installing Node.j on it.

API
* Prepare initial setup for the AWS CLI and Elastic Beanstalk CLI are installed. The necessary environment variables configured in the project are set within the docker instance.

* Install dependencies for backend components.

* Install dependencies for Angular CLI components.

* Install dependencies for frontend components.

* After the dependencies are installed the backend build process starts. As the .env is not included in the source control files it is created from a script using the environment variables contained in CircleCI. The AWS config file creation is also scripted.

* Start frontent build process.

* After the backend build, the deploy uses the EB CLI to upload app files to the AWS cloud.

* After the frontend  build, the AWS CLI is used to first remove all the existing frontend files from the S3 bucket and then uploads the ones from the new build.

* The package.json in the Udagram directory contains the scripts used in CircleCI. These scripts call the scripts in both frontend and backend package.json files.
