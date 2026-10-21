-- Average satisfaction by ticket type (closed tickets only: only they have ratings)
SELECT ticket_type,
       COUNT(*) AS rated_tickets,
       ROUND(AVG(customer_satisfaction_rating), 2) AS avg_rating
FROM tickets
WHERE is_closed = 1
GROUP BY ticket_type
ORDER BY avg_rating DESC;