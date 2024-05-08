with source_data as (
    SELECT * from {{ source('src_bq', 'stackoverflow_posts')}}    
)

SELECT 
    id,
    post_type_id,
    CAST(score AS int) AS score,
    parent_id,
    title,
    accepted_answer_id,
    CAST(answer_count AS int) AS answer_count,
    CAST(comment_count AS int) AS comment_count,
    CAST(favorite_count AS int) AS favorite_count,
    creation_date,
    tags,
    CAST(view_count AS int) AS view_count,
    last_activity_date
FROM source_data