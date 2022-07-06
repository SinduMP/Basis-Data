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

-- Mengisi tabel (Silahkan isi data kalian)
INSERT INTO karyawan (nama,alamat,umur,jenis_kelamin) VALUES(
'Sindu Masri P',
'Semarang',
'20',
'Laki-laki');

SELECT * FROM karyawan;
--+----+---------------+----------+------+---------------+
--| id | nama          | alamat   | umur | jenis_kelamin |
--+----+---------------+----------+------+---------------+
--|  1 | Sindu Masri P | Semarang |   20 | Laki-laki     |
--+----+---------------+----------+------+---------------+
--1 row in set (0.006 sec)

--masuk ke folder htdoc pada XAMMP dab buatlah file PHP lalu isi dengan code berikut
<?php
$connect = mysqli_connect('localhost', 'root', '', 'PBD_namakalian');
 
if($connect)
    echo "Berhasil";
else
    echo "Gagal";
 
?>

--Dikarenakan sistem sudah berhasil terhubung ke database, maka kita tidak perlu menampilkan tulisan “Berhasil”. Hapus if statement yang sebelumnya ditulis, kemudian ubah kode file connection.php menjadi seperti berikut.
<?php
$connect = mysqli_connect('localhost', 'root', '', 'PBD_namakalian');
 
if(!$connect)
    exit("Gagal Koneksi Database");

 
?>

--Setelah PHP berhasil terhubung ke database, selanjutnya kita buat skip yang berfungsi untuk menampilkan data. Buat file baru bernama list.php, kemudian tambahkan kode PHP sebagai berikut
<?php
include('connection.php');

$query = mysqli_query($connect, "SELECT * FROM karyawan");
$results = mysqli_fetch_all($query, MYSQLI_ASSOC);

print_r($results);
?>

