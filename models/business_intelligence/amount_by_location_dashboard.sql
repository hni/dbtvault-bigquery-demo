SELECT
  region
  ,nation
  ,sub_continent_code 
  ,amount/1000000 amount_m
FROM `bq-data-vault.demo_DM.transaction_f`
LEFT JOIN `bq-data-vault.demo_DM.customerlocation_d`
USING(customerlocation_pk)
LEFT JOIN `bq-data-vault.demo_BVLT.sub_continent_mapping`
ON nation = country_name
