-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2019 a las 04:29:21
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lacomanda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(18) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `mesa` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `orden` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `mesa`, `orden`) VALUES
(5, 'Matias Caceros', 'mep4a', '91nz8'),
(6, 'Lucia Cardozo', 'mep6a', 'xmg2e'),
(7, 'Jonathan Haedo', 'minea', 'rm8yz'),
(8, 'Juan Huissi', 'mexea', 'f05ly'),
(9, 'Juan Huissi', 'mexeb', 'c3lg4'),
(10, 'Juan Huissi', 'mexec', 'mixqp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuestas`
--

CREATE TABLE `encuestas` (
  `id` int(18) NOT NULL,
  `idMozo` int(18) NOT NULL,
  `mesa` varchar(18) COLLATE utf8_spanish2_ci NOT NULL,
  `orden` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `puntosmozo` int(18) NOT NULL,
  `puntoscocinero` int(18) NOT NULL,
  `puntosrestaurante` int(18) NOT NULL,
  `puntosmesa` int(18) NOT NULL,
  `experiencia` varchar(66) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `puntuacionTotal` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `encuestas`
--

INSERT INTO `encuestas` (`id`, `idMozo`, `mesa`, `orden`, `puntosmozo`, `puntoscocinero`, `puntosrestaurante`, `puntosmesa`, `experiencia`, `puntuacionTotal`) VALUES
(1, 5, 'mep4a', '91nz8', 4, 8, 5, 5, '', 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menubebidas`
--

CREATE TABLE `menubebidas` (
  `id` int(18) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` double NOT NULL,
  `cantidadVendida` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `menubebidas`
--

INSERT INTO `menubebidas` (`id`, `nombre`, `precio`, `cantidadVendida`) VALUES
(8, 'Cocacola', 65, 0),
(9, 'Pepsi', 60, 0),
(10, 'Agua', 40, 0),
(11, 'Sprite', 50, 0),
(12, 'Soda', 35, 0),
(13, 'Fanta', 60, 0),
(14, 'Manaos', 45, 12),
(15, 'Manaos', 45, 4),
(16, 'cotoCola', 35, 31),
(1000, 'sin bebidas', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menucomidas`
--

CREATE TABLE `menucomidas` (
  `id` int(18) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` double NOT NULL,
  `cantidadVendida` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `menucomidas`
--

INSERT INTO `menucomidas` (`id`, `nombre`, `precio`, `cantidadVendida`) VALUES
(9, 'Milanesa de ternera', 130, 0),
(10, 'Asado', 250, 0),
(11, 'pizza a la piedra', 130, 0),
(12, 'Mini hamburguesa con queso', 95, 0),
(13, 'Saltiado asiatico de cerdo', 155, 0),
(14, 'Mini Pizzas', 80, 28),
(15, 'Bolonesa', 100, 25),
(16, 'Macarrones con queso', 125, 15),
(1000, 'sin comidas', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menupostres`
--

CREATE TABLE `menupostres` (
  `id` int(18) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` double NOT NULL,
  `cantidadVendida` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `menupostres`
--

INSERT INTO `menupostres` (`id`, `nombre`, `precio`, `cantidadVendida`) VALUES
(12, 'Helado', 80, 0),
(13, 'Ensalada de frutas', 90, 0),
(14, 'Tartas de Fruta', 55, 12),
(15, 'granizado', 70, 26),
(16, 'Tarta de calabaza', 89, 7),
(17, 'Copa de frambuesa', 100, 0),
(18, 'platanos al horno', 60, 0),
(19, 'sufle de membrillo', 45, 0),
(20, 'manzana de caramelo', 45, 0),
(1000, 'sin postres', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menutragos`
--

CREATE TABLE `menutragos` (
  `id` int(18) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` double NOT NULL,
  `cantidadVendida` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `menutragos`
--

INSERT INTO `menutragos` (`id`, `nombre`, `precio`, `cantidadVendida`) VALUES
(10, 'Cerbeza', 80, 0),
(11, 'Baileys', 130, 0),
(12, 'Jack Daniels', 180, 0),
(13, 'Absolut', 200, 0),
(14, 'Red Star Er Guo (vodka de China)', 300, 22),
(15, 'Fernet', 40, 6),
(16, 'Khlibniy (Vodka)', 90, 24),
(17, 'Captain Morgan (Ron)', 180, 0),
(18, 'Vino Blanco', 15, 0),
(1000, 'sin tragos', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `id` int(18) NOT NULL,
  `mesa` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `asientos` int(18) NOT NULL,
  `ubicacion` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `usos` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`id`, `mesa`, `asientos`, `ubicacion`, `estado`, `usos`) VALUES
(1, 'mip1a', 1, 'interior', 'libre', 0),
(2, 'mip1b', 1, 'interior', 'libre', 0),
(3, 'mip1c', 1, 'interior', 'libre', 0),
(4, 'mip1d', 1, 'interior', 'libre', 0),
(5, 'mip1e', 1, 'interior', 'libre', 0),
(6, 'mip1f', 1, 'interior', 'libre', 0),
(7, 'mip2a', 2, 'interior', 'libre', 0),
(8, 'mip2b', 2, 'interior', 'libre', 0),
(9, 'mip2c', 2, 'interior', 'libre', 0),
(10, 'mip2d', 2, 'interior', 'libre', 0),
(11, 'mip2e', 2, 'interior', 'libre', 0),
(12, 'mip2f', 2, 'interior', 'libre', 0),
(13, 'mip4a', 4, 'interior', 'libre', 0),
(14, 'mip4b', 4, 'interior', 'libre', 0),
(15, 'mip4c', 4, 'interior', 'libre', 0),
(16, 'mip4d', 4, 'interior', 'libre', 0),
(17, 'mip4e', 4, 'interior', 'libre', 0),
(18, 'mip4f', 4, 'interior', 'libre', 0),
(19, 'mip6a', 6, 'interior', 'libre', 0),
(20, 'mip6b', 6, 'interior', 'libre', 0),
(21, 'mip6c', 6, 'interior', 'libre', 0),
(22, 'mip6d', 6, 'interior', 'libre', 0),
(23, 'mip6e', 6, 'interior', 'libre', 0),
(24, 'mip6f', 6, 'interior', 'libre', 0),
(25, 'mep1a', 1, 'exterior', 'libre', 0),
(26, 'mep1b', 1, 'exterior', 'libre', 0),
(27, 'mep1c', 1, 'exterior', 'libre', 0),
(28, 'mep1d', 1, 'exterior', 'libre', 0),
(29, 'mep1e', 1, 'exterior', 'libre', 0),
(30, 'mep1f', 1, 'exterior', 'libre', 0),
(31, 'mep2a', 2, 'exterior', 'libre', 0),
(32, 'mep2c', 2, 'exterior', 'libre', 0),
(33, 'mep2d', 2, 'exterior', 'libre', 0),
(34, 'mep2e', 2, 'exterior', 'libre', 0),
(35, 'mep2f', 2, 'exterior', 'libre', 0),
(36, 'mep4a', 4, 'exterior', 'libre', 1),
(37, 'mep4b', 4, 'exterior', 'libre', 0),
(38, 'mep4c', 4, 'exterior', 'libre', 0),
(39, 'mep4d', 4, 'exterior', 'libre', 0),
(40, 'mep6a', 6, 'exterior', 'esperando pedido', 1),
(41, 'mep6b', 6, 'exterior', 'libre', 0),
(42, 'mep6c', 6, 'exterior', 'libre', 0),
(43, 'mexea', 25, 'exterior', 'esperando pedido', 1),
(44, 'mexeb', 25, 'exterior', 'esperando pedido', 1),
(45, 'mexec', 25, 'exterior', 'libre', 1),
(46, 'minea', 25, 'interior', 'esperando pedido', 1),
(47, 'mineb', 25, 'interior', 'libre', 0),
(48, 'minec', 25, 'interior', 'libre', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosbebida`
--

CREATE TABLE `pedidosbebida` (
  `id` int(18) NOT NULL,
  `orden` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idBebida` int(18) NOT NULL,
  `cantidad` int(18) NOT NULL,
  `estado` varchar(80) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidosbebida`
--

INSERT INTO `pedidosbebida` (`id`, `orden`, `idBebida`, `cantidad`, `estado`) VALUES
(5, '91nz8', 14, 12, 'entregado'),
(6, 'xmg2e', 15, 2, 'pendiente'),
(7, 'rm8yz', 15, 2, 'pendiente'),
(8, 'rm8yz', 16, 7, 'pendiente'),
(9, 'f05ly', 16, 12, 'pendiente'),
(10, 'c3lg4', 16, 12, 'pendiente'),
(11, 'mixqp', 16, 12, 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidoscomida`
--

CREATE TABLE `pedidoscomida` (
  `id` int(18) NOT NULL,
  `orden` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idComida` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `cantidad` int(18) NOT NULL,
  `estado` varchar(80) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidoscomida`
--

INSERT INTO `pedidoscomida` (`id`, `orden`, `idComida`, `cantidad`, `estado`) VALUES
(5, '91nz8', '14', 12, 'entregado'),
(6, 'xmg2e', '15', 5, 'pendiente'),
(7, 'rm8yz', '15', 5, 'pendiente'),
(8, 'rm8yz', '16', 3, 'pendiente'),
(9, 'f05ly', '15', 5, 'pendiente'),
(10, 'f05ly', '16', 3, 'pendiente'),
(11, 'ompin', '15', 5, 'pendiente'),
(12, 'ompin', '16', 3, 'pendiente'),
(13, 'c3lg4', '15', 5, 'pendiente'),
(14, 'c3lg4', '16', 3, 'pendiente'),
(15, 'c3lg4', '14', 8, 'pendiente'),
(16, 'mixqp', '15', 5, 'cancelado'),
(17, 'mixqp', '16', 3, 'cancelado'),
(18, 'mixqp', '14', 8, 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosmozo`
--

CREATE TABLE `pedidosmozo` (
  `id` int(18) NOT NULL,
  `idMozo` int(18) NOT NULL,
  `orden` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `mesa` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `facturacion` float NOT NULL,
  `foto` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidosmozo`
--

INSERT INTO `pedidosmozo` (`id`, `idMozo`, `orden`, `mesa`, `estado`, `facturacion`, `foto`) VALUES
(5, 6, '91nz8', 'mep4a', 'entregado', 5760, NULL),
(6, 6, 'xmg2e', 'mep6a', 'en preparacion', 990, './public/img/mesas/Lucia Cardozo-mep6a-xmg2e.jpg'),
(7, 6, 'rm8yz', 'minea', 'en preparacion', 3433, NULL),
(8, 6, 'f05ly', 'mexea', 'en preparacion', 3545, NULL),
(9, 6, 'c3lg4', 'mexeb', 'en preparacion', 4185, NULL),
(10, 6, 'mixqp', 'mexec', 'cancelado', 4185, './public/img/mesas/Juan Huissi-mexec-mixqp.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidospostre`
--

CREATE TABLE `pedidospostre` (
  `id` int(18) NOT NULL,
  `orden` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idPostre` int(30) NOT NULL,
  `cantidad` int(18) NOT NULL,
  `estado` varchar(80) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidospostre`
--

INSERT INTO `pedidospostre` (`id`, `orden`, `idPostre`, `cantidad`, `estado`) VALUES
(5, '91nz8', 14, 12, 'entregado'),
(6, 'xmg2e', 15, 4, 'pendiente'),
(7, 'rm8yz', 15, 4, 'pendiente'),
(8, 'rm8yz', 16, 7, 'pendiente'),
(9, 'f05ly', 15, 9, 'pendiente'),
(10, 'c3lg4', 15, 9, 'pendiente'),
(11, 'mixqp', 15, 9, 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidostrago`
--

CREATE TABLE `pedidostrago` (
  `id` int(18) NOT NULL,
  `orden` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idTrago` int(18) NOT NULL,
  `cantidad` int(18) NOT NULL,
  `estado` varchar(80) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedidostrago`
--

INSERT INTO `pedidostrago` (`id`, `orden`, `idTrago`, `cantidad`, `estado`) VALUES
(5, '91nz8', 14, 12, 'entregado'),
(6, 'xmg2e', 15, 3, 'pendiente'),
(7, 'rm8yz', 15, 3, 'pendiente'),
(8, 'rm8yz', 14, 4, 'pendiente'),
(9, 'f05ly', 14, 3, 'pendiente'),
(10, 'f05ly', 16, 8, 'pendiente'),
(11, 'c3lg4', 14, 3, 'pendiente'),
(12, 'c3lg4', 16, 8, 'pendiente'),
(13, 'mixqp', 14, 3, 'cancelado'),
(14, 'mixqp', 16, 8, 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrologeo`
--

CREATE TABLE `registrologeo` (
  `id` int(18) NOT NULL,
  `fecha` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `hora` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `registrologeo`
--

INSERT INTO `registrologeo` (`id`, `fecha`, `hora`, `idUsuario`) VALUES
(5, '16-07-2019', '02-07-06am', 6),
(6, '22-07-2019', '12-10-46am', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrooperaciones`
--

CREATE TABLE `registrooperaciones` (
  `id` int(18) NOT NULL,
  `hora` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `operacion` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `registrooperaciones`
--

INSERT INTO `registrooperaciones` (`id`, `hora`, `fecha`, `operacion`, `idUsuario`) VALUES
(8, '01-51-41am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(9, '01-54-16am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(10, '01-54-20am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(11, '01-54-31am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(12, '01-55-11am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(13, '01-56-18am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(14, '01-59-46am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(15, '02-01-17am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(16, '02-03-02am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(17, '02-03-27am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(18, '02-04-35am', '16-07-2019', '/tp/template/Mozo/TomarPedido', 6),
(19, '02-04-43am', '16-07-2019', '/tp/template/Mozo/TomarFotografia', 6),
(20, '02-05-15am', '16-07-2019', '/tp/template/Mozo/TomarFotografia', 6),
(21, '02-05-51am', '16-07-2019', '/tp/template/Mozo/TomarFotografia', 6),
(22, '02-06-35am', '16-07-2019', '/tp/template/Mozo/CancelarPedido', 6),
(23, '02-08-21am', '16-07-2019', '/tp/template/Mozo/ServirPedido', 6),
(24, '02-08-42am', '16-07-2019', '/tp/template/Cocinero/CocinarPedido', 6),
(25, '02-09-11am', '16-07-2019', '/tp/template/Cocinero/CocinarPedido', 6),
(26, '02-09-17am', '16-07-2019', '/tp/template/Cocinero/TerminarPedido', 6),
(27, '02-09-25am', '16-07-2019', '/tp/template/Cocinero/PrepararPostre', 6),
(28, '02-09-32am', '16-07-2019', '/tp/template/Cocinero/TerminarPedidoPostre', 6),
(29, '02-09-49am', '16-07-2019', '/tp/template/Bartender/PrepararPedido', 6),
(30, '02-09-53am', '16-07-2019', '/tp/template/Bartender/TerminarPedido', 6),
(31, '02-10-02am', '16-07-2019', '/tp/template/Mozo/ServirPedido', 6),
(32, '02-10-18am', '16-07-2019', '/tp/template/Cervecero/PrepararPedido', 6),
(33, '02-10-29am', '16-07-2019', '/tp/template/Cervecero/TerminarPedido', 6),
(34, '02-10-59am', '16-07-2019', '/tp/template/Mozo/ServirPedido', 6),
(35, '02-11-25am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(36, '02-13-33am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(37, '02-13-42am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(38, '02-14-39am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(39, '02-14-45am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(40, '02-14-50am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(41, '02-14-57am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(42, '02-15-25am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(43, '02-16-00am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(44, '02-16-42am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(45, '02-17-03am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(46, '02-17-05am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(47, '02-17-19am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(48, '02-17-22am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(49, '02-17-28am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(50, '02-17-38am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(51, '02-17-45am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(52, '02-17-52am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(53, '02-18-07am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(54, '02-18-18am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(55, '02-18-36am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(56, '02-19-33am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(57, '02-19-49am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(58, '02-19-54am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(59, '02-20-04am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(60, '02-20-20am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(61, '02-20-24am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(62, '02-20-31am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(63, '02-21-35am', '16-07-2019', '/tp/template/Mozo/CobrarPedido', 6),
(64, '02-32-23am', '16-07-2019', '/tp/template/Cocinero/', 6),
(65, '02-37-44am', '16-07-2019', '/tp/template/Socio/Administracion/Mesas/MejoresComentarios', 6),
(66, '02-37-52am', '16-07-2019', '/tp/template/Socio/Administracion/Mesas/PeoresComentarios', 6),
(67, '02-38-29am', '16-07-2019', '/tp/template/Socio/Administracion/Mesas/FacturaMasBaja', 6),
(68, '02-38-37am', '16-07-2019', '/tp/template/Socio/Administracion/Mesas/FacturaMasAlta', 6),
(69, '02-40-23am', '16-07-2019', '/tp/template/Socio/Administracion/Mesas/FacturaMasAlta', 6),
(70, '02-40-32am', '16-07-2019', '/tp/template/Socio/Administracion/Mesas/FacturaMasAlta', 6),
(71, '03-09-43am', '16-07-2019', '/tp/template/Socio/Administracion/Mesas/FacturaMasAlta', 6),
(72, '03-10-16am', '16-07-2019', '/tp/template/Socio/Administracion/Mesas/FacturaMasAlta', 6),
(73, '03-12-01am', '16-07-2019', '/tp/template/Socio/Administracion/Pedidos/MasVendido', 6),
(74, '03-12-13am', '16-07-2019', '/tp/template/Socio/Administracion/Pedidos/MenosVendido', 6),
(75, '03-12-36am', '16-07-2019', '/tp/template/Socio/Administracion/Pedidos/Cancelados', 6),
(76, '03-13-11am', '16-07-2019', '/tp/template/Socio/Pedidos/', 6),
(77, '03-13-18am', '16-07-2019', '/tp/template/Socio/Pedidos/EnPreparacion', 6),
(78, '03-13-22am', '16-07-2019', '/tp/template/Socio/Pedidos/Terminados', 6),
(79, '03-13-34am', '16-07-2019', '/tp/template/Socio/Pedidos/CerrarMesa', 6),
(80, '03-13-36am', '16-07-2019', '/tp/template/Socio/Pedidos/CerrarMesa', 6),
(81, '03-13-51am', '16-07-2019', '/tp/template/Socio/Pedidos/CerrarMesa', 6),
(82, '03-14-09am', '16-07-2019', '/tp/template/Socio/Pedidos/LiberarMesas', 6),
(83, '12-10-58am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(84, '12-11-02am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(85, '12-11-25am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(86, '12-11-35am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(87, '12-11-45am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(88, '12-12-00am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(89, '12-12-28am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(90, '12-12-53am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(91, '12-17-51am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6),
(92, '12-18-06am', '22-07-2019', '/tp/template/Mozo/CambiarPedidoComida', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(18) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `role` varchar(80) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `clave`, `role`) VALUES
(6, 'admin', '$2y$10$MdKy.Oq9msQZ0jiz5abx5eP2zyOYRJL0u3x/uFCOnukVJHb35qyTu', 'admin'),
(7, 'cocinero', '$2y$10$e8OpM0ujKf9783VTASYgLeFf4zDDgufiX1G.KziVv/5ynGg42C/Si', 'cocinero'),
(8, 'cervecero', '$2y$10$D3iv0WGEcEwPPPHX./WXZO3lOsyXGvE4Mo69yGDqLj5fWQEGur6Yi', 'cervecero'),
(9, 'bartender', '$2y$10$MgeUwqWkCiibTOPlhI9Sv.2C6nbkzJKv9rfsjcb1Clod0NiGmho2C', 'bartender'),
(10, 'mozo', '$2y$10$Os5lB6m2kQijyPWxOOArs.X3QvGG48YXpHoBOZG/YZXf.E.mXBPym', 'mozo'),
(11, 'mozo1', '$2y$10$cMaGJEJnka7h.skgcYizc.CUbsYPlcgok9g5NhUs7rqDuciaI.hzC', 'mozo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menubebidas`
--
ALTER TABLE `menubebidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menucomidas`
--
ALTER TABLE `menucomidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menupostres`
--
ALTER TABLE `menupostres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menutragos`
--
ALTER TABLE `menutragos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidosbebida`
--
ALTER TABLE `pedidosbebida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidoscomida`
--
ALTER TABLE `pedidoscomida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidosmozo`
--
ALTER TABLE `pedidosmozo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidospostre`
--
ALTER TABLE `pedidospostre`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidostrago`
--
ALTER TABLE `pedidostrago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registrologeo`
--
ALTER TABLE `registrologeo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registrooperaciones`
--
ALTER TABLE `registrooperaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `encuestas`
--
ALTER TABLE `encuestas`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menubebidas`
--
ALTER TABLE `menubebidas`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT de la tabla `menucomidas`
--
ALTER TABLE `menucomidas`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT de la tabla `menupostres`
--
ALTER TABLE `menupostres`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT de la tabla `menutragos`
--
ALTER TABLE `menutragos`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `pedidosbebida`
--
ALTER TABLE `pedidosbebida`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedidoscomida`
--
ALTER TABLE `pedidoscomida`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `pedidosmozo`
--
ALTER TABLE `pedidosmozo`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidospostre`
--
ALTER TABLE `pedidospostre`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pedidostrago`
--
ALTER TABLE `pedidostrago`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `registrologeo`
--
ALTER TABLE `registrologeo`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `registrooperaciones`
--
ALTER TABLE `registrooperaciones`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(18) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
