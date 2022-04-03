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
Architecture diagram is available at `diagrams.pdf` file showing the communications between components.