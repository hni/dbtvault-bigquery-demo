SELECT
  region
  ,nation
  ,SUM(amount)/1000000 total_amount_m
FROM {{ref('transaction_f')}}
LEFT JOIN {{ref('customerlocation_d')}}
USING(customerlocation_pk)
GROUP BY 1,2
ORDER BY 1,2
