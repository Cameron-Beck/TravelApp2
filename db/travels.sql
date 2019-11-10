DROP TABLE city;
DROP TABLE country;

CREATE TABLE country (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN
);


CREATE TABLE city (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  visited BOOLEAN,
  country_id INT8 REFERENCES country(id)
);
