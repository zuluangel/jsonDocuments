-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2024 a las 04:09:10
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nomina`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `creating_employee` (IN `nom_emp` VARCHAR(60), IN `ape_emp` VARCHAR(60), IN `tip_doc` VARCHAR(3), IN `num_doc` VARCHAR(20), IN `gen_emp` VARCHAR(1), IN `est_emp` VARCHAR(1), IN `mun_emp` VARCHAR(5), IN `sal_emp` INT, IN `are_emp` VARCHAR(5), IN `civ_emp` VARCHAR(2))   BEGIN
    INSERT INTO empleados (empleados.nombres, empleados.apellidos, empleados.cod_tipodoc, empleados.num_documento, empleados.cod_genero, empleados.cod_estado, empleados.cod_municipio, empleados.salario, empleados.cod_area, empleados.cod_estcivil) 
    VALUES (nom_emp, ape_emp, tip_doc,num_doc,gen_emp,est_emp,mun_emp,sal_emp,are_emp,civ_emp);
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `loading_employees` ()   BEGIN
	SELECT empleados.nombres, empleados.apellidos, empleados.nombres, empleados.cod_tipodoc, tiposdoc_txt.des_tipodoc, empleados.num_documento, empleados.cod_genero, generos.Des_genero, empleados.cod_estado, estados.des_estado, empleados.cod_municipio, departamentos.Nom_depto, empleados.salario, empleados.cod_area, areas.Des_area, empleados.cod_estcivil, estado_civil.des_estado_civil
    FROM empleados 
    INNER JOIN tiposdoc_txt ON empleados.cod_tipodoc = tiposdoc_txt.cod_tipodoc 
    INNER JOIN generos ON empleados.cod_genero = generos.Cod_genero 
    INNER JOIN estados ON empleados.cod_estado = estados.cod_estado 
    INNER JOIN departamentos ON LEFT (empleados.cod_municipio,2) = departamentos.Cod_depto 
    INNER JOIN areas ON empleados.cod_area = areas.Cod_area
    INNER JOIN estado_civil on empleados.cod_estcivil = estado_civil.codestcivil;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_employee` (IN `new_name` VARCHAR(60), IN `new_last` VARCHAR(60), IN `new_tip_doc` VARCHAR(2), IN `new_num_doc` VARCHAR(10), IN `new_gen` VARCHAR(1), IN `new_state` VARCHAR(1), IN `new_mun` VARCHAR(5), IN `new_salary` INT, IN `new_area` VARCHAR(5), IN `new_estcivil` VARCHAR(2))   BEGIN
    UPDATE empleados
    SET 
        nombres = IF(new_name IS NOT NULL, new_name, nombres),
        apellidos = IF(new_last IS NOT NULL, new_last, apellidos),
        cod_tipodoc = IF(new_tip_doc IS NOT NULL, new_tip_doc, cod_tipodoc),
        num_documento = IF(new_num_doc IS NOT NULL, new_num_doc, num_documento),
        cod_genero = IF(new_gen IS NOT NULL, new_gen, cod_genero),
        cod_estado = IF(new_state IS NOT NULL, new_state, cod_estado),
        cod_municipio = IF(new_mun IS NOT NULL, new_mun, cod_municipio),
        salario = IF(new_salary IS NOT NULL, new_salary, salario),
        cod_area = IF(new_area IS NOT NULL, new_area, cod_area),
        cod_estcivil = IF(new_estcivil IS NOT NULL, new_estcivil, cod_estcivil)
        
    WHERE num_documento = new_num_doc ;
    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `Cod_area` varchar(5) NOT NULL,
  `Des_area` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`Cod_area`, `Des_area`) VALUES
('20000', 'Producción'),
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
  `Cod_depto` varchar(2) NOT NULL,
  `Nom_depto` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`Cod_depto`, `Nom_depto`) VALUES
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
('52', 'NARIÑO'),
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
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(17) DEFAULT NULL,
  `cod_tipodoc` varchar(2) DEFAULT NULL,
  `num_documento` int(10) DEFAULT NULL,
  `cod_genero` varchar(1) DEFAULT NULL,
  `cod_estado` varchar(1) DEFAULT NULL,
  `cod_municipio` int(5) DEFAULT NULL,
  `salario` int(7) DEFAULT NULL,
  `cod_area` int(5) DEFAULT NULL,
  `cod_estcivil` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`nombres`, `apellidos`, `cod_tipodoc`, `num_documento`, `cod_genero`, `cod_estado`, `cod_municipio`, `salario`, `cod_area`, `cod_estcivil`) VALUES
