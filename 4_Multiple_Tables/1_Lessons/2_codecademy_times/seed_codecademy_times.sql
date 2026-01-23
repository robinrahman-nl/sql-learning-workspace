-- ============================================================
-- PROJECT: Codecademy Times – Multiple Tables (Inner Joins)
-- PURPOSE: Mirror Codecademy newspaper & online subscription data
-- ============================================================

DROP TABLE IF EXISTS newspaper;

DROP TABLE IF EXISTS online;

DROP TABLE IF EXISTS months;
-- ----------------------------
-- TABLE: newspaper
-- ----------------------------
CREATE TABLE newspaper (
    id INT PRIMARY KEY,
    first_name VARCHAR(256),
    last_name VARCHAR(256),
    email VARCHAR(256),
    start_month INT,
    end_month INT
);

-- ----------------------------
-- TABLE: online
-- ----------------------------
CREATE TABLE online (
    id INT PRIMARY KEY,
    first_name VARCHAR(256),
    last_name VARCHAR(256),
    email VARCHAR(256),
    start_month INT,
    end_month INT
);

-- ----------------------------
-- TABLE: months
-- ----------------------------
CREATE TABLE months (
    month INT PRIMARY KEY
);

-- ----------------------------
-- Seed data: newspaper subscribers
-- ----------------------------
INSERT INTO newspaper (id, first_name, last_name, email, start_month, end_month) VALUES
(21253,'Vinnie','Sagaser','Vinnie.Sagaser@yoohoo.com',1,5),
(39075,'Francesco','Maddron','FrancescoMaddron81@gsnail.com',1,5),
(30648,'Hellen','Broadwater','HBroadwater1992@gsnail.com',2,3),
(71778,'Ouida','Pardini','Ouida.Pardini@gsnail.com',2,6),
(32436,'Wenona','Tankson','WTankson1989@gsnail.com',2,6),
(55580,'Clora','Werking','CWerking1996@gsnail.com',2,5),
(79652,'Esteban','Pitner','Esteban.Pitner@gsnail.com',2,4),
(11322,'Carmel','Deasis','CD3012@gsnail.com',2,6),
(73893,'Jessi','Vinson','JessiVinson65@gsnail.com',2,6),
(84750,'Ayana','Hodapp','AHodapp1976@coldmail.com',3,6),
(34187,'Francoise','Feliberty','FFeliberty1984@inlook.com',3,7),
(82566,'Dusty','Morrical','DMorrical1977@gsnail.com',3,7),
(31446,'Collin','Dobos','CollinDobos57@coldmail.com',3,5),
(23496,'Fredia','Bi','Fredia.Bi@gsnail.com',4,8),
(34664,'Troy','Underwood','Troy.Underwood@gsnail.com',4,6),
(58869,'Cordia','Schingeck','CordiaSchingeck82@gsnail.com',4,6),
(96977,'Peter','Haddaway','Peter.Haddaway@gsnail.com',4,8),
(17873,'Vilma','Colaizzi','VColaizzi1973@gsnail.com',4,5),
(49633,'Lane','Dittman','LaneDittman80@gsnail.com',5,9),
(37471,'Sharice','Mcmindes','SM2234@gsnail.com',5,6),
(14227,'Grady','Antinore','Grady.Antinore@gsnail.com',5,7),
(90240,'Mandy','Ferber','Mandy.Ferber@gsnail.com',5,9),
(22237,'Olimpia','Padden','OP5814@inlook.com',5,6),
(84308,'Mechelle','Mcgarrell','MM4920@gsnail.com',5,6),
(46343,'Cecelia','Filipponi','CFilipponi1977@gsnail.com',5,8),
(17951,'Latasha','Pasket','Latasha.Pasket@gsnail.com',5,6),
(32353,'Nichole','Vogenthaler','NicholeVogenthaler58@gsnail.com',5,6),
(59400,'Hiedi','Dwight','Hiedi.Dwight@gsnail.com',5,6),
(12575,'Loni','Manchester','LoniManchester25@gsnail.com',5,8),
(56665,'Maple','Yonts','MY2659@coldmail.com',6,8),
(58002,'Brooke','Tandetzke','BT7427@gsnail.com',6,7),
(72688,'Josiah','Rosseter','Josiah.Rosseter@gsnail.com',6,10),
(50328,'Amber','Berrian','AB8272@gsnail.com',6,8),
(80644,'Meghan','Hoobler','Meghan.Hoobler@inlook.com',6,9),
(77961,'Madelene','Gittelman','MGittelman1988@gsnail.com',6,8),
(71091,'Michael','Saffer','MSaffer1989@inlook.com',6,7),
(36414,'Stacey','Gude','StaceyGude80@gsnail.com',6,10),
(37588,'Demetra','Pesek','Demetra.Pesek@gsnail.com',7,9),
(99416,'Gisela','Sanfilippo','GSanfilippo1971@gsnail.com',7,11),
(22195,'Onita','Butay','Onita.Butay@gsnail.com',7,11),
(86812,'Dong','Mckendree','Dong.Mckendree@inlook.com',8,10),
(44022,'Adeline','Hazinski','AHazinski1991@inlook.com',8,12),
(20801,'Janita','Hodgson','JanitaHodgson94@gsnail.com',8,12),
(11660,'Layne','Tavella','LayneTavella12@coldmail.com',8,9),
(92017,'Vallie','Kirnon','VK7227@coldmail.com',8,9),
(58418,'Alvera','Fassino','AFassino1978@gsnail.com',8,10),
(19136,'Vernetta','Manda','VernettaManda60@coldmail.com',8,10),
(16299,'Dortha','Shigemi','DorthaShigemi21@gsnail.com',9,10),
(44402,'Laci','Stein','Laci.Stein@inlook.com',9,11),
(48666,'Shona','Lyssy','Shona.Lyssy@gsnail.com',9,12),
(42358,'Hue','Schoenmaker','HueSchoenmaker71@gsnail.com',9,12),
(99734,'Rema','Iacobucci','RemaIacobucci20@gsnail.com',9,12),
(88849,'Blanca','Merdian','BlancaMerdian51@gsnail.com',9,10),
(65878,'Madie','Armer','MadieArmer54@gsnail.com',10,11),
(63145,'Tosha','Cochrane','Tosha.Cochrane@gsnail.com',10,12),
(14022,'Elisabeth','Fredeen','EF3903@gsnail.com',10,11),
(40508,'Ha','Waggett','HW6229@gsnail.com',10,12),
(59945,'Gail','Deloatch','GailDeloatch2@yoohoo.com',11,12),
(28930,'Marci','Matterson','MMatterson1972@gsnail.com',11,12),
(85799,'Vicenta','Bousley','Vicenta.Bousley@gsnail.com',11,12);

