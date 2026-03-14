SELECT
  area_id,
  AVG(compensation_from) AS avg_compensation_from,
  AVG(compensation_to) AS avg_compensation_to,
  AVG((COALESCE(compensation_from, compensation_to) + COALESCE(compensation_to, compensation_from)) / 2.0) AS avg_compensation_mean
FROM vacancies
WHERE compensation_from IS NOT NULL
   OR compensation_to IS NOT NULL
GROUP BY area_id
ORDER BY area_id;
