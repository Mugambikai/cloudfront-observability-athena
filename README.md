# CloudFront Observability & Athena Log Analysis

**Summary**
This project demonstrates how to collect, analyze and visualize CloudFront access logs using CloudWatch, S3 and Athena. It includes Terraform for infra, Athena queries, optional Lambda transforms, dashboards, and instructions to reproduce.

## Architecture
- CloudFront distribution with access logging to an S3 bucket.
- S3 bucket lifecycle rules and partitioned storage (by year/month/day).
- Athena (or Glue) external table to query CloudFront logs.
- Optional Lambda to transform logs or push custom CloudWatch metrics.
- CloudWatch dashboards for KPIs (requests, errors, latency, top URIs).

## Repo layout
cloudfront-observability-athena/
├── README.md
├── infra/
│ └── main.tf
├── athena/
│ ├── create_table.sql
│ └── sample_queries.sql
├── lambda/
│ └── log_transform.py
├── docs/
│ └── architecture.png
└── screenshots/

## Deploy Steps (High-Level)
1. Deploy S3 bucket for logs using Terraform.
2. Enable CloudFront logging to S3.
3. Use Athena to query and analyze logs.
4. Create CloudWatch dashboards for monitoring.

## Notes
- Use partitions in Athena for performance.
- Enable lifecycle rules in S3 to manage log storage.
- CloudFront logging prefix must match S3 table location.

## License
MIT
