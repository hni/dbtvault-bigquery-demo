SELECT
  transaction_pk
  ,customer_fk customer_pk
  ,LLP.part_pk
  ,transaction_date calendar_pk
  ,SHA256(IFNULL(SND.customer_nation_name,'null')
    ||IFNULL(SRD.customer_region_name,'null')) customerlocation_pk
  ,amount
FROM {{ref('t_link_transactions')}} T --311798
LEFT JOIN {{ref('link_order_lineitem')}} LOL --1246904
ON (T.order_fk = LOL.order_pk)
LEFT JOIN {{ref('link_inventory_allocation')}} LLP --1246904
USING (lineitem_pk)
LEFT JOIN {{ref('sat_order_cust_nation_details')}} SND
ON (T.customer_fk = SND.customer_pk)
LEFT JOIN {{ref('sat_order_cust_region_details')}} SRD
ON (T.customer_fk = SRD.customer_pk)