-- ----------------------------
-- Seed data: online subscribers
-- ----------------------------
INSERT INTO online (id, first_name, last_name, email, start_month, end_month) VALUES
(39075,'Francesco','Maddron','FrancescoMaddron81@gsnail.com',1,5),
(12770,'Yer','Carpio','YerCarpio49@coldmail.com',1,4),
(21253,'Vinnie','Sagaser','Vinnie.Sagaser@yoohoo.com',1,5),
(73893,'Jessi','Vinson','JessiVinson65@gsnail.com',2,6),
(11322,'Carmel','Deasis','CD3012@gsnail.com',2,6),
(55580,'Clora','Werking','CWerking1996@gsnail.com',2,5),
(32436,'Wenona','Tankson','WTankson1989@gsnail.com',2,6),
(30648,'Hellen','Broadwater','HBroadwater1992@gsnail.com',2,3),
(31446,'Collin','Dobos','CollinDobos57@coldmail.com',3,5),
(47660,'Stephnie','Alsberry','StephnieAlsberry43@coldmail.com',3,5),
(84750,'Ayana','Hodapp','AHodapp1976@coldmail.com',3,6),
(34187,'Francoise','Feliberty','FFeliberty1984@inlook.com',3,7),
(82566,'Dusty','Morrical','DMorrical1977@gsnail.com',3,7),
(34664,'Troy','Underwood','Troy.Underwood@gsnail.com',4,6),
(17873,'Vilma','Colaizzi','VColaizzi1973@gsnail.com',4,5),
(96977,'Peter','Haddaway','Peter.Haddaway@gsnail.com',4,8),
(23496,'Fredia','Bi','Fredia.Bi@gsnail.com',4,8),
(81936,'Xavier','Roelfs','XR3616@gsnail.com',4,5),
(72101,'Brittny','Donato','Brittny.Donato@gsnail.com',4,8),
(71246,'Betty','Peth','BPeth1985@gsnail.com',4,5),
(58255,'Lala','Rauzman','LRauzman1980@gsnail.com',4,8),
(58869,'Cordia','Schingeck','CordiaSchingeck82@gsnail.com',4,6),
(90240,'Mandy','Ferber','Mandy.Ferber@gsnail.com',5,9),
(37471,'Sharice','Mcmindes','SM2234@gsnail.com',5,6),
(14227,'Grady','Antinore','Grady.Antinore@gsnail.com',5,7),
(49633,'Lane','Dittman','LaneDittman80@gsnail.com',5,9),
(22237,'Olimpia','Padden','OP5814@inlook.com',5,6),
(84308,'Mechelle','Mcgarrell','MM4920@gsnail.com',5,6),
(59400,'Hiedi','Dwight','Hiedi.Dwight@gsnail.com',5,6),
(84319,'Yan','Pelman','Yan.Pelman@gsnail.com',5,6),
(12575,'Loni','Manchester','LoniManchester25@gsnail.com',5,8),
(32353,'Nichole','Vogenthaler','NicholeVogenthaler58@gsnail.com',5,6),
(74913,'Richard','Lamy','RL8837@gsnail.com',5,9),
(17951,'Latasha','Pasket','Latasha.Pasket@gsnail.com',5,6),
(72688,'Josiah','Rosseter','Josiah.Rosseter@gsnail.com',6,10),
(50328,'Amber','Berrian','AB8272@gsnail.com',6,8),
(80644,'Meghan','Hoobler','Meghan.Hoobler@inlook.com',6,9),
(74563,'Clotilde','Remme','CR7341@inlook.com',6,7),
(36414,'Stacey','Gude','StaceyGude80@gsnail.com',6,10),
(77961,'Madelene','Gittelman','MGittelman1988@gsnail.com',6,8),
(56665,'Maple','Yonts','MY2659@coldmail.com',6,8),
(48662,'Kayleen','Woodrome','KW4931@inlook.com',6,10),
(71644,'Emmaline','Sunga','ESunga1999@inlook.com',7,8),
(37588,'Demetra','Pesek','Demetra.Pesek@gsnail.com',7,9),
(99416,'Gisela','Sanfilippo','GSanfilippo1971@gsnail.com',7,11),
(64535,'Elyse','Teman','ElyseTeman35@gsnail.com',7,11),
(22195,'Onita','Butay','Onita.Butay@gsnail.com',7,11),
(25190,'Aleida','Hoberek','AH5461@gsnail.com',7,10),
(20801,'Janita','Hodgson','JanitaHodgson94@gsnail.com',8,12),
(11660,'Layne','Tavella','LayneTavella12@coldmail.com',8,9),
(92017,'Vallie','Kirnon','VK7227@coldmail.com',8,9),
(58418,'Alvera','Fassino','AFassino1978@gsnail.com',8,10),
(99734,'Rema','Iacobucci','RemaIacobucci20@gsnail.com',9,12),
(44402,'Laci','Stein','Laci.Stein@inlook.com',9,11),
(16299,'Dortha','Shigemi','DorthaShigemi21@gsnail.com',9,10),
(42358,'Hue','Schoenmaker','HueSchoenmaker71@gsnail.com',9,12),
(88849,'Blanca','Merdian','BlancaMerdian51@gsnail.com',9,10),
(14022,'Elisabeth','Fredeen','EF3903@gsnail.com',10,11),
(63145,'Tosha','Cochrane','Tosha.Cochrane@gsnail.com',10,12),
(65878,'Madie','Armer','MadieArmer54@gsnail.com',10,11),
(40508,'Ha','Waggett','HW6229@gsnail.com',10,12),
(48988,'Kristine','Lafarge','KL6263@gsnail.com',11,12),
(71964,'Myriam','Kim','MyriamKim33@gsnail.com',11,12),
(59945,'Gail','Deloatch','GailDeloatch2@yoohoo.com',11,12),
(28930,'Marci','Matterson','MMatterson1972@gsnail.com',11,12);

-- ----------------------------
-- Seed data: months
-- ----------------------------
INSERT INTO months (month) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);


-- ----------------------------
-- Verify locally (sanity checks)
-- ----------------------------
SELECT COUNT(*) FROM newspaper;
SELECT COUNT(*) FROM online;
SELECT * FROM months;

SELECT *
FROM newspaper
JOIN online
  ON newspaper.id = online.id;

