
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

DELIMITER //
CREATE TRIGGER insjual_updjumlah
BEFORE INSERT
ON jual
FOR EACH ROW
BEGIN
	UPDATE barang SET jumlah = (jumlah - new.jumlah)
	WHERE kode = new.kode;
END//

--2. TRIGGER insbeli_updharga

DELILITER //
CREATE TRIGGER insbeli_updharga
BEFORE INSERT
ON beli
FOR EACH ROW
BEGIN
	declare xharga int;
	set xharga = (select harga from barang
		where kode = new.kode);
	if (xharga < new.harga) then
		update barang set
		harga = new.harga + (new.harga * 25/100),
		jumlah = (jumlah + new.jumlah)
		where kode = new.kode;
	else
		update barang set jumlah = (jumlah + new.jumlah)
		where kode = new.kode;
	end if;
END //
