SELECT 
    P.part_pk
    ,SP.part_name
    ,SP.part_mfgr
    ,SP.part_brand
    ,SP.part_type
FROM bq-data-vault.demo_VLT.hub_part P
LEFT JOIN bq-data-vault.demo_VLT.sat_inv_part_details SP
USING(part_pk)
