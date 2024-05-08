WITH date_dim as (
    {{ dbt_date.get_date_dimension("2009-01-01", "2023-12-31") }}
)
SELECT *
FROM date_dim