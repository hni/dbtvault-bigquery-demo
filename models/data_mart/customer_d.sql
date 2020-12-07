SELECT 
C.customer_pk
,SD.customer_name
,SD.customer_phone
,-- example of biz logic
 CASE 
    WHEN SD.customer_accbal < -500 THEN 'critical'
    WHEN SD.customer_accbal < 0 THEN 'bad'
    WHEN SD.customer_accbal < 1000 THEN 'ok'
    WHEN SD.customer_accbal < 2000 THEN 'good'
    WHEN SD.customer_accbal >= 2000 THEN 'toogood'
    ELSE 'unexpected' 
END customer_accsegment
,SD.customer_mktsegment
FROM bq-data-vault.demo_VLT.hub_customer C
LEFT JOIN bq-data-vault.demo_VLT.sat_order_customer_details SD
USING(customer_pk)
