{{ config(materialized='table') }}

SELECT *,
    SPLIT(t.tags,'|')[0] AS PostTag1
from {{ ref ('dbt_append_tags') }} AS t
