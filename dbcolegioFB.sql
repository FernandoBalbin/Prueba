-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33065
-- Tiempo de generación: 17-12-2021 a las 16:07:09
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.0

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbcolegio`
--
CREATE DATABASE IF NOT EXISTS `dbcolegio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbcolegio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblalumno`
--


CREATE TABLE `tblalumno` (
  `idAlumno` varchar(8) NOT NULL,
  `aluNombre` varchar(70) DEFAULT NULL,
  `aluApPaterno` varchar(70) DEFAULT NULL,
  `aluApMaterno` varchar(70) DEFAULT NULL,
  `aluDireccion` varchar(70) DEFAULT NULL,
  `aluGrado` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblalumno`
--

INSERT INTO `tblalumno` (`idAlumno`, `aluNombre`, `aluApPaterno`, `aluApMaterno`, `aluDireccion`, `aluGrado`) VALUES('A00001', 'Fernando', 'BALBIN', 'URCUHUARANGA', 'AV LAS FLORES MZA LT 10', 4);
INSERT INTO `tblalumno` (`idAlumno`, `aluNombre`, `aluApPaterno`, `aluApMaterno`, `aluDireccion`, `aluGrado`) VALUES('A00002', 'Diego', 'HUAYANAY', 'ICHPAS', 'AV HVCA 105', 2);
INSERT INTO `tblalumno` (`idAlumno`, `aluNombre`, `aluApPaterno`, `aluApMaterno`, `aluDireccion`, `aluGrado`) VALUES('A00003', 'Jose Luis', 'INGA', 'TORRES', 'Los jeranios 1052', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcurso`
--


CREATE TABLE `tblcurso` (
  `idCurso` int(8) NOT NULL,
  `curNombre` varchar(70) DEFAULT NULL,
  `profDNI` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblcurso`
--

INSERT INTO `tblcurso` (`idCurso`, `curNombre`, `profDNI`) VALUES(101, 'Matematicas', 72724516);
INSERT INTO `tblcurso` (`idCurso`, `curNombre`, `profDNI`) VALUES(102, 'Redes del computador', 74445885);
INSERT INTO `tblcurso` (`idCurso`, `curNombre`, `profDNI`) VALUES(103, 'Base de datos', 74445885);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblnotas`
--


CREATE TABLE `tblnotas` (
  `idNota` int(8) DEFAULT NULL,
  `idAlumno` varchar(8) DEFAULT NULL,
  `idCurso` int(8) DEFAULT NULL,
  `Unidad` int(11) DEFAULT NULL,
  `Promedio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblnotas`
--

INSERT INTO `tblnotas` (`idNota`, `idAlumno`, `idCurso`, `Unidad`, `Promedio`) VALUES(1, 'A00001', 101, 2, 15);
INSERT INTO `tblnotas` (`idNota`, `idAlumno`, `idCurso`, `Unidad`, `Promedio`) VALUES(2, 'A00002', 102, 2, 19);
INSERT INTO `tblnotas` (`idNota`, `idAlumno`, `idCurso`, `Unidad`, `Promedio`) VALUES(3, 'A00002', 103, 3, 18.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblprofesor`
--

CREATE TABLE `tblprofesor` (
  `profDNI` int(8) NOT NULL,
  `profNombre` varchar(70) DEFAULT NULL,
  `profApPaterno` varchar(70) DEFAULT NULL,
  `profApMaterno` varchar(70) DEFAULT NULL,
  `profDireccion` varchar(70) DEFAULT NULL,
  `profEmail` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tblprofesor`
--

INSERT INTO `tblprofesor` (`profDNI`, `profNombre`, `profApPaterno`, `profApMaterno`, `profDireccion`, `profEmail`) VALUES(72724516, 'Andre', 'ATAYPOMA', 'TORRES', 'Jr la merced 1540', 'andre@gmail.com');
INSERT INTO `tblprofesor` (`profDNI`, `profNombre`, `profApPaterno`, `profApMaterno`, `profDireccion`, `profEmail`) VALUES(74445885, 'Jose', 'VALDERRAMA', 'RAMOS', 'La merced', '74857414@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblalumno`
--
ALTER TABLE `tblalumno`
  ADD PRIMARY KEY (`idAlumno`);

--
-- Indices de la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
  ADD PRIMARY KEY (`idCurso`),
  ADD KEY `FK_PROFESOR` (`profDNI`);

--
-- Indices de la tabla `tblnotas`
--
ALTER TABLE `tblnotas`
  ADD KEY `FK_ALUMNO` (`idAlumno`),
  ADD KEY `FK_CURSO` (`idCurso`);

--
-- Indices de la tabla `tblprofesor`
--
ALTER TABLE `tblprofesor`
  ADD PRIMARY KEY (`profDNI`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
  ADD CONSTRAINT `tblcurso_ibfk_1` FOREIGN KEY (`profDNI`) REFERENCES `tblprofesor` (`profDNI`);

--
-- Filtros para la tabla `tblnotas`
--
ALTER TABLE `tblnotas`
  ADD CONSTRAINT `tblnotas_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `tblalumno` (`idAlumno`),
  ADD CONSTRAINT `tblnotas_ibfk_2` FOREIGN KEY (`idCurso`) REFERENCES `tblcurso` (`idCurso`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

 -- Para BUSCAR
 USE dbcolegio;
 SELECT * FROM `tblnotas` WHERE `Promedio` = 19;
 SELECT * FROM `tblnotas` WHERE `idNota` = 1;
 
 -- Para hacer actualizaciones
 USE dbcolegio;
 UPDATE `tblprofesor` SET `profDireccion` = 'trece y real' WHERE `tblprofesor`.`profDNI` = 74445885;
 SELECT * FROM `tblprofesor`;
 -- Para borrar
 use dbcolegio;
 DELETE FROM `tblprofesor` WHERE `tblprofesor`.`profDNI` = 74445885;
 SELECT * FROM `tblprofesor`;