-- Task 2: Redshift to Snowflake via S3 (Parquet)

-- Redshift UNLOAD script
unload ('select * from test.listing')
to 's3://bucket-takeosarita/Redshift/output/snow_listing_output/'
iam_role 'arn:aws:iam::<account-id>:role/<role-name>'
PARQUET;

-- Snowflake table
create table bootcamp.snow.listing(
  listid integer,
  sellerid integer,
  eventid integer,
  dateid smallint,
  numtickets smallint,
  priceperticket decimal(8,2),
  totalprice decimal(8,2),
  listtime timestamp
);

-- Load parquet into Snowflake
copy into bootcamp.snow.listing
from (
  select
    $1:listid,
    $1:sellerid,
    $1:eventid,
    $1:dateid,
    $1:numtickets,
    $1:priceperticket,
    $1:totalprice,
    $1:listtime
  from @bootcamp.snow.s3_stage_snow/output/snow_listing_output/
)
FILE_FORMAT = (TYPE = 'PARQUET')
PATTERN = '.*.parquet';

select * from bootcamp.snow.listing;
