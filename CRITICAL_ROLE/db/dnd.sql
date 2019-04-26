DROP TABLE characters;
DROP TABLE dungeon_masters;

CREATE TABLE dungeon_masters (
  id SERIAL4 PRIMARY KEY,
  dm_name VARCHAR(255),
  campaign VARCHAR(255),
  level_req INT4
);

CREATE TABLE characters (
  id SERIAL4 PRIMARY KEY,
  player_name VARCHAR(255),
  character_name VARCHAR(255),
  race VARCHAR(255),
  character_class VARCHAR(255),
  level INT4,
  dm_id INT4 REFERENCES dungeon_masters(id)
);
