{{ config(materialized='table') }}

SELECT *,
    SPLIT(t.PostTags,'|')[0] AS PostTag1
from {{ ref ('dbt_append_tags') }} AS t
