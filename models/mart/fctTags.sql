SELECT
  split_tags,
  creation_date,
  COUNT(*) AS question_count
FROM(
  SELECT
    EXTRACT(YEAR FROM creation_date) AS creation_date,
    stg_posts_questions.tags AS tags,
    -- stg_posts_questions.creation_date AS creation_date,
    SPLIT(tags,'|') AS tag_names_split,
    FROM {{ ref('stg_posts_questions') }}
    -- LEFT JOIN {{ref('stg_posts_answers') }} ON stg_stackoverflow_posts.id = stg_posts_answers.id
    -- LEFT JOIN {{ref('stg_posts_questions') }} ON stg_posts_answers.id = stg_posts_questions.id
) CROSS JOIN
UNNEST(tag_names_split) split_tags 
GROUP BY
creation_date, split_tags
ORDER BY question_count DESC