WITH vacancy_months AS (
  SELECT
    DATE_TRUNC('month', published_at) AS month,
    COUNT(*) AS vacancy_count
  FROM vacancies
  GROUP BY DATE_TRUNC('month', published_at)
  ORDER BY vacancy_count DESC
  LIMIT 1
),

resume_months AS (
  SELECT
    DATE_TRUNC('month', created_at) AS month,
    COUNT(*) AS resume_count
  FROM resumes
  GROUP BY DATE_TRUNC('month', created_at)
  ORDER BY resume_count DESC
  LIMIT 1
)

SELECT
  vm.month AS max_vacancy_month,
  vm.vacancy_count,
  rm.month AS max_resume_month,
  rm.resume_count
FROM vacancy_months vm
CROSS JOIN resume_months rm;
