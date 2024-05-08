SELECT
    {{ dbt_utils.generate_surrogate_key(['stg_stackoverflow_posts.id'])}} as post_id,
    stg_stackoverflow_posts.answer_count AS post_answers,
    stg_stackoverflow_posts.comment_count AS post_comments,
    stg_stackoverflow_posts.favorite_count AS post_favorites,
    stg_stackoverflow_posts.score AS post_score,
    stg_stackoverflow_posts.view_count AS post_views,
    stg_stackoverflow_posts.accepted_answer_id AS post_accepted_answers

FROM {{ ref('stg_stackoverflow_posts') }}
LEFT JOIN {{ref('stg_posts_answers') }} ON stg_stackoverflow_posts.id = stg_posts_answers.id
LEFT JOIN {{ref('stg_posts_questions') }} ON stg_posts_answers.id = stg_posts_questions.id