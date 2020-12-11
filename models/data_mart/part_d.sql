SELECT 
    P.part_pk
    ,SP.part_name
    ,SP.part_mfgr
    ,SP.part_brand
    ,SP.part_type
FROM {{ref('hub_part')}} P
LEFT JOIN {{ref('sat_inv_part_details')}} SP
USING(part_pk)
