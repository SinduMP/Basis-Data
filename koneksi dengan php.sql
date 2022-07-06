--Create database PBD_namakalian
CREATE DATABASE PBD_namakalian;
use PDB_namakalian;
--Membuat tabel karyawan
CREATE TABLE karyawan(
	id  int(3) PRIMARY KEY AUTO_INCREMENT,
	nama VARCHAR(30),
	alamat text,
	umur int(3),
 	jenis_kelamin VARCHAR(10)
);

DESC karyawan;
--+---------------+-------------+------+-----+---------+----------------+
--| Field         | Type        | Null | Key | Default | Extra          |
--+---------------+-------------+------+-----+---------+----------------+
--| id            | int(3)      | NO   | PRI | NULL    | auto_increment |
--| nama          | varchar(30) | YES  |     | NULL    |                |
--| alamat        | text        | YES  |     | NULL    |                |
--| umur          | int(3)      | YES  |     | NULL    |                |
--| jenis_kelamin | varchar(10) | YES  |     | NULL    |                |
--+---------------+-------------+------+-----+---------+----------------+
--5 rows in set (0.021 sec)

