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
