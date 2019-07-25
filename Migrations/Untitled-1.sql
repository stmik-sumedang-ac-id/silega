-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 21 Apr 2017 pada 13.26
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ftsl_legalisir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `histori_pengajuan`
--

CREATE TABLE `histori_pengajuan` (
  `id_histori` int(11) NOT NULL,
  `id_pengajuan` int(5) NOT NULL DEFAULT '0',
  `waktu_perubahan` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `by` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `idjurusan` int(10) UNSIGNED NOT NULL,
  `nama_jurusan` varchar(255) COLLATE utf8_bin NOT NULL,
  `kode_jurusan` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `seq` int(10) UNSIGNED DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`idjurusan`, `nama_jurusan`, `kode_jurusan`, `seq`, `deleted`) VALUES
(12, 'S1 Sarjana Biologi', NULL, 1, 0),
(13, 'S1 Sarjana Mikrobiologi', NULL, 2, 0),
(14, 'S1 Sarjana Rekayasa Hayati', NULL, 3, 0),
(15, 'S1 Sarjana Rekayasa Pertanian', NULL, 4, 0),
(16, 'S1 Sarjana Rekayasa Kehutanan', NULL, 5, 0),
(17, 'S1 Sarjana Teknologi Pasca Panen', NULL, 6, 0),
(18, 'S2 Magister Biologi', NULL, 7, 0),
(19, 'S2 Magister Biomanajemen', NULL, 8, 0),
(20, 'S2 Magister Bioteknologi', NULL, 9, 0),
(21, 'S3 Doktor Biologi', NULL, 10, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` int(11) NOT NULL,
  `nama_layanan` varchar(255) COLLATE utf8_bin NOT NULL,
  `deskripsi` text COLLATE utf8_bin NOT NULL,
  `biaya` int(11) NOT NULL,
  `min_qty` int(3) NOT NULL,
  `max_qty` int(3) NOT NULL,
  `aktif` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `deleted` char(1) COLLATE utf8_bin DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`id_layanan`, `nama_layanan`, `deskripsi`, `biaya`, `min_qty`, `max_qty`, `aktif`, `deleted`) VALUES
(1, 'Legalisasi ijazah bahasa Indonesia', '', 5000, 1, 0, '1', '0'),
(2, 'Legalisasi ijazah bahasa Inggris', '', 7000, 1, 0, '1', '0'),
(3, 'Transkrip akademik bahasa Indonesia', '', 5000, 1, 1, '1', '0'),
(4, 'Transkrip akademik bahasa Inggris', 'Biaya translasi', 100000, 1, 1, '1', '0'),
(5, 'Terjemahan ijazah bahasa Inggris', '', 100000, 1, 1, '1', '0'),
(6, 'Legalisasi transkrip akademik bahasa Indonesia', '', 5000, 1, 0, '1', '0'),
(7, 'Legalisasi transkrip akademik bahasa Inggris', '', 5000, 1, 0, '1', '0'),
(8, 'Legalisasi ijazah sarmud/ keterangan lain', '', 5000, 1, 0, '1', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `no_ijazah` varchar(100) COLLATE utf8_bin NOT NULL,
  `nim` varchar(20) COLLATE utf8_bin NOT NULL,
  `nama` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `angkatan` varchar(4) COLLATE utf8_bin DEFAULT NULL,
  `ttl` date DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prodi` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status_verifikasi` int(4) DEFAULT NULL COMMENT '1:verified;0:to-verified;2:not-verified;',
  `waktu_verifikasi` datetime DEFAULT NULL,
  `user_verifikasi` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`no_ijazah`, `nim`, `nama`, `angkatan`, `ttl`, `email`, `prodi`, `created_at`, `status_verifikasi`, `waktu_verifikasi`, `user_verifikasi`, `password`, `last_login`) VALUES
('FTSL-666', '1020666', 'Muhammad Rizaldi', '1999', '1999-06-30', 'mrizaldi2@gmail.com', 'S1 Teknik Sipil', '2017-04-19 12:49:56', 1, '2017-04-19 13:12:04', 'admin', 'pass123', '2017-04-19 14:15:58'),
('FTSL-667', '1020667', 'Muhammad Rizaldi', '1999', '1999-06-30', 'mrizaldi22@gmail.com', 'S1 Teknik Sipil', '2017-04-19 12:51:24', 1, '2017-04-19 13:12:04', 'admin', 'pass123', '2017-04-19 17:46:13'),
('FTSL-0300', '10300', 'Muhammad Rizaldi', NULL, NULL, NULL, 'S1 Teknik Sipil', '2017-04-19 13:07:29', 1, '2017-04-20 14:49:44', 'admin', '10300', '2017-04-21 13:58:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa_dokumen`
--

CREATE TABLE `mahasiswa_dokumen` (
  `no_ijazah` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_layanan` int(11) NOT NULL,
  `ukuran` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ext` char(10) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `mahasiswa_dokumen`
--

INSERT INTO `mahasiswa_dokumen` (`no_ijazah`, `id_layanan`, `ukuran`, `ext`, `created_at`) VALUES
('182067/K01/PP/VII/IJZ/1/2006', 1, '643.74', '.pdf', '2013-12-07 23:39:46'),
('182067/K01/PP/VII/IJZ/1/2006', 2, '1083.29', '.pdf', '2013-12-07 23:43:13'),
('182067/K01/PP/VII/IJZ/1/2006', 3, '561.57', '.jpg', '2013-12-07 23:40:03'),
('FTSL-15007068', 1, '237.31', '.pdf', '2013-12-08 00:07:38'),
('FTSL-15007068', 2, '512.48', '.pdf', '2013-12-08 00:07:51'),
('FTSL-15007068', 3, '733.05', '.pdf', '2013-12-08 00:08:19'),
('FTSL-667', 1, '451.14', '.jpg', '2017-04-19 13:08:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_bayar` int(10) NOT NULL,
  `id_pengajuan` int(10) DEFAULT NULL,
  `nim` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nama` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `waktu_pengajuan` datetime DEFAULT NULL,
  `waktu_bayar` datetime DEFAULT NULL,
  `biaya_total` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_bayar`, `id_pengajuan`, `nim`, `nama`, `waktu_pengajuan`, `waktu_bayar`, `biaya_total`) VALUES
(4, 3, '1020666', 'Muhammad Rizaldi', '2017-04-19 14:16:06', '2017-04-19 14:16:46', 100000),
(5, 4, '1020667', 'Muhammad Rizaldi', '2017-04-19 17:46:20', '2017-04-19 17:46:29', 5000),
(6, 5, '10300', 'Muhammad Rizaldi', '2017-04-20 14:50:17', '2017-04-20 19:10:13', 475000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id_pengajuan` int(10) NOT NULL,
  `nim` varchar(20) COLLATE utf8_bin NOT NULL,
  `nama` varchar(200) COLLATE utf8_bin NOT NULL,
  `prodi` varchar(200) COLLATE utf8_bin NOT NULL,
  `total_tagihan` int(10) NOT NULL,
  `waktu_pengajuan` datetime NOT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '1:pengajuan/belum bayar;2:sudah_bayar;3:selesai;4:sudah_diambil;',
  `perubahan_status` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `pengajuan`
--

INSERT INTO `pengajuan` (`id_pengajuan`, `nim`, `nama`, `prodi`, `total_tagihan`, `waktu_pengajuan`, `status`, `perubahan_status`) VALUES
(3, '1020666', 'Muhammad Rizaldi', 'S1 Teknik Sipil', 100000, '2017-04-19 14:16:06', '2', '2017-04-19 14:16:46'),
(4, '1020667', 'Muhammad Rizaldi', 'S1 Teknik Sipil', 5000, '2017-04-19 17:46:20', '2', '2017-04-19 17:46:29'),
(5, '10300', 'Muhammad Rizaldi', 'S1 Teknik Sipil', 475000, '2017-04-20 14:50:17', '4', '2017-04-20 19:10:30'),
(6, '10300', 'Muhammad Rizaldi', 'S1 Teknik Sipil', 5000, '2017-04-21 13:58:29', '1', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan_detail`
--

CREATE TABLE `pengajuan_detail` (
  `id_pengajuan_detail` int(10) NOT NULL,
  `id_pengajuan` int(10) NOT NULL,
  `id_layanan` int(10) NOT NULL,
  `jumlah` int(2) NOT NULL,
  `nama_layanan` varchar(255) COLLATE utf8_bin NOT NULL,
  `deskripsi_layanan` text COLLATE utf8_bin NOT NULL,
  `biaya_satuan` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `pengajuan_detail`
--

INSERT INTO `pengajuan_detail` (`id_pengajuan_detail`, `id_pengajuan`, `id_layanan`, `jumlah`, `nama_layanan`, `deskripsi_layanan`, `biaya_satuan`) VALUES
(9, 3, 5, 1, 'Terjemahan ijazah bahasa Inggris', '', 100000),
(10, 4, 1, 1, 'Legalisasi ijazah bahasa Indonesia', '', 5000),
(11, 5, 1, 10, 'Legalisasi ijazah bahasa Indonesia', '', 5000),
(12, 5, 2, 10, 'Legalisasi ijazah bahasa Inggris', '', 7000),
(13, 5, 8, 10, 'Legalisasi ijazah sarmud/ keterangan lain', '', 5000),
(14, 5, 6, 10, 'Legalisasi transkrip akademik bahasa Indonesia', '', 5000),
(15, 5, 7, 10, 'Legalisasi transkrip akademik bahasa Inggris', '', 5000),
(16, 5, 5, 1, 'Terjemahan ijazah bahasa Inggris', '', 100000),
(17, 5, 3, 1, 'Transkrip akademik bahasa Indonesia', '', 5000),
(18, 5, 4, 1, 'Transkrip akademik bahasa Inggris', 'Biaya translasi', 100000),
(19, 6, 1, 1, 'Legalisasi ijazah bahasa Indonesia', '', 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tracer_form`
--

CREATE TABLE `tracer_form` (
  `id_form` int(10) UNSIGNED NOT NULL,
  `seq` int(11) NOT NULL,
  `label` varchar(100) COLLATE utf8_bin NOT NULL,
  `tipedata` enum('singleword','text','longtext','radio','check','combo','email','url','number','decimal','date') COLLATE utf8_bin DEFAULT NULL,
  `mandatory` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `instruksi` text COLLATE utf8_bin,
  `aktif` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tracer_form`
--

INSERT INTO `tracer_form` (`id_form`, `seq`, `label`, `tipedata`, `mandatory`, `instruksi`, `aktif`, `deleted`) VALUES
(1, 2, 'Nama lengkap', 'text', '1', 'isi dengan nama lengkap', '1', '1'),
(2, 3, 'Tanggal lahir', 'date', '0', 'isi dengan tanggal YYYY-mm-dd. Contoh: 1980-09-23', '0', '0'),
(3, 6, 'Jenis kelamin', 'radio', '1', '', '0', '0'),
(4, 9, 'Agama', 'combo', '1', 'Pilih satu', '0', '0'),
(5, 4, 'test', 'email', '1', 'isi dengan email saja', '0', '1'),
(6, 7, 'Email', 'email', '1', 'test', '0', '0'),
(7, 8, 'Blog', 'url', '1', '', '0', '0'),
(8, 10, 'Seberapa puas berkuliah di FTSL', 'radio', '1', '', '1', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tracer_form_data`
--

CREATE TABLE `tracer_form_data` (
  `id_form` int(10) UNSIGNED NOT NULL,
  `no_ijazah` varchar(100) COLLATE utf8_bin NOT NULL,
  `jurusan` varchar(200) COLLATE utf8_bin NOT NULL,
  `seq` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_bin NOT NULL,
  `data` text COLLATE utf8_bin,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tracer_form_data`
--

INSERT INTO `tracer_form_data` (`id_form`, `no_ijazah`, `jurusan`, `seq`, `label`, `data`, `created_at`, `updated_at`) VALUES
(8, '182067/K01/PP/VII/IJZ/1/2006', 'S1 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Biasa saja', '2013-12-08 18:01:20', NULL),
(8, 'FTSL-1000000005', 'S2 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Puas', '2013-12-08 17:51:57', NULL),
(8, 'FTSL-15007065', 'S1 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Biasa saja', '2013-12-08 17:59:32', NULL),
(8, 'FTSL-15007068', 'S1 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Sangat Puas', '2013-12-08 17:59:48', NULL),
(8, 'FTSL-15007133', 'S1 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Biasa saja', '2013-12-08 18:00:05', NULL),
(8, 'FTSL-15007158', 'S1 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Puas', '2013-12-08 18:00:22', NULL),
(8, 'FTSL-15007160', 'S1 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Puas', '2013-12-08 18:00:38', NULL),
(8, 'FTSL-15008090', 'S1 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Biasa saja', '2013-12-08 18:00:59', NULL),
(8, 'FTSL-15009001', 'S1 Teknik Sipil', 10, 'Seberapa puas berkuliah di FTSL', 'Tidak Puas', '2013-12-08 18:03:01', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tracer_form_options`
--

CREATE TABLE `tracer_form_options` (
  `id_option` int(10) UNSIGNED NOT NULL,
  `id_form` int(10) UNSIGNED NOT NULL,
  `label` varchar(100) COLLATE utf8_bin NOT NULL,
  `seq` int(3) NOT NULL,
  `value` varchar(100) COLLATE utf8_bin NOT NULL,
  `selected_value` char(1) COLLATE utf8_bin DEFAULT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tracer_form_options`
--

INSERT INTO `tracer_form_options` (`id_option`, `id_form`, `label`, `seq`, `value`, `selected_value`, `deleted`) VALUES
(1, 3, 'Pria', 1, 'Pria', '1', '0'),
(2, 3, 'Wanita', 2, 'Wanita', '0', '0'),
(3, 4, 'Islam', 1, 'Islam', '1', '0'),
(4, 4, 'Nasrani', 2, 'Nasrani', '0', '0'),
(5, 4, 'Kristen protestan', 3, 'Kristen protestan', '0', '0'),
(6, 4, 'Hindu', 4, 'Hindu', '0', '0'),
(7, 4, 'Budha', 5, 'Budha', '0', '0'),
(8, 4, 'wawawaw', 6, 'wawawaw', '0', '1'),
(9, 8, 'Sangat Puas', 1, 'Sangat Puas', '0', '0'),
(10, 8, 'Puas', 2, 'Puas', '1', '0'),
(11, 8, 'Tidak Puas', 4, 'Tidak Puas', '0', '0'),
(12, 8, 'Biasa saja', 3, 'Biasa saja', '0', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tracer_form_options_data`
--

CREATE TABLE `tracer_form_options_data` (
  `id_form` int(10) UNSIGNED NOT NULL,
  `nim` varchar(15) COLLATE utf8_bin NOT NULL,
  `prodi` varchar(200) COLLATE utf8_bin NOT NULL,
  `id_option` int(11) NOT NULL,
  `option_label` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `option_value` text COLLATE utf8_bin,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `password` varchar(70) COLLATE utf8_bin NOT NULL,
  `role` enum('keu','adm','akd') COLLATE utf8_bin NOT NULL DEFAULT 'adm',
  `last_login` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `aktif` int(1) DEFAULT '1',
  `deleted` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`username`, `password`, `role`, `last_login`, `created_at`, `aktif`, `deleted`) VALUES
('admakd', '21232f297a57a5a743894a0e4a801fc3', 'akd', '2017-04-20 19:10:20', '2017-04-20 18:57:40', 1, 0),
('admin', '21232f297a57a5a743894a0e4a801fc3', 'adm', '2017-04-21 18:25:11', NULL, 1, 0),
('admin123', '0192023a7bbd73250516f069df18b500', 'adm', '0000-00-00 00:00:00', '2013-11-17 20:51:28', 1, 0),
('admkeu', '21232f297a57a5a743894a0e4a801fc3', 'keu', '2017-04-20 19:03:08', '2017-04-20 18:57:40', 1, 0),
('admsipil', '7387807549b21b759970a9ced4885e33', 'adm', '0000-00-00 00:00:00', '2013-11-17 21:11:29', 1, 0),
('test', '098f6bcd4621d373cade4e832627b4f6', 'adm', '0000-00-00 00:00:00', '2013-12-08 01:39:26', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `histori_pengajuan`
--
ALTER TABLE `histori_pengajuan`
  ADD PRIMARY KEY (`id_histori`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`idjurusan`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD KEY `nim` (`nim`),
  ADD KEY `no_ijazah` (`no_ijazah`);

--
-- Indexes for table `mahasiswa_dokumen`
--
ALTER TABLE `mahasiswa_dokumen`
  ADD PRIMARY KEY (`no_ijazah`,`id_layanan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_bayar`);

--
-- Indexes for table `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`);

--
-- Indexes for table `pengajuan_detail`
--
ALTER TABLE `pengajuan_detail`
  ADD PRIMARY KEY (`id_pengajuan_detail`);

--
-- Indexes for table `tracer_form`
--
ALTER TABLE `tracer_form`
  ADD PRIMARY KEY (`id_form`);

--
-- Indexes for table `tracer_form_data`
--
ALTER TABLE `tracer_form_data`
  ADD PRIMARY KEY (`id_form`,`no_ijazah`),
  ADD KEY `seq` (`seq`);

--
-- Indexes for table `tracer_form_options`
--
ALTER TABLE `tracer_form_options`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `id_form` (`id_form`);

--
-- Indexes for table `tracer_form_options_data`
--
ALTER TABLE `tracer_form_options_data`
  ADD PRIMARY KEY (`id_form`,`nim`,`prodi`,`id_option`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `histori_pengajuan`
--
ALTER TABLE `histori_pengajuan`
  MODIFY `id_histori` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `idjurusan` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_layanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_bayar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id_pengajuan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pengajuan_detail`
--
ALTER TABLE `pengajuan_detail`
  MODIFY `id_pengajuan_detail` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tracer_form`
--
ALTER TABLE `tracer_form`
  MODIFY `id_form` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tracer_form_options`
--
ALTER TABLE `tracer_form_options`
  MODIFY `id_option` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;