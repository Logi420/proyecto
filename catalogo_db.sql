--
-- Base de datos: `catalogo_db`
--
CREATE DATABASE IF NOT EXISTS `catalogo_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `catalogo_db`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE categoria (
    id_categoria int NOT NULL,
    descripcion varchar(50) NOT NULL,
    PRIMARY KEY (id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `producto`
--
CREATE TABLE producto (
    id_producto varchar(10) NOT NULL,
    id_categoria int NOT NULL,
    nombre varchar(100) NOT NULL,
	precio numeric(15,2) NOT NULL,
    descripcion varchar(200),
    PRIMARY KEY (id_producto),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `usuario`
--
CREATE TABLE usuario (
    id_usuario int NOT NULL,
    nombres varchar(50) NOT NULL,
    apellidos varchar(50) NOT NULL,
	direccion varchar(100),
    telefono varchar(50),
	email varchar(50) NOT NULL,
    contrasena varchar(10) NOT NULL,
    PRIMARY KEY (id_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `ventas`
--
CREATE TABLE ventas (
    id_venta int NOT NULL,
    id_usuario int NOT NULL,
    fecha datetime NOT NULL,
	direccion varchar(100),
    telefono varchar(50),
	subtotal numeric(15,2) NOT NULL,
    total_iva numeric(15,2) NOT NULL,
	total numeric(15,2) NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
--
-- Estructura de tabla para la tabla `detalle_ventas`
--
CREATE TABLE detalle_ventas (
    id_venta int NOT NULL,
    id_producto varchar(10) NOT NULL,
    precio datetime NOT NULL,
	cantidad numeric(15,2) NOT NULL,
    descuento numeric(15,2) NOT NULL,
	subtotal numeric(15,2) NOT NULL,
    iva numeric(15,2) NOT NULL,
	total numeric(15,2) NOT NULL,
    PRIMARY KEY (id_venta,id_producto),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (id_producto) REFERENCES producto(id_producto) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
-- --------------------------------------------------------
