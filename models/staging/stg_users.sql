with source_data as (
    SELECT * from {{ source('src_bq', 'users')}}    
)

SELECT 
    id,
    reputation,
    up_votes,
    down_votes
FROM source_data