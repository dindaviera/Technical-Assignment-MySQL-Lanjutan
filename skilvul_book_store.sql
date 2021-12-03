-- cretae database -- 
MySQL [(none)]> use skilvulbookstore;
MySQL [(none)]> use skilvulbookstore;
Database changed

-- Buat table penerbit --
MySQL [skilvulbookstore]> create table penerbit (
    -> id int auto_increment not null primary key,
    -> nama varchar(50),
    -> kota varchar(50)
    -> );
Query OK, 0 rows affected (0.105 sec)

-- Buat table penulis --
MySQL [skilvulbookstore]> create table penulis (
    -> id int(10) auto_increment not null primary key,
    -> nama varchar(50),
    -> kota varchar(50)
    -> );
Query OK, 0 rows affected, 1 warning (0.025 sec)

-- Buat tabel buku dengan relasi dua tabel yang sudah ada --
MySQL [skilvulbookstore]> create table buku (
    -> id int(10) auto_increment not null primary key,
    -> ISBN varchar(50),
    -> judul varchar(50),
    -> harga int(10),
    -> stock int(10),
    -> id_penulis int not null,
    -> id_penerbit int not null,
    -> constraint fk_buku_penulis_id foreign key(id) references penulis(id),
    -> constraint fk_buku_penerbit_id foreign key(id) references penerbit(id)
    -> );
Query OK, 0 rows affected, 3 warnings (0.036 sec)

-- Lakukan INNER JOIN dari table buku terhadap table penerbit --
select * from buku inner join penerbit on buku.id_penerbit = penerbit.id;
+----+---------+----------------------------------------+-------+-------+------------+-------------+----+-------------------+-----------------+
| id | ISBN    | judul                                  | harga | stock | id_penulis | id_penerbit | id | nama              | kota            |
+----+---------+----------------------------------------+-------+-------+------------+-------------+----+-------------------+-----------------+
|  1 | ABCD123 | Summer in Seoul                        | 70000 |    20 |          1 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|  2 | EFGH456 | Laskar Pelangi                         | 75000 |    30 |          2 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|  6 | STU1415 | Pulang                                 | 80000 |    15 |          3 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|  7 | VWX1617 | In a Blue Moon                         | 70000 |     5 |          1 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|  8 | YZA1819 | Pergi                                  | 75000 |    10 |          3 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
| 10 | EFG122  | Sang Pemimpi                           | 80000 |    15 |          2 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|  3 | IJK890  | Story of Kimbab Family                 | 65000 |    20 |          6 |           2 |  2 | Mizan             | Jogja           |
|  5 | OPQ1213 | Happy Little Soul                      | 75000 |    20 |          5 |           2 |  2 | Mizan             | Jogja           |
|  4 | LMN1011 | Eclair                                 | 60000 |    15 |          4 |           3 |  3 | Gagas Media       | Jakarta Selatan |
|  9 | BCD112  | Kastil es dan air mancur yang berdansa | 55000 |    10 |          4 |           3 |  3 | Gagas Media       | Jakarta Selatan |
+----+---------+----------------------------------------+-------+-------+------------+-------------+----+-------------------+-----------------+
10 rows in set (0.024 sec)

MySQL [skilvulbookstore]> select buku.*, penerbit.nama from buku inner join penerbit on buku.id_penerbit = penerbit.id;
+----+---------+----------------------------------------+-------+-------+------------+-------------+-------------------+
| id | ISBN    | judul                                  | harga | stock | id_penulis | id_penerbit | nama              |
+----+---------+----------------------------------------+-------+-------+------------+-------------+-------------------+
|  1 | ABCD123 | Summer in Seoul                        | 70000 |    20 |          1 |           1 | Gramedia Pustaka
 |
|  2 | EFGH456 | Laskar Pelangi                         | 75000 |    30 |          2 |           1 | Gramedia Pustaka
 |
|  6 | STU1415 | Pulang                                 | 80000 |    15 |          3 |           1 | Gramedia Pustaka
 |
|  7 | VWX1617 | In a Blue Moon                         | 70000 |     5 |          1 |           1 | Gramedia Pustaka
 |
|  8 | YZA1819 | Pergi                                  | 75000 |    10 |          3 |           1 | Gramedia Pustaka
 |
| 10 | EFG122  | Sang Pemimpi                           | 80000 |    15 |          2 |           1 | Gramedia Pustaka
 |
|  3 | IJK890  | Story of Kimbab Family                 | 65000 |    20 |          6 |           2 | Mizan             |
|  5 | OPQ1213 | Happy Little Soul                      | 75000 |    20 |          5 |           2 | Mizan             |
|  4 | LMN1011 | Eclair                                 | 60000 |    15 |          4 |           3 | Gagas Media       |
|  9 | BCD112  | Kastil es dan air mancur yang berdansa | 55000 |    10 |          4 |           3 | Gagas Media       |
+----+---------+----------------------------------------+-------+-------+------------+-------------+-------------------+
10 rows in set (0.008 sec)

