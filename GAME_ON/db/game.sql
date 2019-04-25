DROP TABLE inventories;
DROP TABLE games;
DROP TABLE publishers;

CREATE TABLE publishers (
  id SERIAL4 PRIMARY KEY,
  company_name VARCHAR(255)
);

CREATE TABLE games (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  stock INT4
);

CREATE TABLE inventories (
  id SERIAL4 PRIMARY KEY,
  game_id INT4 REFERENCES games(id),
  publisher_id INT4 REFERENCES publishers(id)
);
