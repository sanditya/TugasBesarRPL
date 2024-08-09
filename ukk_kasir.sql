-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Agu 2024 pada 20.37
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ukk_kasir`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pLoginDelete` (IN `a1` INT)   DELETE FROM tbl_login WHERE id_login = a1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pLoginTampil` ()  NO SQL SELECT a.nama_pegawai, a.jabatan, b.id_login, b.username FROM tbl_pegawai a INNER JOIN tbl_login b ON a.id_pegawai = b.id_pegawai$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jenis_menu`
--

CREATE TABLE `tbl_jenis_menu` (
  `id_jenis_menu` int(11) NOT NULL,
  `jenis_menu` varchar(200) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_jenis_menu`
--

INSERT INTO `tbl_jenis_menu` (`id_jenis_menu`, `jenis_menu`, `id_pegawai`) VALUES
(26, 'makanan', 51),
(27, 'minuman', 51);

--
-- Trigger `tbl_jenis_menu`
--
DELIMITER $$
CREATE TRIGGER `tJenisMenuHapus` BEFORE DELETE ON `tbl_jenis_menu` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, aksi) VALUES (old.id_pegawai, 'Belum Ada Pengguna', CONCAT('Jenis Menu - Menghapus jenis menu : ', old.jenis_menu))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tJenisMenuTambah` AFTER INSERT ON `tbl_jenis_menu` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, aksi) VALUES (new.id_pegawai, 'Belum Ada Pengguna', CONCAT('Jenis Menu - Menambah jenis menu : ', new.jenis_menu))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tJenisMenuUpdate` AFTER UPDATE ON `tbl_jenis_menu` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, aksi) VALUES (old.id_pegawai, 'Belum Ada Pengguna', CONCAT('Jenis Menu - Merubah jenis menu : ', old.jenis_menu, ' menjadi : ', new.jenis_menu))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id_log` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `aksi` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_log`
--

INSERT INTO `tbl_log` (`id_log`, `id_pegawai`, `nama_pegawai`, `jabatan`, `aksi`, `date`) VALUES
(429, 47, '', '', 'Nama Menu - Menambahkan nama menu : es campur', '2024-08-09 16:06:20'),
(430, 52, 'sanditya saputra', 'Pelayan', 'Nama Menu - Menambahkan nama menu : ayam bakar + nasi bakar', '2024-08-09 16:06:20'),
(431, 51, 'Rafi Eka Cahya Muhammad', 'Manajer', 'Jenis Menu - Merubah jenis menu : makanan menjadi : makanannnn', '2024-08-09 16:53:42'),
(432, 51, 'Rafi Eka Cahya Muhammad', 'Manajer', 'Nama Menu - Menambahkan nama menu : pop ice', '2024-08-09 16:53:42'),
(433, 54, 'ibay', 'Pelayan', 'Pegawai - Menambahkan   ibay', '2024-08-09 16:51:39'),
(434, 54, 'ibay', 'Pelayan', 'Login - Menambahkan username  ibay', '2024-08-09 16:53:42'),
(435, 51, 'Rafi Eka Cahya Muhammad', 'Manajer', 'Jenis Menu - Merubah jenis menu : makanannnn menjadi : makan', '2024-08-09 18:05:11'),
(436, 51, 'Rafi Eka Cahya Muhammad', 'Manajer', 'Jenis Menu - Merubah jenis menu : makan menjadi : makanan', '2024-08-09 18:05:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id_login` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_login`
--

INSERT INTO `tbl_login` (`id_login`, `id_pegawai`, `username`, `password`) VALUES
(71, 49, 'ragil', 'admin'),
(72, 51, 'rafi', 'manajer'),
(73, 53, 'nugraha', 'koki'),
(74, 52, 'sandi', 'pelayan'),
(75, 54, 'ibay', 'pelayan');

--
-- Trigger `tbl_login`
--
DELIMITER $$
CREATE TRIGGER `tLoginHapus` AFTER DELETE ON `tbl_login` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, aksi) VALUES (old.id_pegawai, 'Belum Ada Pengguna', CONCAT('Login - Menghapus username ',old.username))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tLoginTambah` AFTER INSERT ON `tbl_login` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai,aksi) VALUES (new.id_pegawai, 'Belum Ada Pengguna', CONCAT('Login - Menambahkan username  ',new.username))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tLoginUbah` AFTER UPDATE ON `tbl_login` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, aksi) VALUES (new.id_pegawai, 'Belum Ada Pengguna', CONCAT('Login - Merubah username ',old.username,' menjadi ',new.username))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_meja`
--

