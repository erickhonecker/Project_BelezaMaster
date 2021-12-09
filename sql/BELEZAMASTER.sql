-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 02, 2016 at 05:15 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
 
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `BELEZAMASTER`
--

-- --------------------------------------------------------

--
-- Table structure for table `ATENDIMENTO`
--

CREATE TABLE IF NOT EXISTS `ATENDIMENTO` (
  `horario` datetime DEFAULT NULL,
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `id_profissional` int(11) NOT NULL,
  `codigo_servico` int(11) NOT NULL,
  `cpf_usuario` varchar(14) NOT NULL,
  `data_atendimento` datetime DEFAULT NULL,
  `situacao` char(1) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `ID_Profissional` (`id_profissional`),
  KEY `Codigo_Servico` (`codigo_servico`),
  KEY `CPF_Usuario` (`cpf_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PERFIL`
--

CREATE TABLE IF NOT EXISTS `PERFIL` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Dumping data for table `PERFIL`
--
delete from TELA WHERE codigo = 1;
select * from TELA;
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'exibirAlterarDadosUsuario');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'exibirAlterarUsuario');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'alterarUsuario');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'exibirListarUsuario');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'pesquisarUsuario');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'removerUsuario');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'recuperarPorEmail');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'esqueciMinhaSenha');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'AlterarSenha');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'efetuarLogin');
INSERT INTO `TELA` (`codigo`, `url_mapping`) VALUES (1, 'logout');


-- --------------------------------------------------------

--
-- Table structure for table `PRODUTO`
--

CREATE TABLE IF NOT EXISTS `PRODUTO` (
  `nome_produto` varchar(30) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `PRODUTO`
--

INSERT INTO `PRODUTO` (`nome_produto`, `descricao`, `codigo`, `quantidade`, `valor`) VALUES
('Pente', 'Azul', 6, 3, 5),
('Escova', 'Prata', 7, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `PROFISSIONAL`
--

CREATE TABLE IF NOT EXISTS `PROFISSIONAL` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `profissao` varchar(30) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) NOT NULL,
  `telefone` varchar(13) DEFAULT NULL,
  `celular` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`email`),
  UNIQUE KEY `Cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


-- --------------------------------------------------------

--
-- Table structure for table `SERVICO`
--

CREATE TABLE IF NOT EXISTS `SERVICO` (
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------
-- Table structure for table `TELA`
--
CREATE TABLE IF NOT EXISTS `TELA` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `url_mapping` varchar(60) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

USE BELEZAMASTER;
select * from TELA;

-- INSERT INTO do Url_Mapping de UsuarioController
	INSERT INTO `TELA` (`url_mapping`) VALUES ('exibirAlterarDadosUsuario');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'exibirAlterarUsuario');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'alterarUsuario');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'exibirListarUsuario');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'pesquisarUsuario');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'removerUsuario');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'recuperarPorEmail');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'esqueciMinhaSenha');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'AlterarSenha');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'efetuarLogin');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'logout');

-- INSERT INTO do Url_Mapping de ProdutoController
INSERT INTO `TELA` (`url_mapping`) VALUES ('exibirIncluirProduto');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'incluirProduto');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'exibirAlterarProduto');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'alterarProduto');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'exibirListarProduto');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'pesquisarProduto');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'removerProduto');


-- INSERT INTO do Url_Mapping de ServicoController
INSERT INTO `TELA` (`url_mapping`) VALUES ('exibirIncluirServico');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'incluirServico');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'exibirListarServico');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'pesquisarServico');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'exibirAlterarServico');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'alterarServico');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'removerServico');



-- INSERT INTO do Url_Mapping de ProfissionalController
INSERT INTO `TELA` (`url_mapping`) VALUES ('exibirIncluirProfissional');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'incluirProfissional');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'exibirListarProfissional');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'pesquisarProfissional');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'exibirAlterarProfissional');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'alterarProfissional');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'removerProfissional');

-- INSERT INTO do Url_Mapping de AtendimentoController
INSERT INTO `TELA` (`url_mapping`) VALUES ('exibirIncluirAtendimento');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'fazerReserva');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'exibirListarAtendimento');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'PesquisarRegistrarAtendimento');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'pesquisarFinalizarAtendimento');
	INSERT INTO `TELA` ( `url_mapping`) VALUES ( 'exibirFinalizarAtendimento');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'finalizarAtendimento');
	INSERT INTO `TELA` (`url_mapping`) VALUES ( 'removerCancelar');
select * from TELA;
-- --------------------------------------------------------

--
-- Table structure for table `TELA_PERFIL`
--

CREATE TABLE IF NOT EXISTS `TELA_PERFIL` (
  `codigo_perfil` int(11) NOT NULL,
  `codigo_tela` int(11) NOT NULL,
  KEY `codigo_perfil` (`codigo_perfil`),
  KEY `codigo_tela` (`codigo_tela`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




select * from TELA_PERFIL;
select * from TELA;
DELETE FROM TELA_PERFIL WHERE codigo_perfil = 1 AND codigo_tela = 70;
DELETE FROM TELA_PERFIL WHERE codigo_perfil = 1 AND codigo_tela = 71;
DELETE FROM TELA_PERFIL WHERE codigo_perfil = 1 AND codigo_tela = 72;
DELETE FROM TELA_PERFIL WHERE codigo_perfil = 1 AND codigo_tela = 73;
DELETE FROM TELA_PERFIL WHERE codigo_perfil = 1 AND codigo_tela = 74;
DELETE FROM TELA_PERFIL WHERE codigo_perfil = 1 AND codigo_tela = 75;

select * from USUARIO;
DELETE FROM USUARIO WHERE cpf = '108.365.444-63' AND codigo_perfil = 3;


-- INSERT INTO dos codigos de perfil e tela 
select * from TELA;

					/*   CADASTRO DAS TELA_PERFIL*/

	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,1);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,2);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,3);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,4);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,5);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,6);     
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,7);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,8);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,9);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,10);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,11);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,12);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,13);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,14);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,15);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,16);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,17);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,18);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,19);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,20);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,21);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,22);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,23);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,24);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,25);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,26);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,27);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,28);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,29);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,30);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,31);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,32);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,33);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,34);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,35);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,36);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,37);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,38);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,39);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,40);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,41);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,42);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,43);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,44);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,45); 
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,46);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,47);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,48);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,49);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,50);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,51);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,52);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,53);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,54);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,55); 
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,56);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,57);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,58);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,59);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,60);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,61);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,62);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,63);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,64);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,65);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,66);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,67);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,68);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,69);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,70);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,71);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,72);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,73);
	INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,74);
    INSERT INTO `TELA_PERFIL` (`codigo_perfil`,`codigo_tela`) VALUES (1,75); 

-- --------------------------------------------------------

--
-- Table structure for table `USUARIO`
--
select * from USUARIO;
CREATE TABLE IF NOT EXISTS `USUARIO` (
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(34) NOT NULL,
  `cpf` varchar(14) NOT NULL DEFAULT '',
  `telefone` varchar(13) DEFAULT NULL,
  `celular` varchar(14) NOT NULL,
  `codigo_perfil` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `Cpf` (`cpf`),
  UNIQUE KEY `Email` (`email`),
  KEY `codigo_perfil` (`codigo_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO USUARIO (nome,email,senha,cpf,telefone,celular,codigo_perfil) VALUES ('Erick', 'erick_honecker@hotmail.com', 91226714, '108.365.444-63', 8135357186, 81991226714, 1);
