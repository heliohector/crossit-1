CREATE TABLE board (
  boardIndex int(11) NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  userName varchar(10) NOT NULL,
  content text NOT NULL,
  file varchar(50) DEFAULT NULL,
  registerDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (boardIndex)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `board` VALUES (1,'건강검진보고서','신윤희','담당 컨설던트 : 신윤희',NULL,'2017-05-22 21:57:29');