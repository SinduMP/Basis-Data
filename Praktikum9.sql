CREATE TABLE mhs (
    nim CHAR(14),
    noktp CHAR(16),
    nama VARCHAR(20),
    PRIMARY KEY (nim)
);

--mengisi values tabel mhs
INSERT INTO mhs VALUES 
    ("A12.2019.06000", "3374080123450001", "Data"),
    ("A12.2019.06001", "3374080123450002", "Leni"),
    ("A12.2019.06002", "3374080123450005", "Rafia"),
    ("A12.2019.06003", "3374080123450006", "Wardah"),
    ("A12.2019.06004", "3374080123450007", "Wahyu Lestari"),
    ("A12.2019.06005", "3374080123450008", "Lukman Nurjadi"),
    ("A12.2019.06008", "3374080123450009", "Satria Piningit");

--2. tabel krs
CREATE TABLE krs (
    nim CHAR(14),
    sks INT,
    PRIMARY KEY (nim)
);

--mengisi values krs
INSERT INTO krs VALUES 
    ("A12.2019.06001", 20),
    ("A12.2019.06002", 22),
    ("A12.2019.06005", 22),
    ("A12.2019.06008", 18);

--3. tabel mhsbank
CREATE TABLE mhsbank (
    noktp CHAR(16),
    bank VARCHAR(10),
    saldo INT
);

--mengisi values tabel mhsbank
INSERT INTO mhsbank VALUES 
    ("3374080123450001", "Mandiri", 1500000),
    ("3374080123450002", "BCA", 7500000),
    ("3374080123450002", "BPD", 1250000),
    ("3374080123450006", "BPD", 2250000),
    ("3374080123450007", "BPD", 250000),
    ("3374080123450007", "BNI", 50000),
    ("3374080123450007", "Mandiri", 1150000),
    ("3374080123450009", "BCA", 2250000);

--B. Jelaskan apa kegunaan dan output perintah berikut :
--1. 
SELECT * 
FROM mhs LEFT OUTER JOIN krs ON mhs.nim = krs.nim;

•	Merupakan perintah join untuk menampilkan semua data sebelah kiri dari table yang di joinkan dan menampilkan data sebelah kanan yang cocok dengan kondisi join. Jika tidak ditemukan kecocokan, maka akan di set NULL secara otomatis.

--2. 
SELECT * 
FROM krs RIGHT OUTER JOIN mhs ON mhs.nim = krs.nim;

•	Menampilkan semua data yang ada di table sebelah kanan dan mencari kecocokan key pada table sebelah kiri. Jika tidak ditemukan kecocokan, maka akan di set NULL secara otomatis pada table sebelah kiri.

--3.
SELECT * 
FROM mhs RIGHT OUTER JOIN krs ON mhs.nim = krs.nim;

•	Menampilkan semua data yang ada di table sebelah kanan dan mencari kecocokan key pada table sebelah kiri. Jika tidak ditemukan kecocokan, maka akan di set NULL secara otomatis pada table sebelah kiri

--4.
SELECT nim, nama, bank, saldo 
FROM mhs RIGHT OUTER JOIN mhsbank ON mhs.noktp = mhsbank.noktp;

•	Menampilkan data nim, nama, bank saldo yang ada di table mhs dan mencari kecocokan key pada table mhsbank. Jika tidak ditemukan kecocokan, maka akan di set NULL secara otomatis pada table sebelah kiri.

--5.
SELECT * 
FROM mhsbank
WHERE saldo = (SELECT MAX(saldo) FROM mhsbank);

•	Menampilkan data yang ada di tabel mhsbank dimana saldo yang paling tinggi.

--6.
SELECT nim, nama 
FROM mhs
WHERE EXISTS (SELECT * FROM mhsbank WHERE mhs.noktp = mhsbank.noktp);

•	Menampilkan data nim,nama yang ada di table mhs untuk menguji keberadaan rekaman apa pun di subkueri dan mengembalikan nilai true jika subkueri mengembalikan satu atau beberapa rekaman.

--7.
SELECT nim, nama 
FROM mhs
WHERE NOT EXISTS (SELECT * FROM mhsbank WHERE mhs.noktp = mhsbank.noktp);

•	Menampilkan data nim,nama yang ada di table mhs untuk menguji keberadaan rekaman apa pun di subkueri dan mengembalikan nilai false jika subkueri mengembalikan satu atau beberapa rekaman.

--8.
SELECT noktp, saldo 
FROM mhsbank
WHERE saldo > ANY (SELECT saldo FROM mhsbank);

•	Menampilkan data noktp, saldo pada tabel mhsbank dimana saldo mengembalikan TRUE dan menemukan rekaman ANY di tabel mhs di mana saldo> saldo from mhsbank:

--9.
SELECT noktp, saldo 
FROM mhsbank
WHERE saldo < ALL (SELECT saldo FROM mhsbank WHERE bank = "BCA");

•	Menampilkan noktp, saldo yang ada pada tabel mhsbank dan mengembalikan nilai benar jika semua nilai subkueri memenuhi kondisi.







