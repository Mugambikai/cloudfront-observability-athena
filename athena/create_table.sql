CREATE EXTERNAL TABLE IF NOT EXISTS cloudfront_logs (
  `date` date,
  `time` string,
  location string,
  bytes int,
  request_ip string,
  method string,
  host string,
  uri string,
  status int,
  referrer string,
  user_agent string,
  uri_query string,
  cookie string,
  result_type string,
  request_id string,
  host_header string,
  protocol string,
  cs_bytes int,
  time_taken double,
  forwarded_for string,
  ssl_protocol string,
  ssl_cipher string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
  "input.regex" = "^(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+\\\"([^\\\"]*)\\\"\\s+\\\"([^\\\"]*)\\\"\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)$"
)
LOCATION 's3://your-cloudfront-logs-bucket/'
TBLPROPERTIES ('has_encrypted_data'='false');
