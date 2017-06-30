CREATE TABLE `crossit_db`.`attendance` (
  `atNum` INT NOT NULL AUTO_INCREMENT,
  `atUrNum` INT NOT NULL,
  `atUrName` VARCHAR(50) NOT NULL,
  `atUrTerm` INT NOT NULL,
  `atRest` FLOAT NOT NULL DEFAULT 3,
  `atPresent` INT NOT NULL DEFAULT 0,
  `atLate` INT NOT NULL DEFAULT 0,
  `atAbsent` INT NOT NULL DEFAULT 0,
  `atPlus` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`atNum`),
  INDEX `atUrNum_fk_idx` (`atUrNum` ASC),
  INDEX `atUrName_fk_idx` (`atUrName` ASC),
  INDEX `atUrTerm_fk_idx` (`atUrTerm` ASC),
  CONSTRAINT `atUrNum_fk`
    FOREIGN KEY (`atUrNum`)
    REFERENCES `crossit_db`.`user` (`urNum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `atUrName_fk`
    FOREIGN KEY (`atUrName`)
    REFERENCES `crossit_db`.`user` (`urName`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `atUrTerm_fk`
    FOREIGN KEY (`atUrTerm`)
    REFERENCES `crossit_db`.`user` (`urTerm`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