CREATE TABLE `tbl_meja` (
  `eldo_id_meja` int(11) NOT NULL,
  `eldo_no_meja` int(11) NOT NULL,
  `eldo_keterangan` varchar(50) NOT NULL,
  `eldo_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_meja`
--

INSERT INTO `tbl_meja` (`eldo_id_meja`, `eldo_no_meja`, `eldo_keterangan`, `eldo_status`) VALUES
(9, 2, 'untuk 3 orang', 'kosong'),
(10, 3, 'untuk 2 oranng', 'kosong'),
(12, 5, 'vip', 'kosong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `id_jenis_menu` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `nama_menu`, `id_jenis_menu`, `harga`, `id_pegawai`) VALUES
(27, 'es campur', 27, 20000, 47),
(28, 'ayam bakar + nasi bakar', 26, 25000, 52),
(29, 'pop ice', 27, 10000, 51);

--
-- Trigger `tbl_menu`
--
DELIMITER $$
CREATE TRIGGER `tMenuHapus` BEFORE DELETE ON `tbl_menu` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, aksi) VALUES (old.id_pegawai, 'Belum Ada Pengguna', CONCAT('Nama Menu - Menghpaus nama menu : ', old.nama_menu))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tMenuTambah` BEFORE INSERT ON `tbl_menu` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, aksi) VALUES (new.id_pegawai, 'Belum Ada Pengguna', CONCAT('Nama Menu - Menambahkan nama menu : ', new.nama_menu))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tMenuUpdate` BEFORE UPDATE ON `tbl_menu` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, aksi) VALUES (old.id_pegawai, 'Belum Ada Pengguna', CONCAT('Nama Menu - Merubah nama menu : ', old.nama_menu, ' menjadi : ', new.nama_menu))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(100) NOT NULL,
  `jabatan` enum('Kasir','Manajer','Admin','Pelayan','Koki') NOT NULL,
  `photo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`id_pegawai`, `nama_pegawai`, `jenis_kelamin`, `alamat`, `telp`, `jabatan`, `photo`) VALUES
(49, 'ragil', 'Laki-laki', 'ciwastra', '08818818681', 'Admin', NULL),
(51, 'Rafi Eka Cahya Muhammad', 'Laki-laki', 'Batujajar', '08818828992', 'Manajer', NULL),
(52, 'sanditya saputra', 'Laki-laki', 'Pondok Ciptamas 2', '08810230211992', 'Pelayan', NULL),
(53, 'Ragil Nugraha', 'Laki-laki', 'Ciwastra', '088783838223', 'Koki', NULL),
(54, 'ibay', 'Perempuan', 'ciptamas', '0888366872', 'Pelayan', NULL);

--
-- Trigger `tbl_pegawai`
--
DELIMITER $$
CREATE TRIGGER `tPegawaiHapus` BEFORE DELETE ON `tbl_pegawai` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, old.nama_pegawai, old.jabatan, CONCAT('Pegawai - Menghapus nama pegawai ',old.nama_pegawai))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tPegawaiTambah` AFTER INSERT ON `tbl_pegawai` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, jabatan, aksi) VALUES (new.id_pegawai, new.nama_pegawai, new.jabatan, CONCAT('Pegawai - Menambahkan   ',new.nama_pegawai))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tPegawaiUbah` BEFORE UPDATE ON `tbl_pegawai` FOR EACH ROW INSERT INTO tbl_log (id_pegawai, nama_pegawai, jabatan, aksi) VALUES (old.id_pegawai, old.nama_pegawai, old.jabatan, CONCAT('Pegawai - Merubah nama pegawai ',old.nama_pegawai,' menjadi ',new.nama_pegawai))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `tgl_transaksi`, `no_transaksi`, `id_pegawai`, `total_transaksi`, `no_meja`, `total_bayar`) VALUES
(244, '2024-08-09', '20240809000000244', 52, 40000, 1, 50000),
(245, '2024-08-09', '20240809000000245', 52, 40000, 2, 50000),
(246, '2024-08-09', '20240809000000246', 52, 50000, 2, 100000),
(247, '2024-08-09', '20240809000000247', 54, 20000, 1, 20000),
(248, '2024-08-09', '20240809000000248', 52, 50000, 1, 0),
(249, '2024-08-09', '20240809000000249', 52, 50000, 2, 0),
(250, '2024-08-10', '20240810000000250', 52, 50000, 2, 0),
(251, '2024-08-10', '20240810000000251', 52, 100000, 2, 0),
(252, '2024-08-10', '20240810000000252', 52, 50000, 1, 0),
(253, '2024-08-10', '20240810000000253', 52, 65000, 1, 0),
(254, '2024-08-10', '20240810000000254', 52, 50000, 2, 0),
(255, '2024-08-10', '20240810000000255', 52, 65000, 1, 100000),
(256, '2024-08-10', '20240810000000256', 52, 40000, 2, 50000),
(257, '2024-08-10', '20240810000000257', 52, 40000, 2, 50000),
(258, '2024-08-10', '20240810000000258', 52, 40000, 2, 50000),
(259, '2024-08-10', '20240810000000259', 52, 40000, 2, 50000),
(260, '2024-08-10', '20240810000000260', 52, 20000, 2, 50000),
(261, '2024-08-10', '20240810000000261', 52, 50000, 2, 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi_detail`
--

