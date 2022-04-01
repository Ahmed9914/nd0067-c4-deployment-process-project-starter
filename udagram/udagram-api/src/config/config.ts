import * as dotenv from "dotenv";
dotenv.config();

export const config = {
  username: `${process.env.POSTGRES_USERNAME}`,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
  port: Number(process.env.DB_PORT),
  host: process.env.POSTGRES_HOST,
  dialect: "postgres",
  aws_region: process.env.AWS_REGION,
  aws_access_key: process.env.AWS_ACCESS_KEY_ID,
  aws_secret: process.env.AWS_SECRET_ACCESS_KEY,
  aws_token: process.env.AWS_SESSION_TOKEN,
  aws_media_bucket: process.env.AWS_BUCKET,
  url: process.env.URL,
  jwt: {
    secret: process.env.JWT_SECRET,
  },
};
