CREATE DATABASE IF NOT EXISTS db_wordpress;
CREATE USER 'aben-cha'@'%' IDENTIFIED BY 'aben-cha@@';
GRANT ALL PRIVILEGES ON db_wordpress.* TO 'aben-cha'@'%';
FLUSH PRIVILEGES;
