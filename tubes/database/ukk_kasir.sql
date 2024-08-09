-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2022 at 11:29 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

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
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pLoginDelete` (IN `a1` INT)  DELETE FROM tbl_login WHERE id_login = a1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pLoginTampil` ()  NO SQL
SELECT a.nama_pegawai, a.jabatan, b.id_login, b.username FROM tbl_pegawai a INNER JOIN tbl_login b ON a.id_pegawai = b.id_pegawai$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jenis_menu`
--

CREATE TABLE `tbl_jenis_menu` (
  `id_jenis_menu` int(11) NOT NULL,
  `jenis_menu` varchar(200) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jenis_menu`
--

INSERT INTO `tbl_jenis_menu` (`id_jenis_menu`, `jenis_menu`, `id_pegawai`) VALUES
(20, 'Minuman', 2),
(21, 'Paket 1', 2),
(24, 'Makanan', 2),
(25, 'paket hemat', 1);

--
-- Triggers `tbl_jenis_menu`
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
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id_log` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `aksi` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`id_log`, `id_pegawai`, `nama_pegawai`, `jabatan`, `aksi`, `date`) VALUES
(363, 1, 'Putri', 'Kasir', 'Jenis Menu - Menambah jenis menu : paket hemat', '2022-05-23 06:22:27'),
(364, 43, 'eldo', 'Manajer', 'Pegawai - Menambahkan   eldo', '2022-05-23 09:54:37'),
(365, 44, 'Eldo', 'Manajer', 'Pegawai - Menambahkan   eldo', '2022-05-23 09:57:17'),
(366, 45, 'Bagas', 'Admin', 'Pegawai - Menambahkan   Bagas', '2022-05-23 09:55:32'),
(367, 43, 'eldo', 'Manajer', 'Pegawai - Menghapus nama pegawai eldo', '2022-05-23 09:55:45'),
(368, 44, 'Eldo', 'Manajer', 'Pegawai - Merubah nama pegawai eldo menjadi Eldo', '2022-05-23 09:57:17'),
(369, 44, 'Eldo', 'Manajer', 'Login - Menambahkan username  eldo', '2022-05-23 09:57:17'),
(370, 45, 'Bagas', 'Admin', 'Login - Menambahkan username  bagas', '2022-05-23 09:57:17'),
(371, 5, 'Andy', 'Admin', 'Pegawai - Merubah nama pegawai Andy menjadi Eldo Bagas', '2022-05-24 00:28:15'),
(372, 2, 'Eldo Satrio', 'Manajer', 'Pegawai - Merubah nama pegawai Putra menjadi Eldo Satrio', '2022-05-24 09:22:16'),
(373, 1, 'Putri', 'Kasir', 'Pegawai - Merubah nama pegawai Putri menjadi Eldo B', '2022-05-24 00:29:47'),
(374, 6, '', '', 'Login - Menghapus username kasir1', '2022-05-24 00:34:18'),
(375, 6, '', '', 'Pegawai - Menghapus nama pegawai Cindy', '2022-05-24 00:34:18'),
(376, 46, 'Satrio', 'Kasir', 'Pegawai - Menambahkan   Satrio', '2022-05-24 06:44:05'),
(377, 46, 'Satrio', 'Kasir', 'Login - Menambahkan username  satrio', '2022-05-24 06:50:19'),
(378, 2, 'Eldo Satrio', 'Manajer', 'Nama Menu - Menambahkan nama menu : Teh Manis', '2022-05-24 09:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id_login` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id_login`, `id_pegawai`, `username`, `password`) VALUES
(28, 5, 'admin', 'admin'),
(33, 1, 'kasir', 'kasir'),
(63, 2, 'manajer', 'manajer'),
(64, 44, 'eldo', 'eldo'),
(65, 45, 'bagas', 'bagas'),
(66, 46, 'satrio', 'satrio');

--
-- Triggers `tbl_login`
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
-- Table structure for table `tbl_meja`
--

CREATE TABLE `tbl_meja` (
  `eldo_id_meja` int(11) NOT NULL,
  `eldo_no_meja` int(11) NOT NULL,
  `eldo_keterangan` varchar(50) NOT NULL,
  `eldo_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_meja`
--

INSERT INTO `tbl_meja` (`eldo_id_meja`, `eldo_no_meja`, `eldo_keterangan`, `eldo_status`) VALUES
(1, 1, '2 orang', 'Terisi'),
(3, 3, 'untuk 5 orang', 'Terisi');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(150) NOT NULL,
  `id_jenis_menu` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_menu`
--

