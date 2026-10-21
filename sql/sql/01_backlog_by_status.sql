-- Backlog: share of tickets in each status
SELECT ticket_status,
       COUNT(*) AS tickets,
       ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM tickets), 1) AS pct
FROM tickets
GROUP BY ticket_status
ORDER BY tickets DESC;