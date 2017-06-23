CREATE TABLE contact (
  ctNum int(11) NOT NULL AUTO_INCREMENT,
  ctName varchar(50) NOT NULL,
  ctEmail varchar(50) NOT NULL,
  ctMsg text NOT NULL,
  ctRgDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  ctReply text DEFAULT NULL,
  PRIMARY KEY (ctNum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `contact` VALUES (1,'노네임','noname@naver.com','문의내용입니다.','2017-06-23 09:00:00',NULL);