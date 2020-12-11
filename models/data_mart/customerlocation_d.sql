SELECT
 SHA256(nation||region) customerlocation_pk
 ,nation
 ,region
FROM (
 SELECT DISTINCT
   IFNULL(SND.customer_nation_name,'null') nation
   ,IFNULL(SRD.customer_region_name,'null') region
 FROM {{ref('hub_customer')}} HC
 LEFT JOIN {{ref('sat_order_cust_nation_details')}} SND
 USING(customer_pk)
 LEFT JOIN {{ref('sat_order_cust_region_details')}} SRD
 USING(customer_pk)
)
