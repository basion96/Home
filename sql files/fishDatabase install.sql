DROP TABLE water_types;
DROP TABLE water_temperature_types;
DROP TABLE fish;
DROP TABLE fish_tanks;
DROP TABLE tank_plants;
DROP PROCEDURE add_fish;
DROP PROCEDURE add_tank;

CREATE TABLE water_types(
                          water_type_id INT AUTO_INCREMENT NOT NULL,
                          type_name VARCHAR(20),
                          type_description VARCHAR(100),
                          PRIMARY KEY (water_type_id)
);

CREATE TABLE water_temperature_types(
                                      water_temperature_type_id INT AUTO_INCREMENT NOT NULL,
                                      type_name VARCHAR(20),
                                      type_description VARCHAR(100),
                                      PRIMARY KEY (water_temperature_type_id)
);

create table fish_tanks
(
  tank_id int auto_increment,
  tank_name varchar(100) default 'unnamed',
  tank_size INT,
  water_type INT,
  water_temperature INT,
  description varchar(500),
  PRIMARY KEY (tank_id),
  FOREIGN KEY (water_type) REFERENCES water_types(water_type_id) ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY (water_temperature) REFERENCES water_temperature_types(water_temperature_type_id) ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE fish
(
  fish_id int auto_increment,
  fish_name varchar(50),
  sex VARCHAR(10),
  amount INT,
  tank_id INT NULL,
  PRIMARY KEY (fish_id),
  FOREIGN KEY (tank_id) REFERENCES fish_tanks(tank_id) ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE tank_plants(
                          plant_id INT AUTO_INCREMENT NOT NULL,
                          plant_type VARCHAR(50),
                          PRIMARY KEY  (plant_id)
);

/*
	procedures
*/
CREATE PROCEDURE
  add_tank
(
  IN _tank_name VARCHAR(100),
  IN _tank_size INT,
  IN _water_type INT,
  IN _water_temperature INT,
  IN _description VARCHAR(500)
)
  MODIFIES SQL DATA
BEGIN
  INSERT INTO fish_tanks (tank_name, tank_size, water_type, water_temperature, description)
  VALUES (_tank_name, _tank_size, _water_type, _water_temperature, _description);
END;

CREATE PROCEDURE
  add_fish
(
  IN _fish_name VARCHAR(50),
  IN _sex VARCHAR(10),
  IN _amount INT,
  IN _tank_id INT
)
  MODIFIES SQL DATA
BEGIN
  INSERT INTO fish (fish_name, sex, amount, tank_id)
  VALUES (_fish_name, _sex, _amount, _tank_id);
END;

CREATE PROCEDURE add_water_type
(
  IN _water_type VARCHAR(20),
  IN _type_description VARCHAR(100)
)
  MODIFIES SQL DATA
BEGIN
  INSERT INTO water_types (type_name, type_description)
  VALUES (_water_type, _type_description);
END;

CREATE PROCEDURE add_water_temperature_type
(
  IN _water_temperature_type VARCHAR(20),
  IN _type_description VARCHAR(100)
)
  MODIFIES SQL DATA
BEGIN
  INSERT INTO water_temperature_types (type_name, type_description)
  VALUES (_water_temperature_type, _type_description);
END;

CREATE PROCEDURE update_tank
(
  IN _tank_id INT,
  IN _tank_name VARCHAR(100),
  IN _tank_size INT,
  IN _water_type INT,
  IN _water_temperature INT,
  IN _description VARCHAR(500)
)
  MODIFIES SQL DATA
BEGIN
  UPDATE fish_tanks
  SET tank_name = _tank_name, tank_size = _tank_size, water_type = _water_type, water_temperature = _water_temperature, description = _description
  WHERE tank_id = _tank_id;
END;

CREATE PROCEDURE delete_tank
(
  IN _tank_id INT
)
  MODIFIES SQL DATA
BEGIN
  DELETE FROM fish_tanks WHERE tank_id = _tank_id;
END;

CREATE PROCEDURE update_fish
(
  IN _fish_id INT,
  IN _fish_name VARCHAR(50),
  IN _sex VARCHAR(10),
  IN _amount INT,
  IN _tank_id INT
)
  MODIFIES SQL DATA
BEGIN
  UPDATE fish
  SET fish_name = _fish_name, sex = _sex, amount = _amount, tank_id = _tank_id
  WHERE fish_id = _fish_id;
END;

CREATE PROCEDURE delete_fish
(
  IN _fish_id INT
)
  MODIFIES SQL DATA
BEGIN
  DELETE FROM fish WHERE fish_id = _fish_id;
END;


CREATE FUNCTION count_tanks() RETURNS INT
BEGIN
  RETURN (SELECT COUNT(*) FROM fish_tanks);
END;

/* creating triggers */
drop trigger on_tank_delete;

CREATE TRIGGER on_tank_delete
  BEFORE DELETE ON fish_tanks
  FOR EACH ROW
begin
  UPDATE fish f
  SET f.tank_id = NULL
  WHERE f.tank_id = tank_id;
END;

/* adding essential data*/
CALL add_water_temperature_type('Tropical', 'Warmer water usually around 25-30 degrees.');
CALL add_water_temperature_type('Cold-water', 'Cooler water usually around 15-20 degrees.');
CALL add_water_type('Fresh water', 'Pure fresh water.');
CALL add_water_type('Salt water', 'Salty water just like the beach.');
CALL add_water_type('Brackish', 'More salt than fresh water, but not as much as a salt water tank.');