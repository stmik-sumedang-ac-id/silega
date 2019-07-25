/*
 Navicat Premium Data Transfer

 Source Server         : MAMP
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : ftsl_legalisir

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 06/07/2019 12:23:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for histori_pengajuan
-- ----------------------------
DROP TABLE IF EXISTS `histori_pengajuan`;
CREATE TABLE `histori_pengajuan` (
  `id_histori` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengajuan` int(5) NOT NULL DEFAULT '0',
  `waktu_perubahan` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `by` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_histori`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan` (
  `idjurusan` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_jurusan` varchar(255) COLLATE utf8_bin NOT NULL,
  `kode_jurusan` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `seq` int(10) unsigned DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idjurusan`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for layanan
-- ----------------------------
DROP TABLE IF EXISTS `layanan`;
CREATE TABLE `layanan` (
  `id_layanan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_layanan` varchar(255) COLLATE utf8_bin NOT NULL,
  `deskripsi` text COLLATE utf8_bin NOT NULL,
  `biaya` int(11) NOT NULL,
  `min_qty` int(3) NOT NULL,
  `max_qty` int(3) NOT NULL,
  `aktif` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `deleted` char(1) COLLATE utf8_bin DEFAULT '0',
  PRIMARY KEY (`id_layanan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
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
  `last_login` datetime DEFAULT NULL,
  KEY `nim` (`nim`),
  KEY `no_ijazah` (`no_ijazah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for mahasiswa_dokumen
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa_dokumen`;
CREATE TABLE `mahasiswa_dokumen` (
  `no_ijazah` varchar(100) COLLATE utf8_bin NOT NULL,
  `id_layanan` int(11) NOT NULL,
  `ukuran` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `ext` char(10) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`no_ijazah`,`id_layanan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for pembayaran
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran`;
CREATE TABLE `pembayaran` (
  `id_bayar` int(10) NOT NULL AUTO_INCREMENT,
  `id_pengajuan` int(10) DEFAULT NULL,
  `nim` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nama` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `waktu_pengajuan` datetime DEFAULT NULL,
  `waktu_bayar` datetime DEFAULT NULL,
  `biaya_total` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_bayar`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for pengajuan
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan`;
CREATE TABLE `pengajuan` (
  `id_pengajuan` int(10) NOT NULL AUTO_INCREMENT,
  `nim` varchar(20) COLLATE utf8_bin NOT NULL,
  `nama` varchar(200) COLLATE utf8_bin NOT NULL,
  `prodi` varchar(200) COLLATE utf8_bin NOT NULL,
  `total_tagihan` int(10) NOT NULL,
  `waktu_pengajuan` datetime NOT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '1:pengajuan/belum bayar;2:sudah_bayar;3:selesai;4:sudah_diambil;',
  `perubahan_status` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pengajuan`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for pengajuan_detail
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_detail`;
CREATE TABLE `pengajuan_detail` (
  `id_pengajuan_detail` int(10) NOT NULL AUTO_INCREMENT,
  `id_pengajuan` int(10) NOT NULL,
  `id_layanan` int(10) NOT NULL,
  `jumlah` int(2) NOT NULL,
  `nama_layanan` varchar(255) COLLATE utf8_bin NOT NULL,
  `deskripsi_layanan` text COLLATE utf8_bin NOT NULL,
  `biaya_satuan` int(6) NOT NULL,
  PRIMARY KEY (`id_pengajuan_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for tracer_form
-- ----------------------------
DROP TABLE IF EXISTS `tracer_form`;
CREATE TABLE `tracer_form` (
  `id_form` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seq` int(11) NOT NULL,
  `label` varchar(100) COLLATE utf8_bin NOT NULL,
  `tipedata` enum('singleword','text','longtext','radio','check','combo','email','url','number','decimal','date') COLLATE utf8_bin DEFAULT NULL,
  `mandatory` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `instruksi` text COLLATE utf8_bin,
  `aktif` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for tracer_form_data
-- ----------------------------
DROP TABLE IF EXISTS `tracer_form_data`;
CREATE TABLE `tracer_form_data` (
  `id_form` int(10) unsigned NOT NULL,
  `no_ijazah` varchar(100) COLLATE utf8_bin NOT NULL,
  `jurusan` varchar(200) COLLATE utf8_bin NOT NULL,
  `seq` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_bin NOT NULL,
  `data` text COLLATE utf8_bin,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_form`,`no_ijazah`),
  KEY `seq` (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for tracer_form_options
-- ----------------------------
DROP TABLE IF EXISTS `tracer_form_options`;
CREATE TABLE `tracer_form_options` (
  `id_option` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_form` int(10) unsigned NOT NULL,
  `label` varchar(100) COLLATE utf8_bin NOT NULL,
  `seq` int(3) NOT NULL,
  `value` varchar(100) COLLATE utf8_bin NOT NULL,
  `selected_value` char(1) COLLATE utf8_bin DEFAULT NULL,
  `deleted` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_option`),
  KEY `id_form` (`id_form`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for tracer_form_options_data
-- ----------------------------
DROP TABLE IF EXISTS `tracer_form_options_data`;
CREATE TABLE `tracer_form_options_data` (
  `id_form` int(10) unsigned NOT NULL,
  `nim` varchar(15) COLLATE utf8_bin NOT NULL,
  `prodi` varchar(200) COLLATE utf8_bin NOT NULL,
  `id_option` int(11) NOT NULL,
  `option_label` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `option_value` text COLLATE utf8_bin,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_form`,`nim`,`prodi`,`id_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(150) COLLATE utf8_bin NOT NULL,
  `password` varchar(70) COLLATE utf8_bin NOT NULL,
  `role` enum('keu','adm','akd') COLLATE utf8_bin NOT NULL DEFAULT 'adm',
  `last_login` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `aktif` int(1) DEFAULT '1',
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;
