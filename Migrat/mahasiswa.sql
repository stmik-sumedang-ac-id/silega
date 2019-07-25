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

 Date: 06/07/2019 21:49:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  KEY `no_ijazah` (`no_ijazah`),
  KEY `nim` (`nim`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;
