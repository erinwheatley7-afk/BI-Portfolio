SELECT COUNT(*) AS total_missing_user_pseudo_ids
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE user_pseudo_id IS NULL AND _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
