-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-08-2023 a las 20:33:38
-- Versión del servidor: 10.5.20-MariaDB
-- Versión de PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id21099480_larreta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dia_semana`
--

CREATE TABLE `dia_semana` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dia_semana`
--

INSERT INTO `dia_semana` (`id`, `nombre`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miércoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sábado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha_mes`
--

CREATE TABLE `fecha_mes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fecha_mes`
--

INSERT INTO `fecha_mes` (`id`, `nombre`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12'),
(13, '13'),
(14, '14'),
(15, '15'),
(16, '16'),
(17, '17'),
(18, '18'),
(19, '19'),
(20, '20'),
(21, '21'),
(22, '22'),
(23, '23'),
(24, '24'),
(25, '25'),
(26, '26'),
(27, '27'),
(28, '28'),
(29, '29'),
(30, '30'),
(31, '31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `icono`
--

CREATE TABLE `icono` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `icono`
--

INSERT INTO `icono` (`id`, `nombre`) VALUES
(1, 'Auto'),
(2, 'Carrito'),
(3, 'Celular'),
(4, 'Cocina'),
(5, 'Corazón'),
(6, 'Flores'),
(7, 'Medico'),
(8, 'Perro'),
(9, 'Pesas'),
(10, 'Tarjetas'),
(11, 'Trabajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mes_ano`
--

CREATE TABLE `mes_ano` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mes_ano`
--

INSERT INTO `mes_ano` (`id`, `nombre`) VALUES
(1, 'Enero'),
(2, 'Febrero'),
(3, 'Marzo'),
(4, 'Abril'),
(5, 'Mayo'),
(6, 'Junio'),
(7, 'Julio'),
(8, 'Agosto'),
(9, 'Septiembre'),
(10, 'Octubre'),
(11, 'Noviembre'),
(12, 'Diciembre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea_mensual`
--

CREATE TABLE `tarea_mensual` (
  `id` int(10) UNSIGNED NOT NULL,
  `icono_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `mes_id` int(10) UNSIGNED NOT NULL,
  `fecha_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarea_mensual`
--

INSERT INTO `tarea_mensual` (`id`, `icono_id`, `descripcion`, `mes_id`, `fecha_id`) VALUES
(1, 1, 'Viajar a Madryn', 8, 14),
(11, 4, 'Cumple de Enzo', 7, 20),
(12, 6, 'Cumple de papa', 5, 15),
(13, 5, 'Mi Cumple', 6, 21),
(14, 5, 'Cumple de mama', 1, 28),
(15, 11, 'Final Dispo', 8, 1),
(16, 6, 'Primavera', 9, 21),
(17, 7, 'Revisión Anual', 10, 27),
(18, 11, 'Finales Carrera', 12, 9),
(19, 5, 'Navidad', 12, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea_semanal`
--

CREATE TABLE `tarea_semanal` (
  `id` int(10) UNSIGNED NOT NULL,
  `icono_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `dia_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarea_semanal`
--

INSERT INTO `tarea_semanal` (`id`, `icono_id`, `descripcion`, `dia_id`) VALUES
(1, 9, 'Crossfit', 1),
(2, 9, 'Crossfit', 3),
(3, 9, 'Crossfit', 5),
(4, 8, 'Pasear a Póker', 2),
(5, 8, 'Pasear a Póker', 4),
(6, 4, 'Cerámica', 4),
(7, 11, 'Ética y Deontología Profesional', 1),
(8, 11, 'Proyecto Final', 3),
(9, 11, 'Proyecto Final', 2),
(10, 11, 'Aplicaciones Híbridas', 1),
(11, 11, 'Aplicaciones Híbridas', 2),
(12, 11, 'Portales y Comercio Electrónico', 3),
(13, 11, 'Internet de las Cosas', 4),
(14, 11, 'Clientes Web Mobile', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dia_semana`
--
ALTER TABLE `dia_semana`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fecha_mes`
--
ALTER TABLE `fecha_mes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `icono`
--
ALTER TABLE `icono`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mes_ano`
--
ALTER TABLE `mes_ano`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarea_mensual`
--
ALTER TABLE `tarea_mensual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `icono_id` (`icono_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `fecha_id` (`fecha_id`);

--
-- Indices de la tabla `tarea_semanal`
--
ALTER TABLE `tarea_semanal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `icono_id` (`icono_id`),
  ADD KEY `dia_id` (`dia_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dia_semana`
--
ALTER TABLE `dia_semana`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `fecha_mes`
--
ALTER TABLE `fecha_mes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `icono`
--
ALTER TABLE `icono`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `mes_ano`
--
ALTER TABLE `mes_ano`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tarea_mensual`
--
ALTER TABLE `tarea_mensual`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tarea_semanal`
--
ALTER TABLE `tarea_semanal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tarea_mensual`
--
ALTER TABLE `tarea_mensual`
  ADD CONSTRAINT `tarea_mensual_ibfk_1` FOREIGN KEY (`icono_id`) REFERENCES `icono` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tarea_mensual_ibfk_2` FOREIGN KEY (`mes_id`) REFERENCES `mes_ano` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tarea_mensual_ibfk_3` FOREIGN KEY (`fecha_id`) REFERENCES `fecha_mes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tarea_semanal`
--
ALTER TABLE `tarea_semanal`
  ADD CONSTRAINT `tarea_semanal_ibfk_1` FOREIGN KEY (`dia_id`) REFERENCES `dia_semana` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `tarea_semanal_ibfk_2` FOREIGN KEY (`icono_id`) REFERENCES `icono` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
