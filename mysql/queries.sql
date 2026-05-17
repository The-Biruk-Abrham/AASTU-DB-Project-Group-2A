USE Voting_System;
SELECT 
    c.candidate_id,
    c.candidate_name,
    p.party_name,
    COUNT(v.vote_id) AS total_votes
FROM candidate c
LEFT JOIN party p 
    ON c.party_id = p.party_id
LEFT JOIN vote v 
    ON c.candidate_id = v.candidate_id
GROUP BY 
    c.candidate_id,
    c.candidate_name,
    p.party_name
ORDER BY total_votes DESC;