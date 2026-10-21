-- Does priority change how often tickets get closed?
SELECT ticket_priority,
       COUNT(*) AS total,
       SUM(is_closed) AS closed,
       ROUND(100.0 * SUM(is_closed) / COUNT(*), 1) AS pct_closed
FROM tickets
GROUP BY ticket_priority
ORDER BY pct_closed DESC;