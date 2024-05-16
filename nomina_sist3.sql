-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2024 a las 03:08:07
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
-- Base de datos: `nomina_sist3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `COD_AREA` varchar(5) NOT NULL,
  `DES_AREA` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`COD_AREA`, `DES_AREA`) VALUES
('20000', 'Producci�n'),
('25000', 'Contabilidad2'),
('30000', 'Sistemas'),
('35000', 'Recursos Humanos'),
('40000', 'Gerencia'),
('45000', 'Ventas-Mercadeo'),
('50000', 'Servicios generales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `COD_DEPTO` varchar(2) NOT NULL,
  `NOM_DEPTO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`COD_DEPTO`, `NOM_DEPTO`) VALUES
('05', 'ANTIOQUIA'),
('08', 'ATLANTICO'),
('11', 'BOGOTA D.C.'),
('13', 'BOLIVAR'),
('15', 'BOYACA'),
('17', 'CALDAS'),
('18', 'CAQUETA'),
('19', 'CAUCA'),
('20', 'CESAR'),
('23', 'CORDOBA'),
('25', 'CUNDINAMARCA'),
('27', 'CHOCO'),
('41', 'HUILA'),
('44', 'GUAJIRA'),
('47', 'MAGDALENA'),
('50', 'META'),
('52', 'NARI�O'),
('54', 'NORTE DE SANTANDER'),
('63', 'QUINDIO'),
('66', 'RISARALDA'),
('68', 'SANTANDER'),
('73', 'TOLIMA'),
('76', 'VALLE DEL CAUCA'),
('81', 'ARAUCA'),
('85', 'CASANARE'),
('86', 'PUTUMAYO'),
('88', 'ARCHIPIELAGO DE SAN ANDRES'),
('91', 'AMAZONAS'),
('94', 'GUAINIA'),
('95', 'GUAVIARE'),
('97', 'VAUPES'),
('99', 'VICHADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `NOMBRES` varchar(60) DEFAULT NULL,
  `APELLIDOS` varchar(60) DEFAULT NULL,
  `COD_TIPODOC` varchar(2) DEFAULT NULL,
  `NUM_DOCUMENTO` varchar(20) NOT NULL,
  `COD_GENERO` varchar(1) DEFAULT NULL,
  `COD_ESTADO` varchar(1) DEFAULT NULL,
  `COD_MUNICIPIO` varchar(5) DEFAULT NULL,
  `SALARIO` int(20) DEFAULT NULL,
  `COD_AREA` varchar(5) DEFAULT NULL,
  `COD_ESTCIVIL` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`NOMBRES`, `APELLIDOS`, `COD_TIPODOC`, `NUM_DOCUMENTO`, `COD_GENERO`, `COD_ESTADO`, `COD_MUNICIPIO`, `SALARIO`, `COD_AREA`, `COD_ESTCIVIL`) VALUES
