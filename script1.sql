-- -----------------------------------------------------
-- Schema small_ferreteria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema small_ferreteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS small_ferreteria DEFAULT CHARACTER SET utf8 ;
USE small_ferreteria ;

-- -----------------------------------------------------
-- Table type_document
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS type_document (
  id_type INT NOT NULL AUTO_INCREMENT,
  type_doc VARCHAR(15) NOT NULL,
  create_at DATE NOT NULL,
  update_at DATE NULL,
  delete_at DATE NULL,
  PRIMARY KEY (id_type),
  UNIQUE INDEX type_doc_UNIQUE (type_doc ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table costumer
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS costumer (
  cost_id INT NOT NULL AUTO_INCREMENT,
  id_type INT NOT NULL,
  num_doc VARCHAR(15) NOT NULL,
  create_at DATE NOT NULL,
  update_at DATE NULL,
  delete_at DATE NULL,
  PRIMARY KEY (cost_id),
  UNIQUE INDEX num_doc_UNIQUE (num_doc ASC, id_type ASC) VISIBLE,
  INDEX fk_costumer_type_document1_idx (id_type ASC) INVISIBLE,
  CONSTRAINT fk_costumer_type_document1
    FOREIGN KEY (id_type)
    REFERENCES type_document (id_type)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table provider
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `provider` (
  pro_id INT NOT NULL AUTO_INCREMENT,
  rut VARCHAR(12) NOT NULL,
  `name` VARCHAR(60) NOT NULL,
  adreess VARCHAR(45) NOT NULL,
  phone VARCHAR(45) NOT NULL,
  email VARCHAR(50) NOT NULL,
  create_at DATE NOT NULL,
  update_at DATE NULL,
  delete_at DATE NULL,
  PRIMARY KEY (pro_id, `name`),
  UNIQUE INDEX rut_UNIQUE (rut ASC) VISIBLE,
  UNIQUE INDEX name_UNIQUE (`name` ASC) VISIBLE,
  UNIQUE INDEX phone_UNIQUE (phone ASC) VISIBLE,
  UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table item
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS item (
  item_id INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  price INT NOT NULL,
  create_at DATE NOT NULL,
  update_at DATE NULL,
  delete_at DATE NULL,
  PRIMARY KEY (item_id),
  UNIQUE INDEX name_UNIQUE (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table sale_man
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sale_man (
  sale_id INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  adrress1 VARCHAR(45) NOT NULL,
  phone_num VARCHAR(45) NOT NULL,
  email1 VARCHAR(45) NOT NULL,
  create_at DATE NOT NULL,
  update_at DATE NULL,
  delete_at DATE NULL,
  PRIMARY KEY (sale_id),
  UNIQUE INDEX name_UNIQUE (`name` ASC) VISIBLE,
  UNIQUE INDEX email_UNIQUE (email1 ASC) VISIBLE,
  UNIQUE INDEX phone_UNIQUE (phone_num ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `small_ferreteria`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS invoice (
  inv_id INT NOT NULL AUTO_INCREMENT,
  sale_man_id INT NOT NULL,
  costumer_id INT NOT NULL,
  total_price INT NOT NULL,
  create_at DATE NOT NULL,
  anullation_date DATE NULL,
  PRIMARY KEY (inv_id),
  INDEX fk_invoice_sale_man1_id (sale_man_id ASC) VISIBLE,
  INDEX fk_invoice_costumer1_idx (costumer_id ASC) VISIBLE,
  CONSTRAINT fk_invoice_sale_man1
    FOREIGN KEY (sale_man_id)
    REFERENCES sale_man (sale_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_invoice_costumer1
    FOREIGN KEY (costumer_id)
    REFERENCES costumer (cost_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table list_item
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS list_item (
  list_id INT NOT NULL AUTO_INCREMENT,
  invoice_id INT NULL,
  item_id INT NOT NULL,
  ordered_units INT NOT NULL,
  final_price INT NOT NULL,
  INDEX fk_table1_item1_idx (item_id ASC) VISIBLE,
  INDEX fk_table1_invoice1_idx (invoice_id ASC) VISIBLE,
  PRIMARY KEY (list_id),
  CONSTRAINT fk_table1_item1
    FOREIGN KEY (item_id)
    REFERENCES item (item_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT fk_table1_invoice1
    FOREIGN KEY (invoice_id)
    REFERENCES invoice (inv_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table provider_list_product
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS provider_list_product (
  list_prod_id INT NOT NULL AUTO_INCREMENT,
  provider_id INT NULL,
  item_id INT NOT NULL,
  PRIMARY KEY (list_prod_id),
  INDEX fk_provider_list_product_provider1_idx (provider_id ASC) VISIBLE,
  INDEX fk_provider_list_product_item1_idx (item_id ASC) INVISIBLE,
  UNIQUE INDEX item_id_UNIQUE (item_id ASC, provider_id ASC) INVISIBLE,
  CONSTRAINT fk_provider_list_product_provider1
    FOREIGN KEY (provider_id)
    REFERENCES `provider` (pro_id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_provider_list_product_item1
    FOREIGN KEY (item_id)
    REFERENCES item (item_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;



                                                     


-- -----------------------------------------------------
-- iNSERT DATA
-- -----------------------------------------------------
-- -----------------------------------------------------
-- iNSERT DATA
-- -----------------------------------------------------


-- -----------------------------------------------------
-- iNSERT data INTO TABLE type_document
-- -----------------------------------------------------
INSERT INTO type_document (type_doc, create_at) 
VALUES("CC", "2021-03-02"),
("TI", "2021-03-02"),
("CE", "2021-03-02"),
("PASSPORT", "2021-03-02"),
("RUT", "2021-03-02");


-- -----------------------------------------------------
-- INSERT data INTO TABLE costumer
-- -----------------------------------------------------
INSERT INTO costumer (id_type, num_doc, create_at)
VALUES
  (1,12345679,"2018-10-08"),
  (2,1219644818,"2018-10-08"),
  (3,1219644818,"2018-10-08"),
  (1,1219644818,"2018-10-08"),
  (4,1219644818,"2018-10-08"),
  (3,339709788,"2019-04-13"),
  (4,1362785071,"2020-10-04"),
  (4,1665078955,"2008-01-02"),
  (2,1228867728,"2017-09-19"),
  (4,897200478,"2020-08-15"),
  (3,1630370233,"1990-08-07"),
  (1,521972026,"2014-10-13"),
  (4,1931850299,"2003-03-30"),
  (4,37149136,"2013-02-28"),
  (4,124296247,"1996-12-15"),
  (4,1055976631,"2016-11-08"),
  (2,821445494,"1996-06-04"),
  (2,867878077,"2004-10-19"),
  (1,1184940654,"1999-02-13"),
  (3,688211963,"2021-10-03"),
  (5,562374625,"2013-02-07"),
  (4,317846278,"2014-04-02"),
  (3,1086173592,"1998-05-05"),
  (4,553640547,"1997-08-27"),
  (3,290619065,"2000-04-08"),
  (4,403599401,"1993-01-21"),
  (3,191417733,"1997-10-27"),
  (3,1505592218,"2023-02-20"),
  (4,1069260315,"2009-09-08"),
  (4,1552935491,"2014-08-11"),
  (3,1845309970,"1996-03-04"),
  (1,1934734692,"2003-07-19"),
  (1,293337546,"1998-05-03"),
  (3,318393821,"2021-04-15"),
  (1,484271278,"1997-11-29"),
  (2,202456238,"1993-10-29"),
  (1,59432302,"2021-10-24"),
  (1,931991019,"1990-05-04"),
  (4,261214652,"2013-05-22"),
  (5,1973083174,"2013-03-03"),
  (4,264337198,"1990-05-12"),
  (2,1267710679,"2007-01-14"),
  (3,1795872023,"1997-01-13"),
  (3,622834442,"2020-12-12");


-- -----------------------------------------------------
-- INSERT data INTO TABLE sale_man
-- -----------------------------------------------------
INSERT INTO sale_man (name, adrress1, phone_num, email1, create_at) 
VALUES("admin", "calle 7 # 90-64", "313546789", "admin@smallshop.com", "2022-02-03");


-- -----------------------------------------------------
-- INSERT data INTO TABLE provider
-- -----------------------------------------------------
INSERT INTO provider (rut, name, adreess, phone, email, create_at)
VALUES
  (16201684,"Metus Aliquam LLP","P.O. Box 177, 4121 Rutrum. St.","1-521-750-2775","placerat@google.edu","2005,-02-1"),
  (8169521,"Sed Et PC","Ap #705-6165 A, Street","1-348-801-2287","facilisis.suspendisse@icloud.com","2012,-03-17"),
  (76542664,"Vitae Corporation","P.O. Box 544, 6224 Odio. Street","1-136-179-0883","adipiscing@google.com","2009,-05-20"),
  (45140549,"Eu Tellus Eu LLP","P.O. Box 241, 8121 Rhoncus. Av.","(283) 853-2311","eleifend.egestas@google.couk","2010,-11-12"),
  (29653848,"Diam LLP","7060 Libero St.","(525) 780-8482","lorem.auctor@icloud.edu","2022,-03-30"),
  (65744800,"Dictum Eu PC","Ap #817-4562 Aenean Road","610-336-1573","penatibus@hotmail.edu","2015,-05-29"),
  (95329858,"Sed Malesuada Ltd","P.O. Box 856, 1615 Amet Av.","772-324-2237","semper@protonmail.com","2020,-09-19"),
  (57996223,"Consectetuer Adipiscing Corporation","P.O. Box 593, 3387 Eros St.","821-713-4125","sagittis.felis@protonmail.org","2016,-06-29"),
  (48825612,"Sapien Aenean Massa Industries","P.O. Box 314, 8734 Ligula. St.","1-640-638-2232","vitae.sodales@icloud.com","2017,-12-16"),
  (57768971,"Etiam Vestibulum Massa Inc.","427-5331 Porttitor Avenue","1-661-882-0735","integer@google.com","2016,-02-14"),
  (18133924,"Vel Lectus PC","P.O. Box 908, 380 Nec Road","1-258-887-1288","quam.a@protonmail.net","2001,-02-22"),
  (42276643,"Donec Elementum Industries","Ap #715-4301 Convallis Street","742-626-6607","semper.cursus.integer@protonmail.edu","2001,-07-21"),
  (22315056,"Nulla Incorporated","264-178 Vestibulum Rd.","(778) 287-3863","sed.nulla@yahoo.edu","2012,-09-9"),
  (83054728,"Turpis Egestas Limited","8071 Egestas. St.","376-201-0934","justo@outlook.org","2022,-07-2"),
  (97461642,"Luctus Vulputate Foundation","Ap #772-2191 Ridiculus St.","(784) 524-5802","mi.felis.adipiscing@protonmail.org","2008,-06-13"),
  (23755969,"Turpis Limited","494-6131 Sem Ave","1-377-617-1578","est@yahoo.com","2021,-10-19"),
  (15111815,"Mauris Non Dui Foundation","6533 Amet Street","(677) 708-2201","eu.ligula@hotmail.ca","2006,-03-13"),
  (55528171,"Sodales Purus Ltd","5902 Tempor Rd.","1-513-160-0275","fermentum@aol.edu","2014,-06-14"),
  (74564911,"Ac Turpis Egestas Ltd","P.O. Box 292, 4199 Eleifend, Road","(644) 749-9890","class.aptent.taciti@aol.ca","2009,-11-6"),
  (75426960,"Convallis Ante PC","679-7025 Dui, Ave","769-456-4373","penatibus@protonmail.com","2015,-05-26"),
  (18774764,"Donec LLP","758-8435 Elementum Rd.","1-823-575-1533","quam@google.edu","2011,-10-27"),
  (80000845,"Purus In Associates","Ap #347-9424 Mi. St.","(738) 426-3146","magnis.dis@outlook.ca","2001,-09-24"),
  (69844214,"Sem Nulla Interdum LLC","1230 Quis Street","941-714-2623","quisque.varius@hotmail.edu","2000,-08-31"),
  (51371754,"Elit Pharetra Inc.","Ap #408-3900 Fermentum Ave","441-743-5292","non@protonmail.couk","2003,-11-28"),
  (7551756,"Egestas A Institute","103-379 Aliquam St.","1-264-425-9545","aliquam.adipiscing.lacus@google.couk","2015,-06-29"),
  (31482122,"Sem Nulla Interdum Corporation","Ap #941-9217 Primis Ave","183-162-1743","gravida.molestie@outlook.org","2004,-03-23"),
  (59784292,"Pharetra Ut Associates","P.O. Box 602, 7392 Enim. St.","705-953-5576","eros@protonmail.net","2020,-06-28"),
  (84442318,"Ut Lacus Inc.","Ap #529-5406 Semper St.","482-188-6538","mus.donec@hotmail.edu","2021,-05-11"),
  (59668063,"Et Magnis Dis Industries","235-1161 Lorem Avenue","021-132-3266","diam.dictum.sapien@yahoo.couk","2003,-09-2"),
  (45336273,"Dui Nec Inc.","P.O. Box 356, 1102 Quis Avenue","(282) 715-8858","et.arcu.imperdiet@icloud.net","2010,-07-18"),
  (94271614,"Dolor Dapibus Corp.","Ap #944-382 Suspendisse Av.","(682) 759-6738","blandit.viverra@aol.couk","2015,-03-25"),
  (4033788,"Nec Eleifend Non Inc.","525-2784 Aptent Street","944-404-2513","mauris@hotmail.ca","2005,-01-1"),
  (30843386,"Interdum Libero Corporation","Ap #744-4714 Nec, St.","400-371-1132","euismod@icloud.couk","2017,-03-16"),
  (67107975,"Turpis Non Incorporated","P.O. Box 817, 6169 Odio. Av.","(675) 145-7678","senectus@outlook.couk","2013,-04-12"),
  (94708325,"Mauris Ltd","515-1003 Quisque St.","1-826-873-9416","mattis.integer@aol.ca","2010,-12-5"),
  (58742986,"Neque Sed Institute","4124 Et, Avenue","1-395-717-1463","nisl@yahoo.edu","2011,-06-6"),
  (91637392,"Eu Tempor Institute","Ap #310-9998 Sem. Rd.","(662) 284-3545","phasellus.at@aol.ca","2003,-05-24"),
  (75190851,"Adipiscing Associates","263-8691 Eleifend Street","608-415-1224","egestas@outlook.ca","2022,-09-28"),
  (21528652,"Suspendisse Industries","Ap #404-5772 Nec Rd.","(444) 453-6552","nec.diam@protonmail.ca","2022,-09-2"),
  (47675807,"Dolor Sit Foundation","Ap #721-9296 Odio Avenue","826-349-9872","leo.vivamus@aol.ca","2022,-11-29");

 
-- -----------------------------------------------------
-- INSERT data INTO TABLE item
-- -----------------------------------------------------
INSERT INTO item (name, price, create_at)
VALUES
  ("tornillo 4mm",23638,"2020-09-5"),
  ("acero",27789,"2006-01-27"),
  ("martillo",38990,"2019-06-1"),
  ("tornillo 1mm",38566,"2001-08-2"),
  ("cablo 2mm",33244,"2001-02-5"),
  ("cablo punta ancha",27414,"2003-11-8"),
  ("destornillador estrella",20422,"2003-06-17"),
  ("destornillador pala",34361,"2015-04-12"),
  ("destornillador hexagonal",35426,"2004-02-17"),
  ("maso",37069,"2002-10-28"),
  ("oxidante para metal grande",23794,"2006-04-10"),
  ("oxidante para metal pequeño",34132,"2010-07-16"),
  ("brocha de cadena",27448,"2018-01-31"),
  ("chazo largo",20399,"2003-10-10"),
  ("chazo corto",32663,"2006-05-18"),
  ("baldosa cuadrada",37253,"2020-03-1"),
  ("baldosa hexagonal",12944,"2015-04-16"),
  ("baldosa marmol",29511,"2019-09-17"),
  ("ladrillo rojo pequeño",32075,"2013-09-25"),
  ("ladrillo cemento",21613,"2019-12-18"),
  ("ladrillo rojo concabo",30056,"2015-04-8"),
  ("bulto de cemento gris",28924,"2008-12-31"),
  ("medio bulto de cemento gris",22064,"2021-12-28"),
  ("bulto cemento blanco",13022,"2001-02-2"),
  ("medio bulto cemento blanco",20206,"2010-01-3"),
  ("cuarto bulto cemento blanco",17355,"2014-01-15"),
  ("cuarto bulto cemento gris",16694,"2011-02-13"),
  ("lijadora wall",38184,"2020-01-25"),
  ("lijadora brington",25140,"2011-12-10"),
  ("kit destornillador briltol",28641,"2021-02-3"),
  ("kit destornillador strom",28892,"2011-12-11"),
  ("kit llaves mixtas",10077,"2006-01-11"),
  ("llave 6 pgds",12645,"2002-02-5"),
  ("llave 8 pgds",17646,"2011-03-4"),
  ("llave 11/2 pgds",37427,"2019-01-31"),
  ("balde plastico",15049,"2005-07-23"),
  ("balde acero",25610,"2001-02-7"),
  ("pintura blanca",37745,"2014-05-30"),
  ("pintura negra",12119,"2018-07-27"),
  ("pintura curuba",27578,"2013-11-20");


  -- -----------------------------------------------------
-- INSERT data INTO TABLE provider_list_product
-- -----------------------------------------------------
INSERT INTO provider_list_product (provider_id, item_id)
VALUES
  (13,2),
  (17,3),
  (37,4),
  (27,5),
  (26,6),
  (18,7),
  (32,8),
  (28,9),
  (30,10),
  (6,11),
  (37,12),
  (17,13),
  (36,14),
  (5,15),
  (36,16),
  (13,17),
  (2,18),
  (17,19),
  (17,20),
  (4,21),
  (13,22),
  (11,23),
  (11,24),
  (23,25),
  (29,26),
  (32,27),
  (25,28),
  (8,29),
  (31,30),
  (27,31),
  (17,32),
  (35,33),
  (19,34),
  (12,35),
  (8,36),
  (18,37),
  (21,38),
  (40,39),
  (28,40);


-- -----------------------------------------------------
-- INSERT data INTO TABLE invoice
-- -----------------------------------------------------
INSERT INTO invoice (sale_man_id, costumer_id, total_price, create_at)
VALUES
(1, 1, 338556,"2022-03-02"),
(1, 2, 1616348,"2020-03-02"),
(1, 3, 901266,"2019-03-02"),
(1, 4, 250333,"2020-02-02"),
(1, 5, 248253,"2020-12-02"),
(1, 6, 309637,"2021-03-02"),
(1, 2, 487818,"2020-10-13"),
(1, 8, 509894,"2005-12-02"),
(1, 9, 649918,"2020-03-02"),
(1, 10, 416276,"2020-03-02");



-- -----------------------------------------------------
-- INSERT data INTO TABLE list_item
-- -----------------------------------------------------
INSERT INTO list_item (invoice_id, item_id, ordered_units, final_price)
VALUES
  (1,17,5,64720),
  (1,27,2,33388),
  (1,21,8,240448),
  (2,3,7,272930),
  (2,4,7,269962),
  (2,26,3,52065),
  (2,5,9,299196),
  (2,37,5,128050),
  (2,24,6,78132),
  (2,13,4,109792),
  (2,23,6,132384),
  (3,28,3,114552),
  (3,19,5,160375),
  (3,31,7,202244),
  (3,20,7,151291),
  (3,25,8,161648),
  (3,2,4,111156),
  (3,25,4,80824),
  (4,33,9,113805),
  (4,12,4,136528),
  (5,6,4,109656),
  (5,33,3,37935),
  (5,27,3,50082),
  (5,33,4,50580),
  (6,40,3,82734),
  (6,10,3,111207),
  (6,22,4,115696),
  (7,30,3,85923),
  (7,10,8,296552),
  (7,36,7,105343),
  (8,22,7,202468),
  (8,18,3,88533),
  (8,15,5,163315),
  (8,2,2,55578),
  (9,21,8,240448),
  (9,21,4,120224),
  (9,26,10,173550),
  (9,22,4,115696),
  (10,22,9,260316), 
  (10,3,4,155960);


-- -----------------------------------------------------
-- Dos borrados lógicos y borrados físicos en ventas realizadas
-- -----------------------------------------------------

UPDATE invoice SET anullation_date = "2022-03-03" WHERE inv_id = 1;
UPDATE invoice SET anullation_date = "2022-03-03" WHERE inv_id = 4;

DELETE FROM invoice WHERE inv_id = 9;
DELETE FROM invoice WHERE inv_id = 5;
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Modificar tres productos en su nombre y proveedor que los provee.
-- -----------------------------------------------------
UPDATE item SET name = "acero reforzado",  update_at = "2022-03-03" WHERE item_id = 2;
UPDATE item SET name = "pintura yellow-light",  update_at = "2022-03-03" WHERE item_id = 40;
UPDATE item SET name = "balde plastico pequeño",  update_at = "2022-03-03" WHERE item_id = 36;