-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Mar 2020 pada 16.24
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sr`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id` int(11) NOT NULL,
  `id_pesanan` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id`, `id_pesanan`, `id_menu`, `jumlah`) VALUES
(16, 7, 1, 6),
(17, 7, 2, 7),
(18, 7, 3, 3),
(19, 9, 1, 5),
(20, 9, 3, 3),
(21, 9, 5, 3),
(22, 10, 3, 5),
(23, 10, 8, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `username`, `password`, `no_hp`, `role_id`) VALUES
(1, 'abiyoso', 'abi', 'abi123', '0812312312', 2),
(2, 'budiman', 'budi', 'budi123', '0887123813', 2),
(3, 'jomito', 'jon', 'jon123', '0895123121', 2),
(4, 'fulansyah', 'fulan', 'fulan123', '0812310293i', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'Ayam'),
(2, 'Ikan'),
(3, 'Minuman'),
(4, 'Paket');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_menu` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `id_kategori`, `nama_menu`, `harga`, `deskripsi`, `foto`) VALUES
(1, 1, 'Ayam Bakar', 8000, 'Ayam Bakar enak', 'ay_bakar.jpg'),
(2, 1, 'Ayam Goreng', 7000, 'Ayam Goreng Asik', 'ay_goreng.jpg'),
(3, 1, 'Ayam Opor', 10000, 'Ayam Opor Gembira', 'ay_opor.jpg'),
(4, 1, 'Ayam Geprek', 11000, 'Ayam Geprek Mantab', 'ay_geprek.jpg'),
(5, 2, 'Ikan Bakar', 12000, 'Ikan Bakar Gubrak', 'ik_bakar.jpg'),
(6, 2, 'Ikan Goreng', 12000, 'Ikan Bakar Duar', 'ik_goreng.jpg'),
(7, 3, 'Es teh manis', 4000, 'Es teh manis segerr', 'es_teh_manis.jpg'),
(8, 3, 'Teh Tarik', 5000, 'Teh Tarik juss', 'teh_tarik.jpg'),
(9, 3, 'Es Kelapa', 8000, 'Es Kelapa Muda segar', 'es_kelapa.jpg'),
(10, 1, 'tester', 22000, 'ini tester', 'ay_bakar.jpg'),
(11, 1, 'tester 2', 21000, 'ini tester 2', 'ay_goreng.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `atas_nama` varchar(100) NOT NULL,
  `jumlah_pesanan` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `id_status2` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `server` int(11) NOT NULL,
  `kasir` int(11) NOT NULL,
  `note` varchar(265) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id`, `atas_nama`, `jumlah_pesanan`, `total_harga`, `id_status`, `id_status2`, `tanggal`, `server`, `kasir`, `note`) VALUES
(7, 'annas', 3, 127000, 3, 3, '2020-03-01 02:19:00', 1, 2, ''),
(9, 'jimmy', 3, 106000, 3, 3, '2020-03-06 13:00:00', 1, 2, 'pedas semua ya'),
(10, 'kokom', 2, 80000, 2, 10, '2020-03-02 03:15:00', 1, 1, ''),
(11, '', 0, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `simbol` varchar(50) NOT NULL,
  `class` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `status`
--

INSERT INTO `status` (`id`, `keterangan`, `simbol`, `class`) VALUES
(1, 'menunggu server', 'fas fa-fw fa-stop', 'btn btn-danger btn-circle'),
(2, 'belum bayar', 'fas fa-fw fa-times', 'btn btn-warning btn-circle'),
(3, 'dibayar', 'fas fa-fw fa-check', 'btn btn-success btn-circle');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status2`
--

CREATE TABLE `status2` (
  `id` int(11) NOT NULL,
  `ket` varchar(20) NOT NULL,
  `simbol2` varchar(30) NOT NULL,
  `class2` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `status2`
--

INSERT INTO `status2` (`id`, `ket`, `simbol2`, `class2`) VALUES
(1, 'menunggu', 'fas fa-fw fa-pause', 'btn btn-danger btn-circle'),
(2, 'dimasak', 'fas fa-fw fa-temperature-high', 'btn btn-warning btn-circle'),
(3, 'selesai', 'fas fa-fw fa-thumbs-up', 'btn btn-success btn-circle');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `phone_number` varchar(13) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL,
  `photo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone_number`, `gender`, `role_id`, `is_active`, `date_created`, `photo`) VALUES
(5, 'Rafi Annas', 'rafi@gmail.com', '$2y$10$VGbPhIWiZpgu/lhN3iKl5eYK/v3YndFGKPwgWTXQS4RM7GBwNtAPG', '123123', 'male', 2, 1, 1556019904, ''),
(6, 'annas', 'annas@gmail.com', '$2y$10$dymXqyKlVj/nTbcJaq60WuIkcJhlCOLMfMccR.FtDY.6JHLHFQ9Gi', '654654', 'male', 1, 1, 1557561364, 'ktm1.jpg'),
(7, 'aa', 'aa@gmail.com', '$2y$10$Fvv.FJL2Ka/M0.OtDyPNNe4toiHVCtyAPWlyROpxeh.BNppptCN0q', '654654654', '', 2, 1, 1557891004, 'tujuan.jpg'),
(9, 'fadli', 'fadli@gmail.com', '$2y$10$m1DZQeuX5rRL.6SNO2b5I.Z5drdSHTfm6EaBKsoUDJlTWXKBDBcke', '6546546546', 'male', 2, 1, 1557891004, ''),
(10, 'test_user', 'b@gmail.com', '$2y$10$L9LXFAknXpxX6FXeMPFLxeYmf1K7/8L31jZ2d4lT3c2Lx3rJwBozm', '1231313', 'male', 2, 1, 1558172354, 'ktm.jpg'),
(11, 'daffa', 'daffa@gmail.com', '$2y$10$y.M4StlZc/hI61EeyZT1XuFXDRkCCEUk9IpjRHiTCKtgPgBweTIn6', '0812312038', 'male', 2, 1, 1558500052, ''),
(12, 'lukman', 'lukman@gmail.com', '$2y$10$KQVFnmX9eFG3IdwFJDgMReLq8j/z8ashg1ZtTp1vPiN8JKUfhNdb.', '103910239', 'male', 2, 1, 1558505085, ''),
(13, 'jelita', 'jelita@gmail.com', '$2y$10$OIVQR1vn7FhoXrupDUNjCuX1UiSLv5F5FhD816VI4.ZsbY.edZGCG', '0981039138', 'female', 2, 1, 1558597973, 'rafi1.JPG'),
(15, 'wewe', 'wewe@gmail.com', '$2y$10$S0POYkLQ63XBIbGBUpPiJu1270w.6rdUf74lQTe8r5j3GyQ.8j10a', '1231231', 'male', 2, 1, 1558668096, 'default1.png'),
(16, 'Devin', 'opi@gmail.com', '$2y$10$cAMeQPtMA/UpCPSdGhLd.urBJlr0HToI8C8wtTnN32aDkVSr0AyYm', '0810320823', 'female', 2, 1, 1558768659, 'rafi2.JPG'),
(17, 'drdr', 'fafdadad@gmadg.com', '$2y$10$qNsN5zsvCmsWRQHSVpAlvuKnhu0vg6ixGCgeMOXwarqiSA3rVlbaW', '223131', 'male', 2, 1, 1558775619, 'IMG_1232.PNG'),
(18, 'hilya', 'hilya@gmail.com', '$2y$10$4G.6NYm/UKu.ie69HXVca.TxE/I6OLRhCrj5.JKbHMqJHBX8Ys4aa', '08123123', 'male', 2, 1, 1560932702, 'default.png'),
(19, 'lolo', 'lolo@mgail.com', '$2y$10$jSg7kqSrb7RitgF/15FYwOQFZoj2d/YdSYXw4C/mi0ark8lsEoUmi', '123123124', 'male', 2, 1, 1561432110, 'default.png'),
(20, 'js,a', 'ddd@gmail.com', '$2y$10$H87xNBWLbH1CQRO63mWMA.UiQRsP01LZvE7xXiPZgKKgFMuuM1FSK', '0987654321', '', 2, 1, 1562641780, 'alfamana.jpg'),
(21, 'rafi', 'rafi@if.uai.ac.id', '$2y$10$h1OvmBpR.wMpRHisbc32GeqYl07eT9QSUr3aGfwsKBq1IVNL1BaBS', '083899633861', '', 1, 1, 1562646068, 'default.png'),
(22, 'gugu', 'gugu@gmail.com', '$2y$10$jOT3/X9wqgDhznHct5u0kuIp3zIaAB5z.bXod2oq1p4IPCxnQP9MS', '089812309183', '', 2, 0, 1562726676, 'default.png'),
(23, 'fian', 'fian@gmmail.com', '$2y$10$espy.LbR64c3FEzTiCc8iutCaG3iv36WbEICygegDAJ1q4OQKXx2i', '0879846545', '', 2, 1, 1562800824, 'default.png'),
(25, 'Satrio', 'satrio@gmail.com', '$2y$10$rzUabH4.Ahp6VU.KskC0u./TLpSb/7/pKf930B4CoFZ9ZV05Pw8zy', '0818989281', '', 2, 1, 1562916421, 'default.png'),
(26, 'opi', 'dyah@gmail.com', '$2y$10$eRuVN0tjKpiToaio9S7TruLZIQ6WgSVhQuWpIOy5YI1lP.QJt4VK2', '0811231231', '', 2, 1, 1562932858, 'batik.PNG'),
(27, 'malia@gmail.com', 'malia@gmail.com', '$2y$10$jAhGSuanDTb6q4RzeU/X7.o1bJL/k6d0whtSAdL6adXHs4lswlRIq', '08132012', '', 2, 1, 1562987054, 'glowing18.PNG'),
(28, 'rizka', 'rizka@gmail.com', '$2y$10$N4jryAgCGiOlfcvm4/sihOGZ3RHMHtUVuyi34.3Z2QK1RqyzuMXoG', '081923889', '', 2, 1, 1562987101, 'bukber.PNG'),
(29, 'padila', 'padila@gmail.com', '$2y$10$Y8mKpb/MSIZXTBmq0am4x.OLyt/kzcQod2oY5qFZa9Sg7X0cuS17W', '08781927381', '', 2, 1, 1562987155, 'batik1.PNG'),
(30, 'Ibu Endang', 'endang@gmail.com', '$2y$10$Ab25tiPAe2I2NgG8JOo9Hed8ABbXiFOqWRN/lVzH3GFZJD.kpW9Gm', '08129871987', '', 2, 1, 1562996434, 'default.png'),
(31, 'rtyui', 'asd@asd.asd', '$2y$10$5JrRyDDi3L1uTj7NOyK0butuK..w8sxi4.sJn.vU5QcwhaZPAx9ha', '876876876', '', 2, 1, 1564286069, 'default.png'),
(32, 'ujang', 'ujang@gmail.com', '$2y$10$TGqEkCM6q7gtJ.X.30Q9KOLLF4K3eqgtKV3evmocYEtQ0U6VB.SJy', '087565654545', '', 2, 1, 1564880988, 'default.png'),
(33, 'ffff', 'ff@ff.ff', '$2y$10$xpb3mUYe3OKOXqkIbMlPhefIWFKb5c7r6NcxoMr8E.5HVk5Wvu9qq', '13123', '', 1, 1, 1567069211, 'default.png'),
(34, 'oo', 'o@o.o', '$2y$10$ykqOhPfSyAmy3t4WD1LL9.zTFOHaN6rJlEdKivg8CoGXLr0enPxue', '2123123', '', 1, 1, 1567356805, 'default.png'),
(35, 'lo', 'lo@lo.com', '$2y$10$FlspusKw0mSarR9x.2Q6DOBGzCG914BJHJkmpYp93enge.qR649MK', '12312312', '', 1, 1, 1569049316, 'default.png'),
(36, 'Anans', 'asdads.a@asd.asd', '$2y$10$bg.pBWTDwVVsi1./4iq9Uu2UoqArxALjr9V/skshYa/hJfAWnOppC', '12312312321', '', 2, 1, 1576316201, 'default.png'),
(37, 'qweqweqw', 'rafi.annas@if.uai.ac.id', '$2y$10$XfGKNnamOWfWfwoRE1XIpevJQKfsUOgR.Tmg5mSV7VlMEV0JDf4Ja', '12311231', '', 2, 1, 1576316343, 'default.png'),
(38, 'rrq', 'rrq@a.a', '$2y$10$eS5.RJDP.Vv0LKAv4h1ldedYVrCEAjdW8Q.ht2CC1AvTp1C7SWc0G', '123123', '', 1, 1, 1577441422, 'default.png'),
(39, 'aaa', 'aaa@a.a', '$2y$10$1WTFVFZcJsJGdWn0H/xc5.ClhnWSQbVIx6hgnosg8NOKcqL5lR0SG', '123123213', '', 2, 1, 1577632489, 'default.png'),
(40, 'angg', 'aa@aa.aa', 'asdoaisd', '09870918', 'L', 1, 1, 2109132, 'asd.png'),
(41, 'jjojo', 'oasd@a.a', '0123098', '12098', 'L', 1, 1, 10298, 'pm.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 1, 3),
(5, 1, 4),
(6, 2, 4),
(7, 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'Server'),
(3, 'Dapur'),
(4, 'Kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin'),
(2, 'Server'),
(3, 'Dapur'),
(4, 'Kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(7, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(10, 4, 'Search', 'shopping', 'fas fa-shopping-cart', 1),
(11, 2, 'Change Password', 'user/c_pass', 'fas fa-fw fa-key', 1),
(12, 1, 'Vendor', 'admin/vendor', 'fas fa-fw fa-store', 1),
(16, 4, 'Basket', 'shopping/basket', 'fas fa-shopping-bag', 1),
(18, 1, 'List Admin', 'admin/list_admin', 'fas fa-fw fa-user-graduate', 1),
(19, 1, 'List User', 'admin/list_user', 'fas fa-fw fa-user-friends', 1),
(20, 5, 'Transaction', 'download/tr', 'fas fa-money-bill-wave-alt', 1),
(21, 1, 'List Kurir', 'admin/list_kurir', 'fas fa-motorcycle', 1),
(22, 1, 'Report', 'admin/report', 'fas fa-fw fa-file-alt', 1),
(23, 1, 'Best Item', 'admin/report2', 'fas fa-fw fa-file-alt', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `status2`
--
ALTER TABLE `status2`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `status2`
--
ALTER TABLE `status2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
