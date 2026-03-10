SELECT
  v.id,
  v.title,
  COUNT(r.id) AS response_count
FROM vacancies v
INNER JOIN responses r ON v.id = r.vacancy_id
WHERE r.created_at BETWEEN v.published_at AND v.published_at + INTERVAL '7 days'
GROUP BY v.id, v.title
HAVING COUNT(r.id) > 5
ORDER BY response_count DESC;
