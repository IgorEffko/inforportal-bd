-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/10/2026 às 13:14
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `infoportal`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `tags` varchar(500) DEFAULT NULL,
  `imagem` varchar(500) DEFAULT NULL,
  `resumo` varchar(300) NOT NULL,
  `conteudo` longtext NOT NULL,
  `autor_id` int(11) NOT NULL,
  `status` enum('RASCUNHO','EM_REVISAO','APROVADA','PUBLICADA','REJEITADA','ARQUIVADA') NOT NULL DEFAULT 'RASCUNHO',
  `justificativa` text DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data_publicacao` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `categoria`, `tags`, `imagem`, `resumo`, `conteudo`, `autor_id`, `status`, `justificativa`, `data_criacao`, `data_atualizacao`, `data_publicacao`) VALUES
(1, 'Aluno fica bilionário!', 'economia', 'educação', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAA0JCgsKCA0LCgsODg0PEyAVExISEyccHhcgLikxMC4pLSwzOko+MzZGNywtQFdBRkxOUlNSMj5aYVpQYEpRUk8BDg4OExETJhUVJk81LTVPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT//AABEIAKQA9gMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAEBQACAwYBB//EADwQAAIBAwIEBAMGBQMEAwEAAAECAwAEERIhBTFBURMiYXEUMoEGQpGhscEjUtHh8BUzYiRDkvEWcoJT/8QAGQEAAwEBAQAAAAAAAAAAAAAAAQIDBAAF/8QAJBEAAgICAgICAwEBAAAAAAAAAAECEQMhEjEiQQRhEzJRcUL/2gAMAwEAAhEDEQA/AClhki8ratB5f8KrYSS2N', 'teste', 'teste', 1, 'APROVADA', NULL, '2026-10-30 11:14:50', '2026-10-30 11:49:15', NULL),
(2, 'teste', 'tecnologia', 'ads', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnEyucio-l2munPnXdpvE4B28ejdX3qV-xi49PYSURCw&s=10', 'teste', 'teste', 1, 'REJEITADA', 'teste do botão \"rejeitar\"', '2026-10-30 11:39:54', '2026-10-30 11:49:48', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `senha` varchar(255) NOT NULL,
  `perfil` enum('leitor','jornalista','editor','administrador') NOT NULL DEFAULT 'leitor',
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `data_nascimento`, `senha`, `perfil`, `data_cadastro`) VALUES
(1, 'Igor Effko Vendruscolo', 'igor@gmail.com', '2009-12-12', '$2b$12$elYVIJPEqg6zrNcE5npt9OmqsxpsidytdR/fMU3dj5dwXkGoIMonW', 'jornalista', '2026-10-29 12:00:59'),
(2, 'Nicoli Muller', 'nicoli@gmail.com', '2009-12-05', '$2b$12$pMDo.D9SPHehJuEbvSZ75O89W/A4BmSPccWewQvImy/8QAjFLIiKi', 'editor', '2026-10-30 11:36:20'),
(3, 'administrador', 'admin@gmail.com', '2009-03-03', '$2b$12$w7R3taHt81Br1XJALWxDBOqdCGU3RJf5gCyiFV6ixWZtJ4JHs9CGy', 'administrador', '2026-10-30 11:58:51');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_noticias_autor` (`autor_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `fk_noticias_autor` FOREIGN KEY (`autor_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