INSERT INTO `tbl_menu` (`id_menu`, `nama_menu`, `id_jenis_menu`, `harga`, `id_pegawai`) VALUES
(18, 'Nasi Putih + Telor Dadar + Tempe + Tahu', 21, 17600, 2),
(21, 'Es Campur', 20, 10000, 2),
(23, 'w3', 24, 333, 2),
(24, 'Teh Manis', 20, 5000, 2);

--
-- Triggers `tbl_menu`
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
-- Table structure for table `tbl_pegawai`
--

CREATE TABLE `tbl_pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(100) NOT NULL,
  `jabatan` enum('Kasir','Manajer','Admin') NOT NULL,
  `photo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pegawai`
--

INSERT INTO `tbl_pegawai` (`id_pegawai`, `nama_pegawai`, `jenis_kelamin`, `alamat`, `telp`, `jabatan`, `photo`) VALUES
(1, 'Eldo B', 'Perempuan', 'Bandung  ', '088333333444', 'Kasir', ''),
(2, 'Eldo Satrio', 'Laki-laki', 'Jakarta  ', '088111444555', 'Manajer', ''),
(5, 'Eldo Bagas', 'Laki-laki', 'Bandung  ', '081444555333', 'Admin', ''),
(44, 'Eldo', 'Laki-laki', 'Jln. Moch Yamin ', '085603103490', 'Manajer', ''),
(45, 'Bagas', 'Laki-laki', 'Cimahi', '085603103491', 'Admin', NULL),
(46, 'Satrio', 'Laki-laki', 'cimahi', '085603103499', 'Kasir', NULL);

--
-- Triggers `tbl_pegawai`
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
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `tgl_transaksi`, `no_transaksi`, `id_pegawai`, `total_transaksi`, `no_meja`, `total_bayar`) VALUES
(199, '2022-03-31', '20220331000000199', 1, 10000, 1, 20000),
(200, '2022-05-23', '20220523000000200', 1, 37600, 44, 40000),
(201, '2022-05-23', '20220523000000201', 1, 52800, 1, 60000),
(202, '2022-05-23', '20220523000000202', 1, 55200, 1, 60000),
(203, '2022-05-23', '20220523000000203', 1, 20000, 3, 20000),
(205, '2022-05-23', '20220523000000205', 1, 30000, 1, 30000),
(206, '2022-05-23', '20220523000000206', 1, 40000, 2, 50000),
(207, '2022-05-24', '20220524000000207', 1, 17600, 2, 20000),
(208, '2022-05-24', '20220524000000208', 1, 10000, 1, 10000),
(209, '2022-05-24', '20220524000000209', 1, 10000, 4, 10000),
(210, '2022-05-24', '20220524000000210', 1, 20000, 2, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi_detail`
--

CREATE TABLE `tbl_transaksi_detail` (
  `id_detail` int(11) NOT NULL,
  `no_transaksi` varchar(100) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_transaksi_detail`
--

INSERT INTO `tbl_transaksi_detail` (`id_detail`, `no_transaksi`, `id_menu`, `qty`, `harga`) VALUES
(255, '20220331000000199', 21, 1, 10000),
(256, '20220523000000200', 18, 1, 17600),
(257, '20220523000000200', 21, 2, 10000),
(258, '20220523000000201', 18, 3, 17600),
(260, '20220523000000202', 18, 2, 17600),
(261, '20220523000000202', 21, 2, 10000),
(262, '20220523000000203', 21, 2, 10000),
(264, '20220523000000205', 21, 3, 10000),
(265, '20220523000000206', 21, 4, 10000),
(266, '20220524000000207', 18, 1, 17600),
(267, '20220524000000208', 21, 1, 10000),
(268, '20220524000000209', 21, 1, 10000),
(269, '20220524000000210', 21, 2, 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  ADD PRIMARY KEY (`id_jenis_menu`),
  ADD UNIQUE KEY `jenis_menu` (`jenis_menu`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id_login`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tbl_meja`
--
ALTER TABLE `tbl_meja`
  ADD PRIMARY KEY (`eldo_id_meja`);

--
-- Indexes for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_jenis_menu`
--
ALTER TABLE `tbl_jenis_menu`
  MODIFY `id_jenis_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=379;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `tbl_meja`
--
ALTER TABLE `tbl_meja`
  MODIFY `eldo_id_meja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tbl_pegawai`
--
ALTER TABLE `tbl_pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `tbl_transaksi_detail`
--
ALTER TABLE `tbl_transaksi_detail`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD CONSTRAINT `tbl_login_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tbl_pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
