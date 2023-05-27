CREATE TABLE character (
  character_id INT PRIMARY KEY AUTO_INCREMENT,
  class VARCHAR(255),
  background VARCHAR(255),
  player_name VARCHAR(255),
  race VARCHAR(255),
  alignment VARCHAR(255),
  xp VARCHAR(255),
  hp VARCHAR(255),
  armor VARCHAR(255),
  hit_dice VARCHAR(255),
  inspiration VARCHAR(255),
  proficient VARCHAR(255),
  initiative VARCHAR(255),
  speed VARCHAR(255)
);

CREATE TABLE character_attributes (
  character_id INT,
  str NUMERIC,
  dex NUMERIC,
  con NUMERIC,
  int NUMERIC,
  wis NUMERIC,
  cha NUMERIC,
  per NUMERIC,
  FOREIGN KEY (character_id) REFERENCES character (character_id)
);

CREATE TABLE modificador_attributes_personagem (
  character_id INT,
  mod_str BOOLEAN,
  mod_dex BOOLEAN,
  mod_con BOOLEAN,
  mod_int NUMERIC,
  mod_wis BOOLEAN,
  mod_cha BOOLEAN,
  mod_per BOOLEAN,
  FOREIGN KEY (character_id) REFERENCES character (character_id)
);

CREATE TABLE savingthrows (
  character_id INT,
  savi_str NUMERIC,
  savi_dex NUMERIC,
  savi_con NUMERIC,
  savi_int NUMERIC,
  savi_wis NUMERIC,
  savi_cha NUMERIC,
  FOREIGN KEY (character_id) REFERENCES character (character_id)
);

CREATE TABLE skills (
  character_id INT,
  acrobatics NUMERIC,
  animal_handling NUMERIC,
  arcana NUMERIC,
  athletics NUMERIC,
  deception NUMERIC,
  history NUMERIC,
  insight NUMERIC,
  intimidation NUMERIC,
  investigation NUMERIC,
  medicine NUMERIC,
  nature NUMERIC,
  perception NUMERIC,
  performance NUMERIC,
  persuasion NUMERIC,
  religion NUMERIC,
  sleight_of_hand NUMERIC,
  stealth NUMERIC,
  survival NUMERIC,
  FOREIGN KEY (character_id) REFERENCES character (character_id)
);

CREATE TABLE proficience_skills (
  character_id INT,
  prof_acrobatics BOOLEAN,
  prof_animal_handling BOOLEAN,
  prof_arcana BOOLEAN,
  prof_athletics BOOLEAN,
  prof_deception BOOLEAN,
  prof_history BOOLEAN,
  prof_insight BOOLEAN,
  prof_intimidation BOOLEAN,
  prof_investigation BOOLEAN,
  prof_medicine BOOLEAN,
  prof_nature BOOLEAN,
  prof_perception BOOLEAN,
  prof_performance BOOLEAN,
  prof_persuasion BOOLEAN,
  prof_religion BOOLEAN,
  prof_sleight_of_hand BOOLEAN,
  prof_stealth BOOLEAN,
  prof_survival BOOLEAN,
  FOREIGN KEY (character_id) REFERENCES character (character_id)
);

CREATE TABLE character_text (
  character_id INT,
  notes VARCHAR(255),
  traits VARCHAR(255),
  FOREIGN KEY (character_id) REFERENCES character (character_id)
);
