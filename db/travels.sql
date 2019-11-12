DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN NOT NULL,
  description TEXT
);

CREATE TABLE cities (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN,
  description TEXT,
  country_id INT8 REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE cities (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN,
  description TEXT,
  country_id INT8 REFERENCES countries(id) ON DELETE CASCADE
);
