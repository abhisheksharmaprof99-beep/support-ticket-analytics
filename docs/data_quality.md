# Data Quality Notes

## Dataset
Customer support tickets, 8,469 rows, 17 columns. Synthetic (generated) data.

## Findings
1. **Missing values are by design.** Resolution, Time to Resolution and Satisfaction
   exist only for Closed tickets (2,769). First Response Time is missing for Open
   tickets (2,819). Nothing was filled or deleted.
2. **Time columns are unreliable.** 1,365 of 2,769 closed tickets (49%) have a
   resolution time earlier than their first response. The gap averages ~0 hours and
   ranges from -23 to +23 hours.
3. **No ticket-created timestamp.** True response and resolution durations cannot be
   measured. All response timestamps fall within a ~27-hour window, so time trends
   are not possible.
4. **Category counts are near-uniform** (e.g. priorities 2,063 to 2,192), typical of
   synthetic data. Differences between groups should be interpreted cautiously.

## Decision
Time-based metrics are excluded from the dashboard. The analysis uses ticket volume,
backlog by status, priority, type, channel and product, and customer satisfaction
on closed tickets only.