-- Top 50 most requested URIs in the last 7 days
SELECT uri, COUNT(*) AS hits
FROM cloudfront_logs
WHERE date >= date_add('day', -7, current_date)
GROUP BY uri
ORDER BY hits DESC
LIMIT 50;

-- HTTP status code breakdown
SELECT status, COUNT(*) AS total
FROM cloudfront_logs
GROUP BY status
ORDER BY total DESC;

-- Error rate: 4xx and 5xx
SELECT 
  SUM(CASE WHEN status BETWEEN 400 AND 499 THEN 1 END) AS client_errors,
  SUM(CASE WHEN status BETWEEN 500 AND 599 THEN 1 END) AS server_errors
FROM cloudfront_logs;

-- Request trends by day
SELECT date, COUNT(*) AS request_count
FROM cloudfront_logs
GROUP BY date
ORDER BY date DESC;

-- Calculate latency percentiles
SELECT
  approx_percentile(time_taken, 0.50) AS p50,
  approx_percentile(time_taken, 0.90) AS p90,
  approx_percentile(time_taken, 0.99) AS p99,
  AVG(time_taken) AS avg_latency
FROM cloudfront_logs;