CREATE TABLE `tbl_transaksi_detail` (
  `id_detail` int(11) NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `catatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_transaksi_detail`
--

INSERT INTO `tbl_transaksi_detail` (`id_detail`, `no_transaksi`, `id_menu`, `qty`, `harga`, `catatan`) VALUES
(299, '20240809000000244', 27, 2, 20000, 'DINGIN'),
(300, '20240809000000245', 27, 2, 20000, 'DINGIN'),
(301, '20240809000000246', 28, 2, 25000, 'pedaassss'),
(302, '20240809000000247', 29, 2, 10000, 'dingin'),
(303, '20240809000000248', 28, 2, 25000, 'sangat pedas'),
(305, '20240809000000249', 28, 2, 25000, 'sca'),
(306, '20240810000000250', 28, 2, 25000, 'da'),
(307, '20240810000000251', 28, 2, 25000, 'dad'),
(308, '20240810000000251', 28, 2, 25000, 's,dsd'),
(309, '20240810000000252', 28, 2, 25000, 'sds'),
(310, '20240810000000253', 28, 1, 25000, 'dsd'),
(311, '20240810000000253', 27, 2, 20000, 'd,sds,dsd'),
(312, '20240810000000254', 28, 2, 25000, 'sad,asd'),
(313, '20240810000000255', 28, 1, 25000, 's,asa'),
(314, '20240810000000255', 27, 2, 20000, 'ped,asd'),
(315, '20240810000000256', 27, 2, 20000, 'din,gin'),
(317, '20240810000000257', 27, 2, 20000, 'din,gin'),
(319, '20240810000000258', 27, 2, 20000, 'dingin'),
(321, '20240810000000259', 27, 2, 20000, 'es sedikit'),
(322, '20240810000000260', 29, 2, 10000, 'sedikit es'),
(323, '20240810000000261', 28, 2, 25000, 'pedas');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  ADD PRIMARY KEY (`id_jenis_menu`),
  ADD UNIQUE KEY `jenis_menu` (`jenis_menu`);

--
-- Indeks untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `tbl_meja`
--
ALTER TABLE `tbl_meja`
  ADD PRIMARY KEY (`eldo_id_meja`);

--
-- Indeks untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  MODIFY `id_jenis_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `tbl_meja`
--
ALTER TABLE `tbl_meja`
  MODIFY `eldo_id_meja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tbl_pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
