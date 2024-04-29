-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb4 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria` (
  `idcategoria` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`provincia` (
  `idprovincia` INT(11) NOT NULL,
  `nombre_provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprovincia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`localidad` (
  `idlocalidad` INT(11) NOT NULL,
  `nombre_localidad` VARCHAR(45) NOT NULL,
  `idprovincia` INT(11) NOT NULL,
  PRIMARY KEY (`idlocalidad`),
  INDEX `idprovincia_idx` (`idprovincia` ASC),
  CONSTRAINT `idprovincia`
    FOREIGN KEY (`idprovincia`)
    REFERENCES `pizzeria`.`provincia` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`cliente` (
  `idCliente` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `codigo_postal` INT(11) NOT NULL,
  `idprovincia` INT(11) NOT NULL,
  `telefono` INT(11) NOT NULL,
  `idlocalidad` INT(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `idprovincia_idx` (`idprovincia` ASC),
  INDEX `idlocalidad_idx` (`idlocalidad` ASC),
  CONSTRAINT `idprovincia`
    FOREIGN KEY (`idprovincia`)
    REFERENCES `pizzeria`.`provincia` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idlocalidad`
    FOREIGN KEY (`idlocalidad`)
    REFERENCES `pizzeria`.`localidad` (`idlocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`tiendas` (
  `idtiendas` INT(11) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `codigo_postal` INT(11) NOT NULL,
  `idlocalidad` INT(11) NOT NULL,
  `idprovincia` INT(11) NOT NULL,
  PRIMARY KEY (`idtiendas`),
  INDEX `idprovincia_idx` (`idprovincia` ASC),
  INDEX `idlocalidad_idx` (`idlocalidad` ASC),
  CONSTRAINT `idprovincia`
    FOREIGN KEY (`idprovincia`)
    REFERENCES `pizzeria`.`provincia` (`idprovincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idlocalidad`
    FOREIGN KEY (`idlocalidad`)
    REFERENCES `pizzeria`.`localidad` (`idlocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleados` (
  `idempleados` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `DNI` INT(11) NOT NULL,
  `telefono` INT(11) NOT NULL,
  `cargo_cocina_u_operario` VARCHAR(45) NOT NULL,
  `idtiendas` INT(11) NOT NULL,
  PRIMARY KEY (`idempleados`),
  INDEX `idtiendas_idx` (`idtiendas` ASC),
  CONSTRAINT `idtiendas`
    FOREIGN KEY (`idtiendas`)
    REFERENCES `pizzeria`.`tiendas` (`idtiendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`entrega_reparto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`entrega_reparto` (
  `identrega` INT(11) NOT NULL,
  `idempleados` INT(11) NOT NULL,
  `feha_hora_entrega` DATETIME NOT NULL,
  PRIMARY KEY (`identrega`),
  INDEX `idempleados_idx` (`idempleados` ASC),
  CONSTRAINT `idempleados`
    FOREIGN KEY (`idempleados`)
    REFERENCES `pizzeria`.`empleados` (`idempleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`producto` (
  `idproducto` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `foto_producto` BLOB NOT NULL,
  `precio` FLOAT NOT NULL,
  `idcategoria` INT(11) NOT NULL,
  PRIMARY KEY (`idproducto`),
  INDEX `idcategoria_idx` (`idcategoria` ASC),
  CONSTRAINT `idcategoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `pizzeria`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedido` (
  `idpedido` INT(11) NOT NULL,
  `fecha_hora_pedido` DATETIME NOT NULL,
  `Tipo_entrega_pedido` VARCHAR(45) NOT NULL,
  `precio_total` FLOAT NOT NULL,
  `idCliente` INT(11) NOT NULL,
  `idtiendas` INT(11) NOT NULL,
  `cantidad_bebidas` INT(11) NOT NULL,
  `cantidad_pizzas` INT(11) NOT NULL,
  `cantidad_hamburguesas` INT(11) NOT NULL,
  `idproducto` INT(11) NOT NULL,
  `fecha_hora_entrega` DATETIME NOT NULL,
  PRIMARY KEY (`idpedido`),
  INDEX `idCliente_idx` (`idCliente` ASC),
  INDEX `idproducto_idx` (`idproducto` ASC),
  INDEX `idtienda_idx` (`idtiendas` ASC),
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `pizzeria`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idproducto`
    FOREIGN KEY (`idproducto`)
    REFERENCES `pizzeria`.`producto` (`idproducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idtienda`
    FOREIGN KEY (`idtiendas`)
    REFERENCES `pizzeria`.`tiendas` (`idtiendas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
