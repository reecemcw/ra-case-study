with source_data as (
    SELECT * from {{ source('src_bq', 'comments')}}    
)

SELECT 
    id,
    score,
    post_id,
    user_id
FROM source_data