-- Dumping data for table `USUARIO`
select * from USUARIO;--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `ATENDIMENTO`
--
ALTER TABLE `ATENDIMENTO`
  ADD CONSTRAINT `ATENDIMENTO_ibfk_1` FOREIGN KEY (`ID_Profissional`) REFERENCES `PROFISSIONAL` (`ID`),
  ADD CONSTRAINT `ATENDIMENTO_ibfk_2` FOREIGN KEY (`Codigo_Servico`) REFERENCES `SERVICO` (`Codigo`),
  ADD CONSTRAINT `ATENDIMENTO_ibfk_3` FOREIGN KEY (`CPF_Usuario`) REFERENCES `USUARIO` (`Cpf`),
  ADD CONSTRAINT `codigo_servico` FOREIGN KEY (`codigo_servico`) REFERENCES `SERVICO` (`codigo`),
  ADD CONSTRAINT `cpf_usuario` FOREIGN KEY (`cpf_usuario`) REFERENCES `USUARIO` (`cpf`),
  ADD CONSTRAINT `id_profissional` FOREIGN KEY (`id_profissional`) REFERENCES `PROFISSIONAL` (`id`);

--
-- Constraints for table `TELA_PERFIL`
--
ALTER TABLE `TELA_PERFIL`
  ADD CONSTRAINT `TELA_PERFIL_ibfk_1` FOREIGN KEY (`codigo_perfil`) REFERENCES `PERFIL` (`codigo`),
  ADD CONSTRAINT `TELA_PERFIL_ibfk_2` FOREIGN KEY (`codigo_tela`) REFERENCES `TELA` (`codigo`);

SELECT * FROM USUARIO u join TELA_PERFIL p on u.codigo_perfil = p.codigo_perfil join TELA t on p.codigo_tela = t.codigo WHERE u.cpf = '108.365.444-63' AND t.url_mapping = 'exibirIncluirUsuario';
--

SELECT * FROM USUARIO u join TELA_PERFIL tp on u.codigo_perfil = tp.codigo_perfil join TELA t on tp.codigo_tela = 
t.codigo WHERE u.cpf = '108.365.444-63' AND t.url_mapping = 'exibirListarAtendimento' ;
-- Constraints for table `USUARIO`
--

