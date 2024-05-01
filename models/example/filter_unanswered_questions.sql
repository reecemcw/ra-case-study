
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with filtered_questions as (
    select
        *
    from `ra-case-study.so_public.posts_questions`
    where accepted_answer_id is null
),

-- Step 2: Calculate PostAge in months
calculated_post_age as (
    select
        *,
        CEILING(TIMESTAMP_DIFF(current_timestamp(), creation_date, DAY)*0.032855) as PostMonthAge,
        CEILING(TIMESTAMP_DIFF(current_timestamp(), last_activity_date, DAY)*0.032855) as PostMonthDormant
    from filtered_questions
)


-- Step 3: Final select statement to create the product table
select
    id AS PostID,
    title AS PostTitle,
    answer_count AS PostAnswers,
    comment_count AS PostComments,
    view_count AS PostViews,
    favorite_count AS PostFavourites,
    PostMonthAge,
    PostMonthDormant
from calculated_post_age

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