-- Lakukan LEFT JOIN dari table buku terhadap table penerbit --
 select * from buku left join penerbit on buku.id_penerbit = penerbit.id;
 +----+---------+----------------------------------------+-------+-------+------------+-------------+------+-------------------+-----------------+
| id | ISBN    | judul                                  | harga | stock | id_penulis | id_penerbit | id   | nama              | kota            |
+----+---------+----------------------------------------+-------+-------+------------+-------------+------+-------------------+-----------------+
|  1 | ABCD123 | Summer in Seoul                        | 70000 |    20 |          1 |           1 |    1 | Gramedia Pustaka
 | Jakarta         |
|  2 | EFGH456 | Laskar Pelangi                         | 75000 |    30 |          2 |           1 |    1 | Gramedia Pustaka
 | Jakarta         |
|  3 | IJK890  | Story of Kimbab Family                 | 65000 |    20 |          6 |           2 |    2 | Mizan             | Jogja           |
|  4 | LMN1011 | Eclair                                 | 60000 |    15 |          4 |           3 |    3 | Gagas Media       | Jakarta Selatan |
|  5 | OPQ1213 | Happy Little Soul                      | 75000 |    20 |          5 |           2 |    2 | Mizan             | Jogja           |
|  6 | STU1415 | Pulang                                 | 80000 |    15 |          3 |           1 |    1 | Gramedia Pustaka
 | Jakarta         |
|  7 | VWX1617 | In a Blue Moon                         | 70000 |     5 |          1 |           1 |    1 | Gramedia Pustaka
 | Jakarta         |
|  8 | YZA1819 | Pergi                                  | 75000 |    10 |          3 |           1 |    1 | Gramedia Pustaka
 | Jakarta         |
|  9 | BCD112  | Kastil es dan air mancur yang berdansa | 55000 |    10 |          4 |           3 |    3 | Gagas Media       | Jakarta Selatan |
| 10 | EFG122  | Sang Pemimpi                           | 80000 |    15 |          2 |           1 |    1 | Gramedia Pustaka
 | Jakarta         |
+----+---------+----------------------------------------+-------+-------+------------+-------------+------+-------------------+-----------------+
10 rows in set (0.010 sec)

-- Lakukan RIGHT JOIN dari table buku terhadap table penerbit --
MySQL [skilvulbookstore]> select * from buku right join penerbit on buku.id_penerbit = penerbit.id;
+------+---------+----------------------------------------+-------+-------+------------+-------------+----+-------------------+-----------------+
| id   | ISBN    | judul                                  | harga | stock | id_penulis | id_penerbit | id | nama              | kota            |
+------+---------+----------------------------------------+-------+-------+------------+-------------+----+-------------------+-----------------+
|    1 | ABCD123 | Summer in Seoul                        | 70000 |    20 |          1 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|    2 | EFGH456 | Laskar Pelangi                         | 75000 |    30 |          2 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|    6 | STU1415 | Pulang                                 | 80000 |    15 |          3 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|    7 | VWX1617 | In a Blue Moon                         | 70000 |     5 |          1 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|    8 | YZA1819 | Pergi                                  | 75000 |    10 |          3 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|   10 | EFG122  | Sang Pemimpi                           | 80000 |    15 |          2 |           1 |  1 | Gramedia Pustaka
 | Jakarta         |
|    3 | IJK890  | Story of Kimbab Family                 | 65000 |    20 |          6 |           2 |  2 | Mizan             | Jogja           |
|    5 | OPQ1213 | Happy Little Soul                      | 75000 |    20 |          5 |           2 |  2 | Mizan             | Jogja           |
|    4 | LMN1011 | Eclair                                 | 60000 |    15 |          4 |           3 |  3 | Gagas Media       | Jakarta Selatan |
|    9 | BCD112  | Kastil es dan air mancur yang berdansa | 55000 |    10 |          4 |           3 |  3 | Gagas Media       | Jakarta Selatan |
+------+---------+----------------------------------------+-------+-------+------------+-------------+----+-------------------+-----------------+
10 rows in set (0.004 sec)

-- Cek nilai MAX dari column harga pada table book yang memiliki jumlah stok buku di bawah 10 --
MySQL [skilvulbookstore]> select max(harga) from buku where stock < 10;
+------------+
| max(harga) |
+------------+
|      70000 |
+------------+
1 row in set (0.004 sec

-- Cek nilai MIN dari column harga pada table book --
MySQL [skilvulbookstore]> select min(harga) from buku;
+------------+
| min(harga) |
+------------+
|      55000 |
+------------+
1 row in set (0.001 sec)

-- Gunakan COUNT untuk melihat list data dengan kondisi harga buku di bawah 100000 --
SELECT COUNT(harga) FROM buku WHERE harga < 100000;
+--------------+
| COUNT(harga) |
+--------------+
|           10 |
+--------------+
1 row in set (0.000 sec)