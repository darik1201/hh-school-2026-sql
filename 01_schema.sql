CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE vacancies (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  compensation_from INTEGER,
  compensation_to INTEGER,
  area_id INTEGER NOT NULL,
  specialization_id INTEGER REFERENCES specializations(id),
  published_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE resumes (
  id SERIAL PRIMARY KEY,
  title VARCHAR(500) NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  area_id INTEGER NOT NULL,
  specialization_id INTEGER REFERENCES specializations(id),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE responses (
  id SERIAL PRIMARY KEY,
  vacancy_id INTEGER NOT NULL REFERENCES vacancies(id),
  resume_id INTEGER NOT NULL REFERENCES resumes(id),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
