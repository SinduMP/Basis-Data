--Create database PBD_namakalian
CREATE DATABASE PBD_namakalian;
use PDB_namakalian;
--Membuat tabel karyawan
CREATE TABLE karyawan(
	id int (3),
	nama VARCHAR(30),
	alamat text(),
	umur int(3),
 	jenis_kelamin VARCHAR(10),
	PRIMARY KEY (id)
);
