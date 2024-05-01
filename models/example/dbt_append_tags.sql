{{ config(materialized='view') }}

SELECT 
    t1.*, 
    `ra-case-study.so_public.stackoverflow_posts`.tags AS PostTags
from {{ ref('dbt_filter_questions') }} AS t1
INNER JOIN `ra-case-study.so_public.stackoverflow_posts` ON t1.PostID=`ra-case-study.so_public.stackoverflow_posts`.id