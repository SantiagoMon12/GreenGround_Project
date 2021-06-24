-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-06-2021 a las 04:38:09
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `greenground`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcarrito`
--

CREATE TABLE `tbcarrito` (
  `IdProducto` int(11) NOT NULL,
  `Car_Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Car_Foto` blob NOT NULL,
  `Car_Descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `Car_Precio` double NOT NULL,
  `Car_Item` int(11) NOT NULL,
  `Car_stock` int(11) NOT NULL,
  `usu_id_usuario` int(11) NOT NULL,
  `Car_cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcliente`
--

CREATE TABLE `tbcliente` (
  `IdCliente` int(11) NOT NULL,
  `Identificacion` varchar(10) NOT NULL,
  `Nombres` varchar(255) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `img_usuario` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcompras`
--

CREATE TABLE `tbcompras` (
  `IdCompras` int(11) NOT NULL,
  `IdCliente` int(11) NOT NULL,
  `Shop_fecha` date NOT NULL,
  `Shop_monto` double NOT NULL,
  `shop_Estado` varchar(50) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `IdProducto` int(11) NOT NULL,
  `shop_cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbcompras`
--

INSERT INTO `tbcompras` (`IdCompras`, `IdCliente`, `Shop_fecha`, `Shop_monto`, `shop_Estado`, `idVendedor`, `IdProducto`, `shop_cantidad`) VALUES
(1, 5, '2021-06-14', 50000, 'cancelado en envio', 5, 6, 1),
(3, 5, '2021-06-14', 50000, 'cancelado en envio', 5, 2, 1),
(4, 5, '2021-06-14', 50000, 'cancelado en envio', 5, 4, 1),
(5, 5, '2021-06-14', 50000, 'cancelado en envio', 5, 4, 1),
(6, 5, '2021-06-14', 0, 'cancelado en envio', 5, 7, 1),
(7, 5, '2021-06-14', 50000, 'cancelado en envio', 5, 12, 1),
(9, 5, '2021-06-14', 50000, 'cancelado en envio', 5, 2, 1),
(10, 5, '2021-06-16', 100000, 'cancelado en envio', 12, 16, 1),
(12, 5, '2021-06-20', 50000, 'cancelado en envio', 5, 17, 1),
(13, 5, '2021-06-20', 200000, 'cancelado en envio', 5, 2, 4),
(14, 5, '2021-06-21', 100000, 'cancelado en envio', 5, 19, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbdetalle_compras`
--

CREATE TABLE `tbdetalle_compras` (
  `IdDetalle` int(11) NOT NULL,
  `Idproducto` int(11) NOT NULL,
  `IdCompras` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioCompra` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbpago`
--

CREATE TABLE `tbpago` (
  `IdPago` int(11) NOT NULL,
  `Monto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbproducto`
--

CREATE TABLE `tbproducto` (
  `IdProducto` int(11) NOT NULL,
  `Pro_Nombre` varchar(255) NOT NULL,
  `Pro_Foto` blob NOT NULL,
  `Pro_Descripcion` varchar(255) NOT NULL,
  `Pro_Precio` double NOT NULL,
  `Pro_Stock` int(11) NOT NULL,
  `pro_fecha_lote` date NOT NULL,
  `pro_fecha_vencimiento` date NOT NULL,
  `usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbproducto`
--

INSERT INTO `tbproducto` (`IdProducto`, `Pro_Nombre`, `Pro_Foto`, `Pro_Descripcion`, `Pro_Precio`, `Pro_Stock`, `pro_fecha_lote`, `pro_fecha_vencimiento`, `usu_id`) VALUES
(16, 'perros', 0x30, 'gatos', 100000, 49, '2021-06-27', '2021-06-17', 12),
(19, 'curcuma', 0x30, 'sadsd', 100000, 49, '2021-07-01', '2021-06-05', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbusuario`
--

CREATE TABLE `tbusuario` (
  `usu_id_usuario` int(11) NOT NULL,
  `usu_nombre` varchar(30) DEFAULT NULL,
  `usu_apellido` varchar(30) DEFAULT NULL,
  `usu_correo` varchar(30) DEFAULT NULL,
  `usu_contrasena` varchar(30) NOT NULL,
  `num_cel` varchar(20) NOT NULL,
  `usu_dir` varchar(100) NOT NULL,
  `usu_Recuperacion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbusuario`
--

INSERT INTO `tbusuario` (`usu_id_usuario`, `usu_nombre`, `usu_apellido`, `usu_correo`, `usu_contrasena`, `num_cel`, `usu_dir`, `usu_Recuperacion`) VALUES
(5, 'Andres Felipe', 'Olmos Rojas', 'andresolmos2784@gmail.com', '654123', '3103977412', 'cundinamarca,facatativa,llano popular, diag 14C # 19-46B', 'qubbcaelipbe'),
(9, 'Andres Felipe', 'rojas', 'afolmos28@misena.edu.com', '12345', '3103977412', 'diagonal 14c numero19-46b', '0'),
(12, 'jefferson', 'pulido', 'jeffersonpulido55@gmail.com', '654123', '3103977412', 'diagonal 14c numero19-46b', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbcarrito`
--
ALTER TABLE `tbcarrito`
  ADD PRIMARY KEY (`Car_Item`),
  ADD KEY `IdProducto` (`IdProducto`),
  ADD KEY `usu_id_usuario` (`usu_id_usuario`);

--
-- Indices de la tabla `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `tbcompras`
--
ALTER TABLE `tbcompras`
  ADD PRIMARY KEY (`IdCompras`),
  ADD KEY `IdCliente` (`IdCliente`),
  ADD KEY `idVendedor` (`idVendedor`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `tbdetalle_compras`
--
ALTER TABLE `tbdetalle_compras`
  ADD PRIMARY KEY (`IdDetalle`),
  ADD KEY `Idproducto` (`Idproducto`),
  ADD KEY `IdCompras` (`IdCompras`);

--
-- Indices de la tabla `tbpago`
--
ALTER TABLE `tbpago`
  ADD PRIMARY KEY (`IdPago`);

--
-- Indices de la tabla `tbproducto`
--
ALTER TABLE `tbproducto`
  ADD PRIMARY KEY (`IdProducto`),
  ADD KEY `usu_id` (`usu_id`);

--
-- Indices de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`usu_id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbcarrito`
--
ALTER TABLE `tbcarrito`
  MODIFY `Car_Item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `tbcompras`
--
ALTER TABLE `tbcompras`
  MODIFY `IdCompras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbproducto`
--
ALTER TABLE `tbproducto`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  MODIFY `usu_id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbcarrito`
--
ALTER TABLE `tbcarrito`
  ADD CONSTRAINT `tbcarrito_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `tbproducto` (`IdProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbcarrito_ibfk_2` FOREIGN KEY (`usu_id_usuario`) REFERENCES `tbusuario` (`usu_id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbcompras`
--
ALTER TABLE `tbcompras`
  ADD CONSTRAINT `tbcompras_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `tbusuario` (`usu_id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbcompras_ibfk_2` FOREIGN KEY (`idVendedor`) REFERENCES `tbusuario` (`usu_id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbproducto`
--
ALTER TABLE `tbproducto`
  ADD CONSTRAINT `tbproducto_ibfk_1` FOREIGN KEY (`usu_id`) REFERENCES `tbusuario` (`usu_id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
