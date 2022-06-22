Create Table pemeran (
kode_pem Char(5) Primary Key Not Null,
nama Char(20) Not Null,
tgl_lahir Date Not Null,
sex Char(1) Not Null);


Create Table film (
kode_film Char(5) Primary Key Not Null,
judul Char(30) Not Null,
tahun Char(4) Not Null);

Create Table mainsbg (
kode_pem Char(5) Not Null,
kode_film Char(5) Not Null,
peran Char(20) Not Null);


--sindu pemeran

Insert Into pemeran (kode_pem, nama, tgl_lahir, sex ) 
Values
('P0001', 'Mahendra', '1975/02/22', 'P'),
('P0002', 'Maharani', '1982/01/03', 'W'),
('P0003', 'Dhika', '1995/09/28', 'P'),
('P0004', 'Budi Utami', '1974/05/09', 'W'),
('P0005', 'Adi Nugroho', '1989/03/20', 'P'),
('P0006', 'Anindita', '1993/11/10', 'W'),
('P0007', 'Citra', '1992/05/27', 'W'),
('P0008', 'Dini', '1990/12/25', 'W'),
('P0009', 'Firly', '1988/07/15', 'P'),
('P0010', 'Putri', '1994/10/11', 'W'),
('P0011', 'Melinda', '1996/07/25', 'W'),
('P0012', 'Mitza', '1997/12/27', 'W'),
('P0013', 'Aji Prakoso', '1991/05/17', 'P'),
('P0014', 'Valiant', '1996/12/15', 'P'),
('P0015', 'Jovita', '1988/07/17', 'W');



--fahri film

INSERT INTO film (kode_film , judul , tahun)
    VALUES
        ('F0001', 'Di Atas Angan', '1999'),
        ('F0002', 'Dibawah Kolong', '1985'),
        ('F0003', 'Embun Pagi', '1995'),
        ('F0004', 'Perang Bintang', '1974'),
        ('F0005', 'Pahlawan Kemerdekaan', '1989'),
        ('F0006', 'Merdeka Atau Mati', '1993'),
        ('F0007', 'Sera Centhini', '1992'),
        ('F0008', 'Daun-Daun Berisik', '1990'),
        ('F0009', 'Kabut Sutra Ungu', '1987'),
        ('F0010', 'Kaki Gunung', '1974'),
        ('F0011', 'Titisan Dewa', '1989'),
        ('F0012', 'Pendekar Kelana', '1974'),
        ('F0013', 'Wali Songo', '1993'),
        ('F0014', 'Dibawah Kabut', '1990'),
        ('F0015', 'Serangan Umum 1 Maret', '1988');




--Dimas Fauzan
insert into mainsbg values 
  ('P0005', 'F0001', 'Nia'),
  ('P0005', 'F0002', 'Ani'),
  ('P0002', 'F0003', 'Tika'),
  ('P0002', 'F0004', 'Ika'),
  ('P0002', 'F0011', 'Putri'),
  ('P0001', 'F0005', 'Dita'),
  ('P0003', 'F0004', 'Dika'),
  ('P0008', 'F0007', 'Rangga'),
  ('P0007', 'F0009', 'Bima'),
  ('P0007', 'F0008', 'Mentari'),
  ('P0004', 'F0010', 'Santi'),
  ('P0003', 'F0012', 'Sinta'),
  ('P0003', 'F0013', 'Melani'),
  ('P0000', 'F0014', 'Sunan Kali Jogo'),
  ('P0001', 'F0014', 'Sunan Gunung Jati'),
  ('P0006', 'F0015', 'Komandan'),
  ('P0002', 'F0015', 'Pejuan 1');
  
  select * from mainsbg;
  

  
  // Fadhil
  1)
select mainsbg.kode_pem, film.judul, mainsbg.peran
from mainsbg, film
where mainsbg.kode_film = film.kode_film;

2)
select mainsbg.kode_pem, film.judul, mainsbg.peran
from mainsbg, film
where mainsbg.kode_film = film.kode_film
order by mainsbg.kode_pem;

3)
select a.kode_pem, b.judul, a.peran
from mainsbg a, film b
where a.kode_film = b.kode_film;

4)
select pe.nama, fi.judul, ma.peran
from pemeran pe, film fi, mainsbg ma
where ma.kode_film = fi.kode_film and ma.kode_pem = pe.kode_pem;

5)
select x.nama, y.nama
from pemeran x, pemeran y
where x.sex = 'P' and y.sex = 'W';

6)
select p.nama, m.kode_film, m.peran
from pemeran p inner join mainsbg m
where p.kode_pem = m.kode_pem;

7)
select p.kode_pem, p.nama, m.kode_pem, m.kode_film
from pemeran p natural join mainsbg m;

8)
Select tugas_daftar_provinsi.prov, tugas_populasi.nama_kota as kota, tugas_populasi.penduduk 
From tugas_daftar_provinsi, tugas_populasi 
where ibukota = nama_kota;
