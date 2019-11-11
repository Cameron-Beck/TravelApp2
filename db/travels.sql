DROP TABLE city;
DROP TABLE country;

CREATE TABLE country (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN NOT NULL,
  description TEXT
);

CREATE TABLE city (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN,
  description TEXT,
  country_id INT8 REFERENCES country(id) ON DELETE CASCADE
);
