SELECT
  _TABLE_SUFFIX as event_date, count(*) AS page_view_count, params.value.string_value
FROM
  `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(event_params) AS params
WHERE
  event_name = 'page_view'
  AND params.key = 'page_title'
  --AND params.value.string_value = 'Google Online Store'
  -- Best practice: Always filter by _TABLE_SUFFIX to save cost
  AND _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
GROUP BY params.value.string_value, event_date
ORDER BY page_view_count desc
