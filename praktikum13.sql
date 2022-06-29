--1.  matikan firewall
--    Controlpanel - System and Security - Windows devender firewall - Turn windows defender firewall on and off
--2.  komputer server dan client terhubung ke wifi yang sama dan coba saling ping
--3.  pada komputer server buatlah database 
    CREATE DATABASE penjualan;
    use penjualan;
    CREATE TABLE barang (kode char(5), nama varchar(20), harga int, jumlah int);
    
    INSERT barang VALUES
    (10001, 'Buku 123', 2500, 20),
    (10002, 'Buku 003', 3500, 25),
    (10003, 'Pensil OY', 1500, 25),
    (10004, 'Pensil Warna AI', 2500, 15);
    
--4.  Membuat user pada komputer server
    
    show databases;
    use mysql;
    show tables;
    select user, host, password from user;
    --membuat user sindu dengan password 33420421
    create user 'Sindu' identified by '33420421';
    
    --memberikan hak akses
    grant all privileges on penjualan.* to Sindu identified by '33420421';
    
    flush privileges;
    --bila belum bisa buka phpmyadmin lalu buka database mysql, centang db, lalu repair table.
    
--5. buka komputer client dan jalankan XAMPP dan Mysql, lalu buka shell 
    mysql -u Sindu 192.168.43.154 -p
    
    show databases;
    
    use penjualan;
    
    select * from barang;
    
    insert into barang values
    ('20001', 'Folio', 200, 100);
    
    select * from barang;
