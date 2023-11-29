-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2023 a las 18:14:07
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria`
--

DROP DATABASE IF EXISTS veterinaria;
CREATE DATABASE veterinaria;
USE veterinaria;

DROP USER IF EXISTS 'admin'@'localhost';
DROP USER IF EXISTS 'vet'@'localhost';
DROP USER IF EXISTS 'receptionist'@'localhost';
DROP USER IF EXISTS 'billing'@'localhost';
DROP USER IF EXISTS 'guest'@'localhost';

-- User 1: Administrator (full privileges)
CREATE USER 'admin'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON veterinaria.* TO 'admin'@'localhost';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--
DROP TABLE IF exists veterinaria.contacto;
CREATE TABLE `veterinaria`.`contacto` (
  `idContacto` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp,
  `fecha_modificacion` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `contacto`
--
DELIMITER $$
CREATE TRIGGER `before_insert_contacto` BEFORE INSERT ON `veterinaria`.`contacto` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_contacto` BEFORE UPDATE ON `veterinaria`.`contacto` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallehistorial`
--
DROP TABLE IF exists veterinaria.detallehistorial;
CREATE TABLE `veterinaria`.`detallehistorial` (
  `idHistorial` int(11) NOT NULL,
  `idVeterinario` int(11) NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp,
  `fecha_modificacion` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `detallehistorial`
--
DELIMITER $$
CREATE TRIGGER `before_insert_detallehistorial` BEFORE INSERT ON `veterinaria`.`detallehistorial` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_detallehistorial` BEFORE UPDATE ON `veterinaria`.`detallehistorial` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--
DROP TABLE IF exists veterinaria.historial;
CREATE TABLE `veterinaria`.`historial` (
  `idHistorial` int(11) NOT NULL,
  `idVeterinario` int(11) NOT NULL,
  `idMascota` int(11) NOT NULL,
  `fechaHistorial` date NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tratamiento` varchar(200) NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp,
  `fecha_modificacion` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `historial`
--
DELIMITER $$
CREATE TRIGGER `before_insert_historial` BEFORE INSERT ON `veterinaria`.`historial` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `before_update_historial` BEFORE UPDATE ON `veterinaria`.`historial` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--
DROP TABLE IF exists veterinaria.mascota;
CREATE TABLE `veterinaria`.`mascota` (
  `idMascota` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombreMascota` varchar(50) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `razaMascota` varchar(20) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `sexo` char(1) NOT NULL,
  `foto` blob NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp,
  `fecha_modificacion` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `mascota`
--
DELIMITER $$
CREATE TRIGGER `before_insert_mascota` BEFORE INSERT ON `veterinaria`.`mascota` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_mascota` BEFORE UPDATE ON `veterinaria`.`mascota` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--
DROP TABLE IF exists veterinaria.veterinario;
CREATE TABLE `veterinaria`.`servicio` (
  `idServicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `foto` blob NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp,
  `fecha_modificacion` timestamp  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `servicio`
--
DELIMITER $$
CREATE TRIGGER `before_insert_servicio` BEFORE INSERT ON `veterinaria`.`servicio` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_servicio` BEFORE UPDATE ON `veterinaria`.`servicio` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--
DROP TABLE IF exists veterinaria.usuario;
CREATE TABLE `veterinaria`.`usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `correoUsuario` varchar(100) NOT NULL,
  `telefono` char(9) NOT NULL,
  `contraseña` blob NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp,
  `fecha_modificacion` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `before_insert_usuario` BEFORE INSERT ON `veterinaria`.`usuario` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_usuario` BEFORE UPDATE ON `veterinaria`.`usuario` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--
DROP TABLE IF exists veterinaria.veterinario;
CREATE TABLE `veterinaria`.`veterinario` (
  `idVeterinario` int(11) NOT NULL,
  `nombreVeterinario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` blob NOT NULL,
  `usuario_creacion` varchar(255) DEFAULT NULL,
  `usuario_modificacion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp,
  `fecha_modificacion` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `veterinario`
--
DELIMITER $$
CREATE TRIGGER `before_insert_veterinaio` BEFORE INSERT ON `veterinaria`.`veterinario` FOR EACH ROW BEGIN
    SET NEW.usuario_creacion = CURRENT_USER();
    SET NEW.fecha_creacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_veterinario` BEFORE UPDATE ON `veterinaria`.`veterinario` FOR EACH ROW BEGIN
    SET NEW.usuario_modificacion = CURRENT_USER();
    SET NEW.fecha_modificacion = CURRENT_TIMESTAMP();
END
$$
DELIMITER ;

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `veterinaria`.`contacto`
  ADD PRIMARY KEY (`idContacto`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `detallehistorial`
--
ALTER TABLE `veterinaria`.`detallehistorial`
  ADD PRIMARY KEY (`idHistorial`,`idVeterinario`),
  ADD KEY `idVeterinario` (`idVeterinario`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `veterinaria`.`historial`
  ADD PRIMARY KEY (`idHistorial`),
  ADD KEY `idVeterinario` (`idVeterinario`),
  ADD KEY `idMascota` (`idMascota`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `veterinaria`.`mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `veterinaria`.`servicio`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `veterinaria`.`usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinaria`.`veterinario`
  ADD PRIMARY KEY (`idVeterinario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `veterinaria`.`contacto`
  MODIFY `idContacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `veterinaria`.`historial`
  MODIFY `idHistorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `veterinaria`.`mascota`
  MODIFY `idMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `veterinaria`.`servicio`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `veterinaria`.`usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinaria`.`veterinario`
  MODIFY `idVeterinario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contacto`
--
ALTER TABLE `veterinaria`.`contacto`
  ADD CONSTRAINT `contacto_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `detallehistorial`
--
ALTER TABLE `veterinaria`.`detallehistorial`
  ADD CONSTRAINT `detallehistorial_ibfk_1` FOREIGN KEY (`idHistorial`) REFERENCES `historial` (`idHistorial`),
  ADD CONSTRAINT `detallehistorial_ibfk_2` FOREIGN KEY (`idVeterinario`) REFERENCES `veterinario` (`idVeterinario`);

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `veterinaria`.`historial`
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`);

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `veterinaria`.`mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
