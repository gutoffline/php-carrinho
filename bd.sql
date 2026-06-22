-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/06/2026 às 01:14
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
-- Banco de dados: `bd_exemplo_carrinho`
--
CREATE DATABASE IF NOT EXISTS `bd_exemplo_carrinho` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_exemplo_carrinho`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_clientes`
--

CREATE TABLE `tb_clientes` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `CIDADE` varchar(100) NOT NULL,
  `UF` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_clientes`
--

INSERT INTO `tb_clientes` (`ID`, `NOME`, `CIDADE`, `UF`) VALUES
(1, 'João Silva', 'São Paulo', 'SP'),
(2, 'Maria Santos', 'Rio de Janeiro', 'RJ'),
(3, 'Pedro Costa', 'Belo Horizonte', 'MG'),
(4, 'Ana Oliveira', 'Curitiba', 'PR'),
(5, 'Lucas Souza', 'Porto Alegre', 'RS'),
(6, 'Fernanda Lima', 'Salvador', 'BA'),
(7, 'Rafael Gomes', 'Fortaleza', 'CE'),
(8, 'Juliana Alves', 'Recife', 'PE'),
(9, 'Carlos Pereira', 'Manaus', 'AM'),
(10, 'Camila Ribeiro', 'Brasília', 'DF'),
(11, 'Bruno Martins', 'Campinas', 'SP'),
(12, 'Patrícia Rocha', 'Americana', 'SP'),
(13, 'Diego Fernandes', 'Goiânia', 'GO'),
(14, 'Amanda Carvalho', 'Belém', 'PA'),
(15, 'Rodrigo Mendes', 'Vitória', 'ES'),
(16, 'Letícia Barbosa', 'Florianópolis', 'SC'),
(17, 'Marcelo Castro', 'Natal', 'RN'),
(18, 'Beatriz Araújo', 'João Pessoa', 'PB'),
(19, 'Felipe Nogueira', 'Maceió', 'AL'),
(20, 'Carolina Teixeira', 'Teresina', 'PI');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_itens_venda`
--

CREATE TABLE `tb_itens_venda` (
  `ID` int(11) NOT NULL,
  `ID_VENDA` int(11) NOT NULL,
  `ID_PRODUTOS` int(11) NOT NULL,
  `QTD_VENDIDO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_produtos`
--

CREATE TABLE `tb_produtos` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `QTD` int(11) NOT NULL,
  `PRECO` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_produtos`
--

INSERT INTO `tb_produtos` (`ID`, `NOME`, `QTD`, `PRECO`) VALUES
(1, 'Notebook Dell XPS 13', 10, 8500),
(2, 'MacBook Air M2', 15, 9200),
(3, 'Mouse Sem Fio Logitech MX Master 3', 50, 600),
(4, 'Teclado Mecânico Keychron K2', 30, 750),
(5, 'Monitor Dell UltraSharp 27', 20, 3200),
(6, 'Smartphone Apple iPhone 14 Pro', 25, 7500),
(7, 'Smartphone Samsung Galaxy S23 Ultra', 20, 6800),
(8, 'Tablet Apple iPad Air', 18, 5400),
(9, 'Smartwatch Apple Watch Series 8', 35, 3800),
(10, 'Fone de Ouvido Sony WH-1000XM5', 40, 2500),
(11, 'Placa de Vídeo NVIDIA RTX 4070', 12, 4500),
(12, 'Placa de Vídeo AMD Radeon RX 7900 XT', 10, 5800),
(13, 'Processador Intel Core i9-13900K', 15, 3900),
(14, 'Processador AMD Ryzen 9 7950X', 14, 4100),
(15, 'Placa-Mãe ASUS ROG Strix B650', 20, 1800),
(16, 'Memória RAM Corsair Vengeance 32GB DDR5', 45, 900),
(17, 'SSD NVMe Samsung 980 PRO 1TB', 60, 850),
(18, 'SSD Kingston NV2 2TB', 55, 700),
(19, 'HD Externo Seagate 4TB', 30, 650),
(20, 'Fonte Corsair RM850x 850W', 25, 950),
(21, 'Gabinete NZXT H510', 20, 600),
(22, 'Water Cooler Corsair H150i', 15, 1200),
(23, 'Roteador TP-Link Wi-Fi 6 AX3000', 40, 450),
(24, 'Webcam Logitech C920s', 50, 400),
(25, 'Microfone HyperX QuadCast', 25, 900),
(26, 'Nobreak SMS Station II 1200VA', 15, 750),
(27, 'Impressora Multifuncional Epson EcoTank L3250', 20, 1100),
(28, 'Cadeira Gamer XT Racer', 10, 1300),
(29, 'Mesa Digitalizadora Wacom Intuos', 30, 500),
(30, 'Headset Gamer Razer BlackShark V2', 40, 700);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_vendas`
--

CREATE TABLE `tb_vendas` (
  `ID` int(11) NOT NULL,
  `DATA_HORA` timestamp NOT NULL DEFAULT current_timestamp(),
  `ID_CLIENTE` int(11) NOT NULL,
  `TOTAL` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `tb_itens_venda`
--
ALTER TABLE `tb_itens_venda`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `tb_vendas`
--
ALTER TABLE `tb_vendas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_clientes`
--
ALTER TABLE `tb_clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `tb_itens_venda`
--
ALTER TABLE `tb_itens_venda`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_produtos`
--
ALTER TABLE `tb_produtos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `tb_vendas`
--
ALTER TABLE `tb_vendas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
