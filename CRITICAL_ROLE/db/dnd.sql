DROP TABLE character_dms;
DROP TABLE characters;
DROP TABLE dungeon_masters;
DROP TABLE races;
DROP TABLE players;
DROP TABLE character_classes;
DROP TABLE campaigns;

CREATE TABLE campaigns (
  id SERIAL4 PRIMARY KEY,
  campaign_name VARCHAR(255)
);

CREATE TABLE character_classes (
  id SERIAL4 PRIMARY KEY,
  class_name VARCHAR(255)
);

CREATE TABLE players (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE races (
  id SERIAL4 PRIMARY KEY,
  race VARCHAR(255)
);

CREATE TABLE dungeon_masters (
  id SERIAL4 PRIMARY KEY,
  dm_name VARCHAR(255),
  campaign_id INT4 REFERENCES campaigns(id) ON DELETE CASCADE,
  min_level INT4,
  max_level INT4
);

CREATE TABLE characters (
  id SERIAL4 PRIMARY KEY,
  player_id INT4 REFERENCES players(id) ON DELETE CASCADE,
  character_name VARCHAR(255),
  race_id INT4 REFERENCES races(id) ON DELETE CASCADE,
  character_class_id INT4 REFERENCES character_classes(id)  ON DELETE CASCADE,
  level INT4
);

CREATE TABLE character_dms (
  id SERIAL4 PRIMARY KEY,
  character_id INT4 REFERENCES characters(id) ON DELETE CASCADE,
  dungeon_master_id INT4 REFERENCES dungeon_masters(id) ON DELETE CASCADE
);
