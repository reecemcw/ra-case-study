with source_data as (
    SELECT * from {{ source('src_bq', 'votes')}}    
)

SELECT 
    id,
    post_id,
    vote_type_id 
FROM source_data