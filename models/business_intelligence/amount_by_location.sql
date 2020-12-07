SELECT
  region
  ,nation
  ,SUM(amount)/1000000 total_amount_m
FROM `bq-data-vault.demo_DM.transaction_f`
LEFT JOIN `bq-data-vault.demo_DM.customerlocation_d`
USING(customerlocation_pk)
GROUP BY 1,2
ORDER BY 1,2
