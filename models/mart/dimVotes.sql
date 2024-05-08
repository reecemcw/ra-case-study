
SELECT 
    {{ dbt_utils.generate_surrogate_key(['stg_votes.id']) }} as vote_id,
    stg_votes.vote_type_id,
    CASE 
        WHEN stg_votes.vote_type_id = 1 THEN 'accepted'
        WHEN stg_votes.vote_type_id = 2 THEN 'up' 
        WHEN stg_votes.vote_type_id = 3 THEN 'down' 
        WHEN stg_votes.vote_type_id = 4 THEN 'offensive' 
        WHEN stg_votes.vote_type_id = 5 THEN 'bookmark' 
        WHEN stg_votes.vote_type_id = 6 THEN 'close' 
        WHEN stg_votes.vote_type_id = 7 THEN 'reopen' 
        WHEN stg_votes.vote_type_id = 8 THEN 'bountyStart' 
        WHEN stg_votes.vote_type_id = 9 THEN 'bountyClose' 
        WHEN stg_votes.vote_type_id = 10 THEN 'deletion' 
        WHEN stg_votes.vote_type_id = 11 THEN 'undeletion' 
        WHEN stg_votes.vote_type_id = 12 THEN 'spam'
        -- WHEN stg_votes.vote_type_id = 13 THEN 'nominateModerator' 
        WHEN stg_votes.vote_type_id = 14 THEN 'nominateModerator' 
        WHEN stg_votes.vote_type_id = 15 THEN 'moderatorReview' 
        WHEN stg_votes.vote_type_id = 16 THEN 'approveEditSuggestion' 
        else 'unknown'
    END AS vote_type,
    stg_votes.post_id as post_id
FROM {{ ref('stg_votes') }}