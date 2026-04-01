# Snowflake Data Pipeline 

This project demonstrates an end-to-end data pipeline using Redshift, S3, and Snowflake.

## Overview

The pipeline consists of two main tasks:

### Task 1: CSV Data Load
- Load employee data from S3 into Snowflake
- Verify data
- Unload data back to S3

### Task 2: Parquet Data Pipeline
- Unload listing data from Redshift to S3 in Parquet format
- Load Parquet data into Snowflake
- Map data into structured columns (not JSON)

## Technologies Used

- Snowflake
- Amazon S3
- Amazon Redshift
- SQL

## Key Concepts

- Data loading using `COPY INTO`
- Data unloading from Snowflake to S3
- Redshift `UNLOAD` command
- Working with Parquet format
- Column mapping using `$1:column_name`

## Notes

- IAM roles and account details are omitted for security
- S3 paths are representative
- This project focuses on understanding data movement across systems

