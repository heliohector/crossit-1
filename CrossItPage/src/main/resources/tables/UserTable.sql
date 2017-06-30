CREATE TABLE `crossit_db`.`user` (
  `urNum` INT NOT NULL AUTO_INCREMENT,
  `urName` VARCHAR(50) NOT NULL,
  `urTerm` INT NOT NULL,
  PRIMARY KEY (`urNum`),
  INDEX `urName_idx` (`urName` ASC),
  INDEX `urTerm_idx` (`urTerm` ASC)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

