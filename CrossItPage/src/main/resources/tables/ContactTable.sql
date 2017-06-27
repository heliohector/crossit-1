CREATE TABLE contact (
  ctNum int(11) NOT NULL AUTO_INCREMENT,
  ctName varchar(50) NOT NULL,
  ctEmail varchar(50) NOT NULL,
  ctMsg text NOT NULL,
  ctRgDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  ctStatus varchar(50) DEFAULT '안읽음',
  PRIMARY KEY (ctNum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;