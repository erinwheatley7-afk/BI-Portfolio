SELECT count(*) as total_events, _TABLE_SUFFIX as event_date, event_name

FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY event_date, event_name
ORDER BY event_date asc
