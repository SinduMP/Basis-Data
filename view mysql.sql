--View Mysql


--Buat database view
create database view;
use view

--mempersiapkan tabel mahasiswa dan universitas
DROP TABLE IF EXISTS mahasiswa;
DROP TABLE IF EXISTS universitas;

CREATE TABLE mahasiswa (
 nim CHAR(8) PRIMARY KEY,
 nama VARCHAR(50),
 asal VARCHAR(50),
 jurusan VARCHAR (20),
 nilai_uan DEC(5,2)
) ENGINE = InnoDB;

INSERT INTO mahasiswa VALUES
('17090113', 'Riana Putria', 'Padang', 'Kimia', 339.20),
('17140143', 'Rudi Permana', 'Bandung', 'Ilmu Komputer', 290.44),
('17080305', 'Rina Kumala Sari', 'Jakarta', 'Akuntansi', 337.99),
('17140119', 'Sandri Fatmala', 'Bandung', 'Ilmu Komputer', 322.91),
('17080225', 'Husli Khairan', 'Jakarta', 'Akuntansi', 288.55),
('17140133', 'Ikhsan Prayoga', 'Jakarta', 'Ilmu Komputer', 300.16),
('17140120', 'Bobby Permana', 'Medan', 'Ilmu Komputer', 280.82);

CREATE TABLE universitas (
 jurusan VARCHAR(20) PRIMARY KEY,
 tgl_berdiri DATE,
 nama_dekan VARCHAR(50),
 jum_mhs SMALLINT UNSIGNED,
 akr ENUM('A', 'B', 'C', 'N/A')
) ENGINE = InnoDB;

INSERT INTO universitas VALUES
('Kimia', '1987-07-12', 'Prof. Mulyono, M.Sc.', 662, 'B'),
('Ilmu Komputer', '2003-02-23', 'Dr. Syahrial, M.Kom.', 412, 'A'),
('Akuntansi', '1985-03-19', 'Maya Fitrianti, M.M.', 895, 'B'),
('Farmasi', '1997-05-30', 'Prof. Silvia Nst, M.Farm.', 312, 'C'),
('Fisika', '1989-12-10', 'Dr. Umar Agustinus, M.Sc.', 275, 'A'),
('Hukum', '1983-08-08', 'Prof. Gunarto, M.H.', 754, 'B');

SELECT * FROM mahasiswa;

SELECT * FROM universitas;

--Membuat dan Menghapus VIEW
CREATE VIEW detail_mhs AS
SELECT nama, nim, jurusan FROM mahasiswa ORDER BY nama ASC;

SELECT * FROM detail_mhs;

ALTER VIEW detail_mhs AS
SELECT nim, nama, jurusan FROM mahasiswa ORDER BY nim DESC;

SELECT * FROM detail_mhs;

--Cara lain untuk mengubah VIEW
CREATE OR REPLACE VIEW detail_mhs AS
SELECT jurusan, nama FROM mahasiswa;

SELECT * FROM detail_mhs;

--VIEW untuk JOIN dan penambahan data
CREATE VIEW detail_mhs AS
 SELECT nama, nim, mahasiswa.jurusan, nama_dekan
 FROM mahasiswa INNER JOIN universitas
 WHERE mahasiswa.jurusan = universitas.jurusan
 ORDER BY nama ASC;

CREATE VIEW detail_mhs_format AS
SELECT
UCASE(nama) AS 'Nama Mahasiswa',
CONCAT(jurusan,' (', nama_dekan,')') AS 'Nama Jurusan dan Dekan'
FROM detail_mhs;

SELECT * FROM detail_mhs_format;

UPDATE universitas SET nama_dekan = 'Prof.Rika Susilawati M.Kom'
WHERE jurusan = 'Ilmu Komputer';

SELECT * FROM detail_mhs;

SELECT * FROM detail_mhs_format;

--UPDATE DATA DARI VIEW
CREATE VIEW mahasiswa_ilkom AS
SELECT nim, nama, jurusan FROM mahasiswa WHERE jurusan = 'Ilmu Komputer';

SELECT * FROM mahasiswa_ilkom;

INSERT INTO mahasiswa_ilkom VALUES
('17140155', 'Tika Herina', 'Ilmu Komputer');

SELECT * FROM mahasiswa_ilkom;

SELECT * FROM mahasiswa where nama = 'Tika Herina';

DELETE FROM mahasiswa_ilkom WHERE nama = 'Bobby Permana';  

INSERT INTO mahasiswa_ilkom VALUES
('17090127', 'Herman Eka Putra', 'Kimia');

DROP VIEW mahasiswa_ilkom;

CREATE VIEW mahasiswa_ilkom AS
SELECT nim, nama, jurusan FROM mahasiswa WHERE jurusan = 'Ilmu Komputer'
WITH CHECK OPTION;

INSERT INTO mahasiswa_ilkom VALUES
('17080276', 'Rano Tobing', 'Akuntansi');
--ERROR 1369 (HY000): CHECK OPTION failed 'belajar.mahasiswa_ilkom'


--EVALUASI
