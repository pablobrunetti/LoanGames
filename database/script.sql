-- MySQL Script generated by MySQL Workbench
-- sáb 09 jan 2021 18:13:43
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema loanGames
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema loanGames
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `loanGames` ;
USE `loanGames` ;

-- -----------------------------------------------------
-- Table `loanGames`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loanGames`.`Usuario` (
  `id` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `ativo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loanGames`.`Jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loanGames`.`Jogo` (
  `id` INT NOT NULL,
  `nome` VARCHAR(200) NOT NULL,
  `console` VARCHAR(100) NOT NULL,
  `observacao` VARCHAR(500) NULL,
  `ativo` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loanGames`.`Amigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loanGames`.`Amigo` (
  `id` INT NOT NULL,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(150) NULL,
  `celular` VARCHAR(100) NULL,
  `observacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loanGames`.`Emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loanGames`.`Emprestimo` (
  `id` INT NOT NULL,
  `data_Inicio` DATETIME NOT NULL,
  `id_Amigo` INT NOT NULL,
  `Amigo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Amigo_id`),
  INDEX `fk_Emprestimo_Amigo1_idx` (`Amigo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Emprestimo_Amigo1`
    FOREIGN KEY (`Amigo_id`)
    REFERENCES `loanGames`.`Amigo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loanGames`.`EmprestimoJogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loanGames`.`EmprestimoJogo` (
  `jogo_id` INT NOT NULL,
  `emprestimo_id` INT NOT NULL,
  `data_devolucao` DATETIME NULL,
  `status` VARCHAR(100) NULL,
  PRIMARY KEY (`jogo_id`, `emprestimo_id`),
  INDEX `fk_Jogo_has_Emprestimo_Emprestimo1_idx` (`emprestimo_id` ASC) VISIBLE,
  INDEX `fk_Jogo_has_Emprestimo_Jogo_idx` (`jogo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Jogo_has_Emprestimo_Jogo`
    FOREIGN KEY (`jogo_id`)
    REFERENCES `loanGames`.`Jogo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogo_has_Emprestimo_Emprestimo1`
    FOREIGN KEY (`emprestimo_id`)
    REFERENCES `loanGames`.`Emprestimo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `loanGames`.`Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `loanGames`;
INSERT INTO `loanGames`.`Usuario` (`id`, `nome`, `senha`, `ativo`) VALUES (1, 'admin', 'admin', 1);

COMMIT;

