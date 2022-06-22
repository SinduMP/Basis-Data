
--1. Tabel barang
CREATE TABLE barang 
(kode char(5), nama varchar(20), jenis varchar(15), harga int, jumlah int, pemasok char(5));

--2. Tabel jual
CREATE TABLE jual 
(notrans char(5), kode char(5), jumlah int);

--3. Tabel beli
CREATE TABLE beli 
(nofaktur char(5), kode char(5), harga int, jumlah int);

--A. TRIGGER
--1. TRIGGER insjual_updjumlah
CREATE TRIGGER insjual_updjumlah
BEFORE INSERT
ON jual
FOR EACH ROW
BEGIN
	UPDATE barang SET jumlah = (jumlah - new.jumlah)
	WHERE kode = new.kode;
END//

