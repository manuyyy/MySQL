-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Set-2020 às 04:20
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `academico_revisao`
--
CREATE DATABASE IF NOT EXISTS `academico_revisao` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `academico_revisao`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE `cursos` (
  `idcurso` int(11) NOT NULL DEFAULT 0,
  `nome` varchar(30) NOT NULL,
  `descricao` text DEFAULT NULL,
  `carga` int(10) UNSIGNED DEFAULT NULL,
  `ano` year(4) DEFAULT 2016,
  `vagas` smallint NOT NULL DEFAULT 0,
  `matriculados` smallint NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`idcurso`, `nome`, `descricao`, `carga`, `ano`, `vagas`, `matriculados`) VALUES
(1, 'Algoritmos', 'Lógica de Programação', 20, 2014, 5, 0),
(2, 'PHP', 'Curso de PHP para iniciantes', 40, 2015, 10, 2),
(3, 'Java', 'Introdução à Linguagem Java', 40, 2015, 5, 0),
(4, 'MySQL', 'Bancos de Dados MySQL', 30, 2016, 8, 0),
(5, 'C++', 'Curso de C++ com Orientação a Objetos', 40, 2017, 7, 1),
(6, 'Android', 'Curso de Desenvolvimento de Aplicativos para Android', 60, 2018, 6, 2),
(7, 'JavaScript', 'Curso de JavaScript', 35, 2017, 5, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudantes`
--

CREATE TABLE `estudantes` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `sexo` enum('M','F') DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT 'Brasil',
  `cursopreferido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `estudantes`
--

INSERT INTO `estudantes` (`id`, `nome`, `nascimento`, `sexo`, `nacionalidade`, `cursopreferido`) VALUES
(1, 'Daniel Gabriel', '1984-01-02', 'M', 'Brasil', 7),
(2, 'Talita Morais', '1999-12-30', 'F', 'Portugal', 7),
(3, 'Emerson Nascimento', '1920-12-30', 'M', 'Moçambique', 1),
(4, 'Letícia Damasceno', '1930-11-02', 'M', 'Irlanda', 2),
(5, 'Leila Couto ', '1975-04-22', 'F', 'Brasil', 3),
(6, 'Lucas Neves', '1999-12-03', 'F', 'Brasil', 4),
(7, 'Janaína Martins', '1987-11-12', 'F', 'EUA', 1),
(8, 'João Rosa', '2010-08-01', 'M', 'Brasil', 1),
(9, 'Pedro Telles', '1999-01-23', 'M', 'Portugal', 1),
(10, 'Rita Araujo', '1975-12-10', 'M', 'EUA', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estudante_assiste_curso`
--

CREATE TABLE `estudante_assiste_curso` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `idestudante` int(11) DEFAULT NULL,
  `idcurso` int(11) DEFAULT NULL,
  `Nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `estudante_assiste_curso`
--

INSERT INTO `estudante_assiste_curso` (`id`, `data`, `idestudante`, `idcurso`, `Nota`) VALUES
(1, '2020-05-18', 1, 2, 10),
(2, '2020-05-18', 1, 5, 8),
(3, '2023-06-22', 1, 6, 7),
(4, '2022-04-11', 1, 6, 0),
(5, '2020-03-12', 1, 2, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idcurso`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `estudantes`
--
ALTER TABLE `estudantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pk_c` (`cursopreferido`);

--
-- Índices para tabela `estudante_assiste_curso`
--
ALTER TABLE `estudante_assiste_curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idestudante` (`idestudante`),
  ADD KEY `idcurso` (`idcurso`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estudantes`
--
ALTER TABLE `estudantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `estudante_assiste_curso`
--
ALTER TABLE `estudante_assiste_curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estudantes`
--
ALTER TABLE `estudantes`
  ADD CONSTRAINT `pk_c` FOREIGN KEY (`cursopreferido`) REFERENCES `cursos` (`idcurso`);

--
-- Limitadores para a tabela `estudante_assiste_curso`
--
ALTER TABLE `estudante_assiste_curso`
  ADD CONSTRAINT `estudante_assiste_curso_ibfk_1` FOREIGN KEY (`idestudante`) REFERENCES `estudantes` (`id`),
  ADD CONSTRAINT `estudante_assiste_curso_ibfk_2` FOREIGN KEY (`idcurso`) REFERENCES `cursos` (`idcurso`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
