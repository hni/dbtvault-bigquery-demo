SELECT
 SHA256(nation||region) customerlocation_pk
 ,nation
 ,region
FROM (
 SELECT DISTINCT
   IFNULL(SND.customer_nation_name,'null') nation
   ,IFNULL(SRD.customer_region_name,'null') region
 FROM bq-data-vault.demo_VLT.hub_customer HC
 LEFT JOIN bq-data-vault.demo_VLT.sat_order_cust_nation_details SND
 USING(customer_pk)
 LEFT JOIN bq-data-vault.demo_VLT.sat_order_cust_region_details SRD
 USING(customer_pk)
)
