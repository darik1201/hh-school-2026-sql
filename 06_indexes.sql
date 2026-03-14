-- Используется для группировки по регионам в запросе 3
CREATE INDEX idx_vacancies_area_id ON vacancies(area_id);

-- Используется для группировки по месяцам в запросе 4 и для фильтрации временного диапазона в запросе 5
CREATE INDEX idx_vacancies_published_at ON vacancies(published_at);

-- Используется для группировки по месяцам в запросе 4
CREATE INDEX idx_resumes_created_at ON resumes(created_at);

-- Используется для JOIN с vacancies в запросе 5
CREATE INDEX idx_responses_vacancy_id ON responses(vacancy_id);

-- Используется для фильтрации по времени в запросе 5
CREATE INDEX idx_responses_created_at ON responses(created_at);

-- Используется в запросе 5, который фильтрует по обоим полям одновременно
CREATE INDEX idx_responses_vacancy_created ON responses(vacancy_id, created_at);
