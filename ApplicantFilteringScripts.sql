SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CompanyAnswerTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CompanyAnswerTable` (
  `id` INT NOT NULL,
  `Q1` DOUBLE NULL,
  `Q2` DOUBLE NULL,
  `Q3` DOUBLE NULL,
  `Q4` DOUBLE NULL COMMENT '					',
  `Q5` DOUBLE NULL,
  `Q6` DOUBLE NULL,
  `Q7` DOUBLE NULL,
  `Q8` DOUBLE NULL,
  `Q9` DOUBLE NULL,
  `Q10` DOUBLE NULL,
  `Q11` DOUBLE NULL,
  `Q12` DOUBLE NULL,
  `Q13` DOUBLE NULL,
  `Q14` DOUBLE NULL,
  `Q15` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ApplicantAnswerTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ApplicantAnswerTable` (
  `id` INT NOT NULL,
  `companyId` INT NOT NULL,
  `Q1` DOUBLE NULL,
  `Q2` DOUBLE NULL,
  `Q3` DOUBLE NULL,
  `Q4` DOUBLE NULL COMMENT '					',
  `Q5` DOUBLE NULL,
  `Q6` DOUBLE NULL,
  `Q7` DOUBLE NULL,
  `Q8` DOUBLE NULL,
  `Q9` DOUBLE NULL,
  `Q10` DOUBLE NULL,
  `Q11` DOUBLE NULL,
  `Q12` DOUBLE NULL,
  `Q13` DOUBLE NULL,
  `Q14` DOUBLE NULL,
  `Q15` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ApplicantCompanyDeviancesTable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ApplicantCompanyDeviancesTable` (
  `applicantId` INT NOT NULL,
  `companyId` INT NOT NULL,
  `Q1` DOUBLE NULL,
  `Q2` DOUBLE NULL,
  `Q3` DOUBLE NULL,
  `Q4` DOUBLE NULL COMMENT '					',
  `Q5` DOUBLE NULL,
  `Q6` DOUBLE NULL,
  `Q7` DOUBLE NULL,
  `Q8` DOUBLE NULL,
  `Q9` DOUBLE NULL,
  `Q10` DOUBLE NULL,
  `Q11` DOUBLE NULL,
  `Q12` DOUBLE NULL,
  `Q13` DOUBLE NULL,
  `Q14` DOUBLE NULL,
  `Q15` DOUBLE NULL,
  `WSSE` DOUBLE NULL,
  PRIMARY KEY (`applicantId`, `companyId`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`CompanyAnswerTable`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`CompanyAnswerTable` (`id`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`, `Q7`, `Q8`, `Q9`, `Q10`, `Q11`, `Q12`, `Q13`, `Q14`, `Q15`) VALUES (1, 12.27, 38.12, 38.21, 83.12, 83.21, 47.12, 38.21, 38.11, 38.46, 31.89, 12.31, 38.12, 38.99, 73.12, 48.39);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`ApplicantAnswerTable`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`ApplicantAnswerTable` (`id`, `companyId`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`, `Q7`, `Q8`, `Q9`, `Q10`, `Q11`, `Q12`, `Q13`, `Q14`, `Q15`) VALUES (1, 1, 21.34, 83.12, 39.12, 39.11, 47.21, 38.19, 36.12, 18.39, 98.12, 27.12, 83.12, 94.83, 82.12, 38.40, 47.23);
INSERT INTO `mydb`.`ApplicantAnswerTable` (`id`, `companyId`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`, `Q7`, `Q8`, `Q9`, `Q10`, `Q11`, `Q12`, `Q13`, `Q14`, `Q15`) VALUES (2, 1, 23.12, 48.12, 48.18, 47.13, 48.04, 38.11, 91.33, 48.12, 39.12, 39.93, 74.12, 48.12, 48.33, 38.88, 28.17);
INSERT INTO `mydb`.`ApplicantAnswerTable` (`id`, `companyId`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`, `Q7`, `Q8`, `Q9`, `Q10`, `Q11`, `Q12`, `Q13`, `Q14`, `Q15`) VALUES (3, 1, 47.11, 48.22, 38.11, 47.82, 10.11, 48.00, 32.10, 47.23, 84.23, 83.67, 32.23, 83.23, 38.23, 38.23, 38.23);
INSERT INTO `mydb`.`ApplicantAnswerTable` (`id`, `companyId`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`, `Q7`, `Q8`, `Q9`, `Q10`, `Q11`, `Q12`, `Q13`, `Q14`, `Q15`) VALUES (4, 1, 38.18, 32.12, 38.23, 84.23, 38.11, 38.09, 38.12, 83.12, 83.74, 22.21, 83.99, 28.12, 83.12, 83.47, 83.12);
INSERT INTO `mydb`.`ApplicantAnswerTable` (`id`, `companyId`, `Q1`, `Q2`, `Q3`, `Q4`, `Q5`, `Q6`, `Q7`, `Q8`, `Q9`, `Q10`, `Q11`, `Q12`, `Q13`, `Q14`, `Q15`) VALUES (5, 1, 12.31, 83.12, 83.12, 83.12, 31.12, 38.13, 83.12, 83.12, 31.12, 38.12, 38.12, 38.12, 83.10, 14.31, 83.12);

COMMIT;

