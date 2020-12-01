-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2020 a las 20:29:37
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cinema_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `id_pelicula` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `puntaje` int(1) NOT NULL,
  `comentario` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `id_pelicula`, `id_usuario`, `puntaje`, `comentario`) VALUES
(56, 56, 4, 5, 'Buena pelichee'),
(57, 56, 4, 5, 'Buena pelichee xd'),
(58, 56, 1, 3, 'ctfvy'),
(59, 60, 1, 5, 'Buena pelicula'),
(60, 63, 1, 5, 'No me gusto nada, no es como la trilogía original. pasen por la tienda de historietas cómicas y lo arreglamos.'),
(61, 65, 1, 5, 'No se. En el libro K no es negro. Pero como odiar a Will Smith...'),
(62, 68, 1, 1, 'Re aburridaaaa'),
(63, 62, 1, 2, 'La recordaba mejor xd'),
(64, 60, 8, 5, 'MUY BUENAAA! No puedo esperar a que salga la 4. ah no, es verdad que ya termino la saga. Bueno, a leer los libros xd'),
(65, 61, 8, 5, 'Muy bueeenaaaaaaaaaaa. No soy critico de cine, pero es espectacula. Salu3'),
(66, 62, 8, 5, 'Muy buena, me encanta como la primea vez que la vi.'),
(67, 67, 8, 5, 'La voy a ver porque esta el pibe Zack o Codi ya ni los reconozco bien. Como pasan los años ajjasjashadshbadslbj'),
(68, 66, 8, 5, 'Muy buena adaptación del liblo. Claramente es porque el guinista es el mismo escritor original. Recomiendo.'),
(69, 65, 8, 5, 'El que no es negro es J, animal...'),
(70, 64, 2, 5, '*SPOILERS* Claramente DiCaprio esta dormido.'),
(71, 62, 2, 5, 'No se, a mis nenes les encanto. Yo prefiero Rambo.'),
(72, 56, 2, 3, 'La vi en la tele de chico. Ahora no esta tan buena pero vale la pena. NICE'),
(73, 59, 2, 4, 'No se si es Mr T pero tienen el mismo estilo. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id_genero`, `nombre`) VALUES
(28, 'Drama'),
(29, 'Ciencia ficción'),
(32, 'Comedia'),
(33, 'Romantico'),
(34, 'Acción ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `sinopsis` varchar(200) NOT NULL,
  `duracion` varchar(10) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `puntuacion` int(11) NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `sinopsis`, `duracion`, `id_genero`, `puntuacion`, `precio`, `imagen`) VALUES
(56, 'Yo Robot', 'Argumento. La acción está ambientada en el año 2035, en la ciudad de Chicago, en el cual los robots humanoides forman parte de la vida cotidiana en la Tierra y son la principal fuerza laboral de la es', '2:00hs', 29, 3, 567, './imagenes/imagenes-de-usuario/5fc57c9dbeb780.23658993.jpg'),
(59, 'Brigada A', 'El Coronel Hannibal Smith (Liam Neeson) es el líder de \"El Equipo A\", una unidad especial de veteranos de la guerra de Iraq, antiguos soldados de las Fuerzas Especiales que fueron acusados de un crime', '121min', 34, 3, 3456, './imagenes/imagenes-de-usuario/5fc691edbbdcc5.16384803.jpg'),
(60, 'Maze Runner', 'cuenta la historia de Thomas y los habitantes del Área, el lugar al que llega después de despertar dentro de una caja/elevador y se encuentra con otros jóvenes como él, que han logrado crear toda una ', '160min', 28, 4, 654, './imagenes/imagenes-de-usuario/5fc692316c4398.53961310.jpg'),
(61, 'The Professional', 'Mathilda es una niña que no se lleva bien con su familia, excepto con su hermano pequeño. Su padre es un narcotraficante que hace negocios con Stan, un corrupto agente de la D.E.A. Un día Stan mata a ', '160min', 34, 4, 764, './imagenes/imagenes-de-usuario/5fc69299996a58.87722509.jpg'),
(62, 'Piratas del Caribe', 'Diez años después de que el Capitán Barbosa abandonase al Capitán Jack Sparrow en una isla desierta con una pistola y un tiro y él zarpase con el Perla Negra, en 1728, el infame pirata Jack Sparrow ap', '180min', 34, 3, 8653, './imagenes/imagenes-de-usuario/5fc692dc2e3303.48393979.jpg'),
(63, 'Star Wars', 'La Resistencia sobreviviente se enfrenta a la Primera Orden, y Rey, Finn, Poe y el resto de los héroes encararán nuevos retos y una batalla final con la sabiduría de las generaciones anteriores.', '180min', 29, 3, 8574, './imagenes/imagenes-de-usuario/5fc69348c42c65.60333257.jpg'),
(64, 'Inception', 'Dom Cobb (DiCaprio) es el mejor del mundo en el arte de la extracción: apropiarse de los secretos del subconsciente justo en el momento en que la mente de la víctima es más vulnerable: durante el sueñ', '180min', 29, 4, 12375, './imagenes/imagenes-de-usuario/5fc6939b61fc39.27135935.jpg'),
(65, 'Man In Black ', 'En esta entrega, los Hombres de Negro, que siempre han protegido la Tierra, deben descubrir un topo dentro de la organización MIB. Para luchar contra unos nuevos malévolos aliens camuflados como human', '180min', 29, 4, 1236, './imagenes/imagenes-de-usuario/5fc693d2098108.00877780.jpg'),
(66, 'Las ventajas de ser invisible', 'La novela trata sobre un año en la vida de Charlie, desde sus 15 hasta sus 16 años. El joven, retraido y antisocial, ve cambiar su vida cuando conoce a Sam y Patrick, que van a ser muy importantes en ', '180min', 33, 4, 4567, './imagenes/imagenes-de-usuario/5fc69425eed730.14544297.jpg'),
(67, 'A dos metros de ti ', 'Stella Grant es una paciente con fibrosis quística que utiliza activamente las redes sociales para hacer frente a su enfermedad y trata de vivir una vida normal. ... Al día siguiente es el cumpleaños ', '160min', 33, 4, 1234, './imagenes/imagenes-de-usuario/5fc69473950e48.72356105.jpg'),
(68, 'Yo soy Simon', ' Todo mundo merece una gran historia de amor. Pero para Simon Spier, un chico de diecisiete años, resulta ser un poco más complicado: todavía no le dice a su familia o amigos que es gay, y, de hecho, ', '160min', 33, 4, 7632, './imagenes/imagenes-de-usuario/5fc694a5a3c083.55004050.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `superUser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `userName`, `email`, `password`, `superUser`) VALUES
(1, 'User1', 'user1@mail.com', '$2y$10$.MhrrRPigd7YGHPCaT/exuRUkw3wJMfTTvl3r8wBfknTvGxRsDdkm', 1),
(2, 'User2', 'user2@mail.com', '$2y$10$Cv4xXgWdHtaBlebtcpGKJ.IS1hwCExFzQ75Vtax42yOT4.eRAMtyS', 0),
(4, 'Angi', 'angi@mail.com', '$2y$10$RlVOLr7UyhWQiRY/QiutveT2kk5Tz9U5pYaDSM.emVM4nWroQx.Hm', 0),
(7, 'User5', 'user5@mail.com', '$2y$10$sziISyAncVmjDjbSNo8/dut7Nhi7ySikZ8G1Sp5I4E6X8kuvt7lpa', 0),
(8, 'Nicoco', 'nicoco@mail.com', '$2y$10$K1rpjRuy0pqkh8K5QM8Ooes1XnsO9jnQfqgWNLNYS8zMpNRGCzyQS', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pelicula` (`id_pelicula`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
