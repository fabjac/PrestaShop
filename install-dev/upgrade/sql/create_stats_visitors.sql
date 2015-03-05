DROP TABLE IF EXISTS `stats_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `stats_visitors` (
  date_day varchar(8),
  date_time varchar(6),
  addr varchar(15),
  host varchar(100),
  uri varchar(255),
  query_string varchar(255),
  user_agent varchar(255),
  lang varchar(100),
  referer varchar(500),
  id_product int(10),
  KEY index1 (date_day, addr),
  KEY index2 (id_product)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

