SELECT
  region
  ,nation
  ,sub_continent_code 
  ,amount/1000000 amount_m
FROM {{ref('transaction_f')}}
LEFT JOIN {{ref('customerlocation_d')}}
USING(customerlocation_pk)
LEFT JOIN {{ref('sub_continent_mapping')}}
ON nation = country_name