('Yudi Xiomara', 'Molina Forero', 'CC', 1000135417, 'F', 'A', 11001, 2100000, 20000, 'SL'),
('Arleth Duvan', 'Ramirez Vera', 'CC', 1000990991, 'M', 'I', 11001, 1850000, 25000, 'SL'),
('Karla Andrea', 'Loepardi Gomez', 'CC', 1092157210, 'F', 'I', 11001, 1500000, 30000, 'SL'),
('Geraldine Fabiana', 'Ria�o Vargas', 'CC', 1000988685, 'F', 'A', 11001, 3100000, 35000, 'SL'),
('Daniela', 'Navarro Ascencio', 'CC', 1031642892, 'F', 'I', 11001, 1400000, 40000, 'SL'),
('Diana Mayerly', 'Ahumada Mahecha', 'CC', 1026581688, 'F', 'A', 25518, 2100000, 40000, 'SL'),
('Carlos Manuel', 'Mej�a Herrera', 'CC', 1070326569, 'M', 'A', 11001, 1850000, 35000, 'SL'),
('Diego Fernando', 'Guatibonza Erazo', 'CC', 1030697126, 'M', 'A', 11001, 3200000, 40000, 'SL'),
('Laura Alejandra', 'Sandoval Salazar', 'CC', 1000934782, 'F', 'A', 11001, 4000000, 20000, 'SL'),
('Nicolas', 'Henao Martinez', 'CC', 1011088352, 'M', 'A', 11001, 2000000, 30000, 'SL'),
('Thomas Jefrey', 'Rodriguez Ospina', 'TI', 1028481888, 'M', 'A', 11001, 1300000, 35000, 'SL'),
('Natalia', 'Garcia Moreno', 'CC', 1034278726, 'F', 'I', 11001, 1650000, 25000, 'SL'),
('Daniela Valentina', 'Barrera Oses', 'CC', 1013576918, 'F', 'A', 11001, 3200000, 30000, 'SL'),
('Carlos Andres', 'Morales Montes', 'CC', 1000381531, 'M', 'A', 11001, 4100000, 40000, 'SL'),
('Maria Paula', 'Arias Hurtado', 'CC', 1013099099, 'F', 'A', 11001, 3600000, 35000, 'SL'),
('Santiago', 'Mejia Bernal', 'CC', 1073709068, 'M', 'A', 25754, 2400000, 25000, 'SL'),
('Nataly', 'Sosa Yara', 'CC', 1073695794, 'F', 'A', 11001, 3200000, 30000, 'SL'),
('Marcos El�as', 'Montes Cruz', 'TI', 1064193348, 'M', 'A', 11001, 3200000, 45000, 'SL'),
('Luis Alberto', 'Martinez Martinez', 'CC', 1030697209, 'M', 'I', 11001, 4100000, 35000, 'SL'),
('Richard Efrain', 'Marcano Vargas', 'CC', 1032511437, 'M', 'A', 54001, 2600000, 25000, 'SL'),
('Sergio Antonio', 'Morales Zamudio', 'CC', 1000255735, 'M', 'A', 11001, 4000000, 45000, 'SL'),
('Giovany', 'Zuluaga Manrique', 'CC', 1002800495, 'M', 'A', 11001, 3400000, 35000, 'SL'),
('Jeison Alejandro', 'Zambrano Alzate', 'CC', 1024473795, 'M', 'A', 11001, 1800000, 25000, 'SL'),
('Dilan Jose', 'Villa Ramos', 'CC', 1043639243, 'M', 'A', 11001, 2300000, 45000, 'SL'),
('Santiago', 'Henao Ot�lora', 'CC', 1000129971, 'M', 'A', 11001, 2800000, 30000, 'SL'),
('Brayan Steven', 'Ramirez Diaz', 'CC', 1193549523, 'M', 'A', 11001, 3200000, 35000, 'SL'),
('Juan David', 'Hurtado Rodriguez', 'CC', 1123800894, 'M', 'A', 11001, 3600000, 45000, 'SL'),
('Juliana', 'Ocampo Ramirez', 'CC', 1018481308, 'F', 'A', 63001, 6000000, 20000, 'SL'),
('Juan Esteban', 'Perez Sanchez', 'CC', 1234987632, 'M', 'A', 63001, 5200000, 30000, 'SL'),
('Sandra Viviana', 'L�pez Chara', 'CC', 1267875423, 'F', 'A', 11001, 3400000, 25000, 'SL'),
('Juan', 'Lopez', 'CC', 1212212121, 'F', 'A', 11001, 2100000, 20000, 'CA'),
('Juan David', 'Hurtado Rodriguez', 'CC', 1202454545, 'F', 'A', 11001, 25000000, 25000, 'CA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `cod_estado` varchar(1) NOT NULL,
  `des_estado` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`cod_estado`, `des_estado`) VALUES
('A', 'ACTIVO'),
('I', 'INACTIVO'),
('R', 'RETIRADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `codestcivil` varchar(2) NOT NULL,
  `des_estado_civil` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_civil`
--

INSERT INTO `estado_civil` (`codestcivil`, `des_estado_civil`) VALUES
('CA', 'CASADO'),
('CO', 'DES_ESTADOCIVIL'),
('DI', 'DIVORCIADO'),
('SL', 'SOLTERO'),
('UL', 'UNION LIBRE'),
('VI', 'VIUDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `Cod_genero` varchar(1) NOT NULL,
  `Des_genero` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`Cod_genero`, `Des_genero`) VALUES
('B', 'Bisexual'),
('F', 'Femenino'),
('G', 'Gay'),
('L', 'Lesbiana'),
('M', 'Masculino'),
('T', 'Transexual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdoc_txt`
--

CREATE TABLE `tiposdoc_txt` (
  `cod_tipodoc` varchar(3) DEFAULT NULL,
  `des_tipodoc` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tiposdoc_txt`
--

INSERT INTO `tiposdoc_txt` (`cod_tipodoc`, `des_tipodoc`) VALUES
('CC', 'Cedula Ciudadania'),
('TI', 'Tarjeta Identidad'),
('CE', 'Cedula Extranjeria'),
('PS', 'Pasaporte'),
('NIT', 'N.I.T.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`Cod_area`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`Cod_depto`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`cod_estado`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`codestcivil`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`Cod_genero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
