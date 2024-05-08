with source_data as (
    SELECT * from {{ source('src_bq', 'badges')}}    
)

SELECT 
    id,
    name,
    class
FROM source_data