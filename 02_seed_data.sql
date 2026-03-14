INSERT INTO specializations (name)
SELECT 'Специализация ' || i
FROM generate_series(1, 50) AS i;

INSERT INTO vacancies (title, description, compensation_from, compensation_to, area_id, specialization_id, published_at)
SELECT
  title,
  description,
  compensation_from,
  compensation_from + (random() * 100000)::INTEGER AS compensation_to,
  area_id,
  specialization_id,
  published_at
FROM (
  SELECT
    'Вакансия ' || i AS title,
    'Описание вакансии ' || i AS description,
    (random() * 100000 + 30000)::INTEGER AS compensation_from,
    (random() * 100 + 1)::INTEGER AS area_id,
    (random() * 49 + 1)::INTEGER AS specialization_id,
    CURRENT_TIMESTAMP - random() * INTERVAL '365 days' AS published_at
  FROM generate_series(1, 10000) AS i
) AS base;

INSERT INTO resumes (title, first_name, last_name, area_id, specialization_id, created_at)
SELECT
  'Резюме ' || i AS title,
  'Имя' || i AS first_name,
  'Фамилия' || i AS last_name,
  (random() * 100 + 1)::INTEGER AS area_id,
  (random() * 49 + 1)::INTEGER AS specialization_id,
  CURRENT_TIMESTAMP - random() * INTERVAL '365 days' AS created_at
FROM generate_series(1, 100000) AS i;

INSERT INTO responses (vacancy_id, resume_id, created_at)
SELECT
  v.id AS vacancy_id,
  r.id AS resume_id,
  GREATEST(v.published_at, r.created_at) + random() * INTERVAL '30 days' AS created_at
FROM (
  SELECT id, published_at,
         (random() * 4 + 1)::INTEGER AS num_responses
  FROM vacancies
) v
CROSS JOIN LATERAL (
  SELECT id, created_at
  FROM resumes
  WHERE created_at <= v.published_at + INTERVAL '30 days'
  ORDER BY random()
  LIMIT v.num_responses
) r;
