import boto3

cloudwatch = boto3.client('cloudwatch')

def lambda_handler(event, context):
    """
    Example Lambda that pushes a custom CloudWatch metric.
    In a real project, this Lambda would parse CloudFront logs from S3,
    then publish metrics like error count, latency, etc.
    """
    try:
        cloudwatch.put_metric_data(
            Namespace='CloudFront/CustomMetrics',
            MetricData=[
                {
                    'MetricName': 'ExampleMetric',
                    'Value': 1,
                    'Unit': 'Count'
                }
            ]
        )
        
        return {
            'statusCode': 200,
            'body': 'Metric pushed successfully!'
        }
        
    except Exception as e:
        print(f"Error: {e}")
        return {
            'statusCode': 500,
            'body': 'Failed to push metric'
        }
