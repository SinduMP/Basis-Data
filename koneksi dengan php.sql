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

-- lihat struktur tabel kryawan
desc karyawan;
