-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2021 at 10:03 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `NotasDigitalHouseHMW`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categoria`
--

CREATE TABLE `Categoria` (
  `id_categoria` varchar(50) COLLATE utf8_bin NOT NULL,
  `Nombre` varchar(100) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Categoria`
--

INSERT INTO `Categoria` (`id_categoria`, `Nombre`) VALUES
('1', 'MTB'),
('10', 'Branches'),
('2', 'Ruta'),
('3', 'Coches'),
('4', 'iOS'),
('5', 'iPhone'),
('6', 'Android'),
('7', 'Mac'),
('8', 'Fotografia'),
('9', 'Bugs');

-- --------------------------------------------------------

--
-- Table structure for table `Nota`
--

CREATE TABLE `Nota` (
  `id_nota` varchar(50) COLLATE utf8_bin NOT NULL,
  `fecha_creacion` varchar(20) COLLATE utf8_bin NOT NULL,
  `fecha_modificacion` varchar(20) COLLATE utf8_bin NOT NULL,
  `titulo` varchar(100) COLLATE utf8_bin NOT NULL,
  `texto` varchar(255) COLLATE utf8_bin NOT NULL,
  `eliminable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Nota`
--

INSERT INTO `Nota` (`id_nota`, `fecha_creacion`, `fecha_modificacion`, `titulo`, `texto`, `eliminable`) VALUES
('AAA', '2021-10-16', '2021-10-26', 'Nota de prueba', 'Soy muy olvidadiso y por eso escribo esto', 1);

-- --------------------------------------------------------

--
-- Table structure for table `NotaCategoria`
--

CREATE TABLE `NotaCategoria` (
  `id` varchar(10) COLLATE utf8_bin NOT NULL,
  `id_nota` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_categoria` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `NotaCategoria`
--

INSERT INTO `NotaCategoria` (`id`, `id_nota`, `id_categoria`) VALUES
('1', 'AAA', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE `Usuario` (
  `id_usuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`id_usuario`, `nombre`, `email`) VALUES
('1', 'Juan', 'juan@example.com'),
('10', 'Itzel', 'itzel@example.com'),
('2', 'Paco', 'paco@example.com'),
('3', 'Pedro', 'pedro@example.com'),
('4', 'Auri', 'auri@example.com'),
('5', 'Luis', 'luis@example.com'),
('6', 'Jose', 'jose@example.com'),
('7', 'Marcela', 'marcela@example.com'),
('8', 'Paola', 'paola@example.com'),
('9', 'Claudia', 'claudia@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `UsuarioNota`
--

CREATE TABLE `UsuarioNota` (
  `id` varchar(10) COLLATE utf8_bin NOT NULL,
  `id_usuario` varchar(50) COLLATE utf8_bin NOT NULL,
  `id_nota` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `UsuarioNota`
--

INSERT INTO `UsuarioNota` (`id`, `id_usuario`, `id_nota`) VALUES
('1a', '4', 'AAA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categoria`
--
ALTER TABLE `Categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `Nota`
--
ALTER TABLE `Nota`
  ADD PRIMARY KEY (`id_nota`);

--
-- Indexes for table `NotaCategoria`
--
ALTER TABLE `NotaCategoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_nota` (`id_nota`);

--
-- Indexes for table `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `UsuarioNota`
--
ALTER TABLE `UsuarioNota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nota` (`id_nota`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `NotaCategoria`
--
ALTER TABLE `NotaCategoria`
  ADD CONSTRAINT `notacategoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`),
  ADD CONSTRAINT `notacategoria_ibfk_2` FOREIGN KEY (`id_nota`) REFERENCES `Nota` (`id_nota`);

--
-- Constraints for table `UsuarioNota`
--
ALTER TABLE `UsuarioNota`
  ADD CONSTRAINT `usuarionota_ibfk_1` FOREIGN KEY (`id_nota`) REFERENCES `Nota` (`id_nota`),
  ADD CONSTRAINT `usuarionota_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
