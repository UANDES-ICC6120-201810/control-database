
CREATE DATABASE control_point;
USE control_point;

CREATE TABLE plate_readings(
      id INT NOT NULL AUTO_INCREMENT,
      plate VARCHAR(20) NOT NULL,
      submitted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (id)
);

CREATE TABLE bus_speed(
      id INT NOT NULL AUTO_INCREMENT,
      speed INT NOT NULL,
      submitted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (id)
);

CREATE USER 'ALPR'@'%' IDENTIFIED BY 'PASSALPR';
GRANT INSERT ON control_point . * TO 'ALPR'@'%';
GRANT SELECT ON control_point . * TO 'ALPR'@'%';
GRANT UPDATE ON control_point . * TO 'ALPR'@'%';
GRANT DELETE ON control_point . * TO 'ALPR'@'%';
FLUSH PRIVILEGES;