('Santiago', 'Henao Ot�lora', 'CC', '1000129971', 'M', 'A', '11001', 2800000, '30000', 'SL'),
('Yudi Xiomara', 'Molina Forero', 'CC', '1000135417', 'F', 'A', '11001', 2100000, '20000', 'SL'),
('Sergio Antonio', 'Morales Zamudio', 'CC', '1000255735', 'M', 'A', '11001', 4000000, '45000', 'SL'),
('Carlos Andres', 'Morales Montes', 'CC', '1000381531', 'M', 'A', '11001', 4100000, '40000', 'SL'),
('Laura Alejandra', 'Sandoval Salazar', 'CC', '1000934782', 'F', 'A', '11001', 4000000, '20000', 'SL'),
('Geraldine Fabiana', 'Ria�o Vargas', 'CC', '1000988685', 'F', 'A', '11001', 3100000, '35000', 'SL'),
('Arleth Duvan', 'Ramirez Vera', 'CC', '1000990991', 'M', 'I', '11001', 1850000, '25000', 'SL'),
('Giovany', 'Zuluaga Manrique', 'CC', '1002800495', 'M', 'A', '11001', 3400000, '35000', 'SL'),
('Nicolas', 'Henao Martinez', 'CC', '1011088352', 'M', 'A', '11001', 2000000, '30000', 'SL'),
('Maria Paula', 'Arias Hurtado', 'CC', '1013099099', 'F', 'A', '11001', 3600000, '35000', 'SL'),
('Daniela Valentina', 'Barrera Oses', 'CC', '1013576918', 'F', 'A', '11001', 3200000, '30000', 'SL'),
('Juliana', 'Ocampo Ramirez', 'CC', '1018481308', 'F', 'A', '63001', 6000000, '20000', 'SL'),
('Jeison Alejandro', 'Zambrano Alzate', 'CC', '1024473795', 'M', 'A', '11001', 1800000, '25000', 'SL'),
('Diana Mayerly', 'Ahumada Mahecha', 'CC', '1026581688', 'F', 'A', '25518', 2100000, '40000', 'SL'),
('Thomas Jefrey', 'Rodriguez Ospina', 'TI', '1028481888', 'M', 'A', '11001', 1300000, '35000', 'SL'),
('Diego Fernando', 'Guatibonza Erazo', 'CC', '1030697126', 'M', 'A', '11001', 3200000, '40000', 'SL'),
('Luis Alberto', 'Martinez Martinez', 'CC', '1030697209', 'M', 'I', '11001', 4100000, '35000', 'SL'),
('Daniela', 'Navarro Ascencio', 'CC', '1031642892', 'F', 'I', '11001', 1400000, '40000', 'SL'),
('Richard Efrain', 'Marcano Vargas', 'CC', '1032511437', 'M', 'A', '54001', 2600000, '25000', 'SL'),
('Natalia', 'Garcia Moreno', 'CC', '1034278726', 'F', 'I', '11001', 1650000, '25000', 'SL'),
('Dilan Jose', 'Villa Ramos', 'CC', '1043639243', 'M', 'A', '11001', 2300000, '45000', 'SL'),
('Marcos El�as', 'Montes Cruz', 'TI', '1064193348', 'M', 'A', '11001', 3200000, '45000', 'SL'),
('Carlos Manuel', 'Mej�a Herrera', 'CC', '1070326569', 'M', 'A', '11001', 1850000, '35000', 'SL'),
('Nataly', 'Sosa Yara', 'CC', '1073695794', 'F', 'A', '11001', 3200000, '30000', 'SL'),
('Santiago', 'Mejia Bernal', 'CC', '1073709068', 'M', 'A', '25754', 2400000, '25000', 'SL'),
('Karla Andrea', 'Loepardi Gomez', 'CC', '1092157210', 'F', 'I', '11001', 1500000, '30000', 'SL'),
('Juan David', 'Hurtado Rodriguez', 'CC', '1123800894', 'M', 'A', '11001', 3600000, '45000', 'SL'),
('Brayan Steven', 'Ramirez Diaz', 'CC', '1193549523', 'M', 'A', '11001', 3200000, '35000', 'SL'),
('Juan Esteban', 'Perez Sanchez', 'CC', '1234987632', 'M', 'A', '63001', 5200000, '30000', 'SL'),
('Sandra Viviana', 'L�pez Chara', 'CC', '1267875423', 'F', 'A', '11001', 3400000, '25000', 'SL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `COD_ESTADO` varchar(1) NOT NULL,
  `DES_ESTADO` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`COD_ESTADO`, `DES_ESTADO`) VALUES
('A', 'ACTIVO'),
('I', 'INACTIVO'),
('R', 'RETIRADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `COD_ESTCIVIL` varchar(2) NOT NULL,
  `DES_ESTADOCIVIL` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_civil`
--

INSERT INTO `estado_civil` (`COD_ESTCIVIL`, `DES_ESTADOCIVIL`) VALUES
('CA', 'CASADO'),
('DI', 'DIVORCIADO'),
('SL', 'SOLTERO'),
('UL', 'UNION LIBRE'),
('VI', 'VIUDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `COD_GENERO` varchar(1) NOT NULL,
  `DES_GENERO` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`COD_GENERO`, `DES_GENERO`) VALUES
('B', 'Bisexual'),
('F', 'Femenino'),
('G', 'Gay'),
('L', 'Lesbiana'),
('M', 'Masculino'),
('T', 'Transexual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_documentos`
--

CREATE TABLE `tipos_documentos` (
  `TIPO_DOC` varchar(4) NOT NULL,
  `DES_TIPODOC` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_documentos`
--

INSERT INTO `tipos_documentos` (`TIPO_DOC`, `DES_TIPODOC`) VALUES
('CC', 'C�dula Ciudadania'),
('CE', 'C�dula Extranjeria'),
('NIT', 'N.I.T.'),
('PS', 'Pasaporte'),
('TI ', 'Tarjeta Identidad');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`COD_AREA`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`COD_DEPTO`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`NUM_DOCUMENTO`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`COD_ESTADO`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`COD_ESTCIVIL`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`COD_GENERO`);

--
-- Indices de la tabla `tipos_documentos`
--
ALTER TABLE `tipos_documentos`
  ADD PRIMARY KEY (`TIPO_DOC`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
