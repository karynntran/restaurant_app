CREATE DATABASE food_db;

\c food_db;

CREATE TABLE foods (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  cuisine VARCHAR(100),
  price INTEGER,
  allergens VARCHAR(255)
);


CREATE DATABASE party_db;

\c party_db;

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  table_num INTEGER,
  guest_num INTEGER,
  paid VARCHAR(100)
);

