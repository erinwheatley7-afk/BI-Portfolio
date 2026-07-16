SELECT MIN(_TABLE_SUFFIX) AS min_date, MAX(_TABLE_SUFFIX) AS max_date
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
