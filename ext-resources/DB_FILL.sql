SET SQL_SAFE_UPDATES = 0;
use SchoolDB;
delete from `JOURNAL`;
delete from `SCHEDULE`;
delete from `MESSAGE`;
delete from `CONVERSATION`;
delete from `COURSE_REQUEST`;
delete from `STUDENT_PARENT_REF`;
delete from `PARENT`;
delete from `SALARY`;
delete from `COURSE_TEACHER_REF`;
delete from `STUDENT_ADDITION_GROUP_REF`;
delete from `REGISTRATION_DATA`;
delete from `ROLE_REQUEST`;

delete from `STUDENT`;
delete from `GROUPS`;
delete from `TEACHER`;
delete from `USER_ROLE_REF`;

delete from `ROLE`;
delete from `USER`;
delete from `LESSON`;
delete from `COURSE`;
delete from `ROOM`;
delete from `NEWS`;


INSERT INTO `ROLE` (`id`,`name`) VALUES (1,"ROLE_DIRECTOR"),(2,"ROLE_HEAD_TEACHER"),(3,"ROLE_TEACHER"),(4,"ROLE_STUDENT"),(5,"ROLE_PARENT"),(6,"ROLE_ADMIN");

INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`,`confirmed`) VALUES (1,"director@gmail.com","Oscar","Neverhad","$2a$10$HSQEq9V2M93DHiFynj0fLeGmpVjVhy9CCwAjvU2fuZx451RBS1FIW","2014-02-08 05:08:11",1,1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`,`confirmed`) VALUES (2,"headteacher@gmail.com","Willi","Smoker","$2a$10$xo52Ovi.Cbqw/C0l3sVh2OBYAClDUq3UhSnPx5IIAbJNZqgflrOe6","2014-03-11 13:11:07",2,1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`,`confirmed`) VALUES (10,"teacher@gmail.com","Hyatt","Wild","$2a$10$XxK7poGe.yfCh9KkpDOos.wrgv6ndwzGJjt1r4r9FhnWScSjG4Sxu","2013-11-25 04:47:05",2,1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`,`confirmed`) VALUES (105,"student@gmail.com","Lucas","Anderson","$2a$10$IEeoBGYQHk1QuXbRxEM66eItG8BLpXEqTyylHlTHy/U.dAjoVTs2u","2014-02-04 17:02:34",2,1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`,`confirmed`) VALUES (80,"parent@gmail.com","Jolie","Richmond","$2a$10$eAstsAudAc57n5T.c4L0tu6CRdPLA/RaJJUmQQUrliuwLOsC5V7x.","2014-03-20 23:55:02",3,1);

INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (3,"egestas.Fusce.aliquet@vitae.net","Amethyst","Valentine","mauris.","2014-01-20 05:41:11",3),(4,"ac.mi.eleifend@Nullaeu.com","Gail","Santiago","augue","2013-12-19 11:49:05",1),(5,"quis@interdumfeugiat.co.uk","Scarlet","Dickerson","et","2014-08-16 01:27:20",3),(6,"sollicitudin@Cras.net","Derek","Cummings","Proin","2014-02-06 11:08:05",2),(7,"a.facilisis@molestie.ca","Natalie","Montoya","Integer","2013-12-29 06:04:11",3),(8,"malesuada.fringilla@orci.edu","Declan","Joyner","urna.","2014-03-09 22:04:50",3),(9,"Fusce@hendreritconsectetuercursus.co.uk","Daniel","Bryan","mus.","2014-09-22 22:43:17",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (11,"convallis@mattis.org","Dakota","Bradley","erat,","2014-07-07 00:25:40",3),(12,"felis.orci.adipiscing@ornare.ca","Flynn","Gibson","lacinia","2014-03-30 17:14:21",3),(13,"elementum.at.egestas@ornarelibero.co.uk","Giselle","Sherman","dui","2014-09-29 22:37:33",2),(14,"pharetra.felis@sitamet.org","Audra","Warren","mi","2013-12-17 06:48:15",3),(15,"metus.In@necleo.co.uk","Ciaran","Contreras","aliquet","2014-04-01 05:44:08",2),(16,"et.euismod.et@tristique.net","Celeste","Mann","sollicitudin","2014-07-14 11:08:45",2),(17,"nisi.Mauris@Maurisquis.org","Ross","Dickerson","eget","2014-09-30 02:13:56",2),(18,"bibendum.fermentum.metus@DonecestNunc.edu","Bruce","Heath","a,","2013-11-19 13:38:07",2),(19,"purus@eu.com","Camden","Lee","enim.","2014-02-17 08:24:07",3),(20,"Curabitur.dictum.Phasellus@non.com","Gloria","Atkins","ut","2014-06-18 01:48:09",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (21,"sed.orci.lobortis@acmattisvelit.ca","Calvin","Burns","sem","2014-05-13 12:40:46",3),(22,"purus.gravida.sagittis@est.co.uk","Lillian","Harris","sem","2014-04-10 19:39:50",2),(23,"dictum.Proin.eget@pedeet.co.uk","Rebekah","Gutierrez","posuere","2013-12-10 21:54:22",3),(24,"adipiscing.lobortis.risus@ad.co.uk","Nasim","Ford","non","2014-07-26 04:23:28",1),(25,"aliquet@Vivamussit.net","Benjamin","Shields","adipiscing","2014-09-26 20:32:55",3),(26,"purus@auguescelerisque.org","Geraldine","Bennett","elit.","2014-05-10 14:02:20",1),(27,"Aliquam.nisl@liberomauris.ca","Meredith","Coffey","dictum","2014-04-10 12:38:31",2),(28,"neque@orciinconsequat.ca","Nayda","Lott","vitae,","2014-09-14 22:05:51",3),(29,"a.malesuada@varius.net","Adele","Fry","venenatis","2014-07-27 22:23:31",1),(30,"Nunc@arcuVestibulumante.edu","Chancellor","Palmer","ullamcorper.","2014-05-05 15:18:34",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (31,"turpis.egestas.Aliquam@nisl.edu","Tatum","Collins","magna.","2014-01-12 11:24:07",3),(32,"odio.a.purus@ridiculusmusAenean.edu","Griffith","Fuentes","enim","2014-02-27 17:16:21",1),(33,"purus.ac.tellus@ante.co.uk","Elliott","Harris","ullamcorper","2014-06-24 12:48:51",2),(34,"ligula.tortor.dictum@luctusetultrices.com","Igor","Sanchez","feugiat","2014-09-30 15:30:46",1),(35,"ridiculus@enim.ca","Quon","Campos","adipiscing,","2014-03-02 20:31:24",3),(36,"blandit.viverra@iaculis.net","Keane","Dennis","eget","2014-02-06 08:20:24",3),(37,"Suspendisse.non@faucibusorci.org","Alma","Calhoun","malesuada","2014-04-13 14:03:10",1),(38,"In.scelerisque@blanditenim.edu","Danielle","Mitchell","non","2014-10-06 05:32:34",1),(39,"Donec@a.org","Bell","Cross","Nunc","2014-07-25 14:08:58",1),(40,"Phasellus.libero@volutpatNulladignissim.ca","Cadman","Burt","eget,","2014-08-08 09:44:32",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (41,"gravida@quisturpisvitae.ca","Quentin","Cross","Duis","2014-09-19 08:54:22",1),(42,"rhoncus.id.mollis@acfeugiat.net","Kuame","Harrington","sit","2014-08-07 09:14:56",2),(43,"elit.pellentesque@semper.edu","Madeson","Holder","Curabitur","2014-03-09 22:35:27",3),(44,"interdum.ligula@eulacus.com","Cameron","Holder","massa","2014-10-01 08:03:04",2),(45,"Aenean.euismod.mauris@musAeneaneget.com","Xenos","Bruce","ut,","2013-12-04 00:35:28",2),(46,"lectus.Nullam.suscipit@Duis.net","Nelle","Glass","malesuada","2013-12-30 02:55:15",3),(47,"ut.sem@lobortistellusjusto.ca","Bert","Contreras","mollis","2014-02-20 08:56:49",3),(48,"Morbi.quis.urna@Aeneanegestas.edu","Cain","Neal","eget","2014-01-30 15:29:51",1),(49,"vitae@ligulaconsectetuerrhoncus.edu","Ashton","Gilliam","sed","2014-08-22 15:01:43",2),(50,"Maecenas@egetmollislectus.ca","Denton","Ware","Nullam","2014-04-24 03:13:16",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (51,"Phasellus.elit.pede@faucibusutnulla.org","Celeste","Dillon","auctor","2014-06-15 06:20:35",2),(52,"risus.Donec@tincidunt.net","Eden","Wade","velit","2014-05-03 12:09:08",3),(53,"fringilla.ornare@auctornonfeugiat.com","Ronan","Lynn","augue","2014-01-25 08:32:24",1),(54,"ornare@Curabitur.ca","Ivy","Hickman","Vestibulum","2014-10-10 14:24:01",1),(55,"Lorem@anteipsum.net","Kimberly","Shaw","libero.","2014-02-26 02:42:39",2),(56,"sit.amet@metusurna.org","Avram","Bowen","lorem,","2014-04-22 03:03:21",1),(57,"mauris.Integer.sem@arcuSedeu.com","Uriel","Lindsay","pede.","2014-10-12 21:24:04",3),(58,"Sed@Quisqueornaretortor.edu","Ivana","Hall","non","2014-05-11 16:45:30",1),(59,"amet@est.co.uk","Xyla","Salinas","pede.","2013-12-18 09:45:35",1),(60,"fringilla.ornare.placerat@musAeneaneget.org","Bethany","Rosales","enim.","2014-03-29 15:37:01",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (61,"nulla@idantedictum.net","Idola","Hoffman","sem","2014-09-30 04:47:58",3),(62,"Integer@Aeneansed.edu","Malcolm","Zimmerman","cursus","2014-02-15 11:23:54",2),(63,"enim.consequat@eleifend.co.uk","Chaim","Nolan","Vestibulum","2014-10-29 15:39:57",1),(64,"in.consectetuer@sollicitudinorci.net","Hilel","Kirk","ante","2014-09-27 12:16:18",1),(65,"egestas.Aliquam@arcu.edu","Kyra","Rios","volutpat","2014-03-03 22:07:05",3),(66,"turpis.non@aliquamiaculislacus.org","Unity","Petty","ante","2013-12-25 19:17:36",2),(67,"Cras.vulputate.velit@ipsum.co.uk","Quyn","Bush","felis.","2014-02-11 21:47:48",2),(68,"lobortis.nisi@Proinmi.ca","Judith","Conner","facilisis","2013-11-18 07:30:54",1),(69,"tortor.Nunc@sed.edu","Charlotte","Spencer","elit.","2014-03-14 00:51:02",3),(70,"consequat.purus.Maecenas@augue.co.uk","Dylan","Chase","facilisis,","2014-08-27 12:15:21",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (71,"hendrerit@sitamet.ca","Keelie","York","viverra.","2014-03-26 10:33:28",2),(72,"mauris@massalobortisultrices.net","Isaac","Peters","blandit","2014-09-21 23:05:25",3),(73,"Duis.at@nasceturridiculus.net","Marsden","Lyons","ligula.","2014-08-16 03:07:06",3),(74,"dolor.Quisque@ut.edu","Dexter","Leblanc","quam","2014-06-06 20:09:02",2),(75,"malesuada.ut.sem@urnajusto.edu","Emily","Freeman","dolor.","2014-03-08 10:22:02",2),(76,"elementum.lorem@estMauris.co.uk","Forrest","Livingston","Nulla","2014-04-17 08:36:49",1),(77,"elementum.at@non.net","Stephanie","Roberts","tellus","2014-09-02 12:54:10",1),(78,"Nulla@vitae.net","Avram","Hull","elit","2013-12-07 13:51:47",1),(79,"volutpat@maurisutmi.com","Michelle","Ewing","ante","2014-02-06 09:26:55",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (81,"mollis.lectus@imperdiet.com","Lucy","Battle","iaculis","2014-03-27 02:01:48",2),(82,"ac.turpis.egestas@velpede.ca","Tasha","Goodman","Nulla","2014-05-17 04:36:03",2),(83,"euismod.in@nectempusscelerisque.com","Gavin","Sweeney","mollis","2014-03-29 13:10:10",3),(84,"ut.quam@facilisisnon.edu","Ezekiel","Mckay","mauris","2013-12-13 15:38:47",3),(85,"aliquam@et.com","Uriah","George","venenatis","2014-05-26 03:17:15",1),(86,"feugiat.placerat@dolorFuscemi.net","Alec","Oliver","elementum","2014-04-11 16:21:52",2),(87,"turpis.egestas.Aliquam@Donec.co.uk","Logan","Conrad","turpis","2014-06-15 17:47:02",3),(88,"amet.consectetuer@Aeneaneuismodmauris.ca","Chaney","Mccray","risus","2013-11-12 17:33:06",1),(89,"magna.Sed@nequesed.edu","Ivan","Murray","sit","2014-09-30 10:54:52",1),(90,"Proin.mi.Aliquam@sollicitudina.org","Octavia","Cash","metus","2014-04-01 03:47:51",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (91,"Donec.non.justo@elitpellentesque.edu","Wayne","Alvarado","dolor","2014-04-30 22:25:27",1),(92,"non.enim.Mauris@risusDuis.com","Kay","Finch","faucibus","2014-03-04 15:32:45",2),(93,"faucibus@MaurisnullaInteger.co.uk","Sacha","Cain","arcu.","2014-07-29 07:44:40",3),(94,"Curabitur.ut.odio@etultricesposuere.ca","Shoshana","Drake","tristique","2014-01-31 06:31:43",3),(95,"mauris@atvelit.com","Lesley","Reeves","sollicitudin","2014-09-07 11:48:31",1),(96,"pellentesque.a@Nullafacilisis.com","Deanna","Shepherd","lacus.","2013-11-09 08:04:44",3),(97,"erat@erat.edu","Dolan","Rosales","lorem","2013-11-03 12:02:30",1),(98,"mi@sit.ca","Aristotle","Carpenter","hendrerit.","2014-02-17 19:00:05",1),(99,"ridiculus.mus.Donec@loremfringilla.net","Lillith","Leblanc","tincidunt","2014-08-25 10:01:37",1),(100,"mus.Proin.vel@interdum.net","Mannix","Valencia","arcu.","2013-11-13 01:32:26",2);

INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (101,"amet.lorem.semper@aliquet.com","Jolene","Santiago","eros","2014-07-24 09:37:28",2),(102,"et@sedliberoProin.ca","Felix","Summers","dignissim","2014-01-10 15:27:50",2),(103,"turpis.In.condimentum@vitaeodio.co.uk","Marah","Parks","molestie","2014-06-09 02:21:14",2),(104,"eleifend.non.dapibus@viverraMaecenasiaculis.edu","Lance","Hurley","et","2013-12-07 00:39:46",1),(106,"placerat@convallis.net","Inga","Valentine","elit","2014-08-20 04:20:40",1),(107,"aliquam.eros.turpis@penatibus.ca","Igor","Perkins","Vivamus","2013-12-30 03:00:30",3),(108,"Cras@lorem.ca","Quamar","Lyons","neque","2014-09-06 04:25:40",1),(109,"Phasellus.dolor.elit@Quisquenonummyipsum.net","Kermit","Conway","rutrum.","2014-01-03 12:45:06",2),(110,"nec.tempus@nonantebibendum.net","Bertha","Guerra","enim","2014-08-31 23:11:07",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (111,"Nulla@nuncsedlibero.com","Jamal","Floyd","aliquet.","2013-12-20 12:00:35",2),(112,"sem@felis.net","Acton","Shields","semper","2014-05-23 04:02:42",1),(113,"lorem@nonnisiAenean.com","Maile","Knapp","dis","2014-04-18 21:31:10",2),(114,"et@lobortis.com","Simone","Howe","laoreet,","2014-03-11 00:23:44",2),(115,"faucibus.ut.nulla@Sed.co.uk","Rudyard","Walker","id","2014-06-22 14:22:40",2),(116,"libero@id.ca","Lev","Harrison","facilisis","2014-08-22 06:42:45",2),(117,"semper.erat.in@aliquetlibero.edu","Mikayla","Barrera","Integer","2014-04-16 00:18:42",2),(118,"quis@posuerevulputate.edu","Echo","Stein","tellus.","2013-11-21 02:59:16",3),(119,"nec.ligula.consectetuer@velnislQuisque.ca","Heather","Black","parturient","2014-09-14 03:27:59",1),(120,"Cras.eu.tellus@nequetellusimperdiet.edu","Priscilla","Garza","Vivamus","2013-12-13 15:46:08",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (121,"nunc.ac@luctus.edu","Ferdinand","Barton","Curabitur","2014-06-03 09:03:36",1),(122,"commodo.at@Donecnibhenim.net","Shelly","Craft","ultricies","2014-10-08 10:24:27",2),(123,"Phasellus.ornare.Fusce@acmattisvelit.ca","Aaron","French","molestie","2014-03-26 12:52:09",2),(124,"Nulla.facilisis@diamdictum.com","Nerea","Nguyen","sed","2014-02-19 06:07:05",1),(125,"auctor.odio.a@velit.org","Galvin","Wilkinson","enim.","2014-04-24 19:22:08",3),(126,"volutpat.Nulla@elitafeugiat.co.uk","Thane","Ortega","a","2014-08-18 01:31:02",1),(127,"facilisis.non.bibendum@enimnon.org","Julian","Kline","augue","2014-06-09 08:44:26",1),(128,"Quisque.varius@habitantmorbitristique.com","Michelle","Torres","eu,","2014-07-24 10:35:31",3),(129,"lectus@lorem.com","Beck","English","elit.","2014-09-18 17:40:15",1),(130,"mauris.a@massa.ca","Ebony","Hernandez","interdum.","2014-05-27 15:40:10",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (131,"eu.tempor@eteuismod.com","Iliana","Holloway","aliquet","2013-11-29 08:40:09",3),(132,"ante.dictum.cursus@ligulaAenean.org","Caesar","Campos","magna","2014-05-07 23:09:12",2),(133,"Duis.gravida@lacusQuisquepurus.edu","Doris","Dominguez","dictum","2013-11-29 00:49:03",1),(134,"commodo.ipsum@rhoncusDonecest.net","Ryder","Britt","faucibus","2013-12-04 08:47:04",3),(135,"odio.vel.est@tempor.net","Caesar","Murray","at,","2014-09-19 16:41:46",2),(136,"tristique.pharetra@NullainterdumCurabitur.org","Germane","Edwards","accumsan","2014-09-10 20:45:39",2),(137,"ut@nibhdolornonummy.ca","Philip","Ball","primis","2014-06-06 03:28:11",2),(138,"Donec.egestas.Aliquam@asollicitudin.net","Rafael","Dawson","ipsum","2013-11-16 23:34:55",1),(139,"In@ultriciesdignissim.net","Celeste","Nolan","Donec","2014-04-18 21:52:02",3),(140,"amet@Maecenasmifelis.com","Salvador","Calderon","vel","2014-09-24 03:02:21",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (141,"Curabitur.sed@sagittisfelisDonec.com","Kiona","Pittman","mi","2014-04-08 04:47:11",1),(142,"tincidunt@Donecdignissim.ca","Darius","Roy","Curabitur","2014-03-18 18:42:43",2),(143,"sem.ut.cursus@sodalespurus.ca","Nissim","Rollins","sed","2013-12-02 00:37:46",1),(144,"interdum.Nunc.sollicitudin@diam.edu","Barclay","Coffey","sit","2014-09-02 15:31:05",2),(145,"id@duilectus.co.uk","Quail","Kinney","dui","2014-04-07 07:41:17",2),(146,"Duis.ac.arcu@sitametconsectetuer.org","Willow","Dean","ipsum","2014-08-07 02:16:29",2),(147,"ligula@ligulaelitpretium.org","Wing","Christensen","aliquet","2014-04-09 22:23:54",2),(148,"mollis.Integer.tincidunt@cursusvestibulumMauris.edu","Imogene","Howe","hendrerit.","2014-03-20 13:25:25",1),(149,"luctus@utpellentesque.net","Macaulay","Baxter","cursus.","2014-01-28 06:59:15",3),(150,"Nulla@velitinaliquet.com","Gage","Griffin","massa","2014-09-10 05:00:07",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (151,"Nulla.interdum.Curabitur@Duissit.ca","Tana","Garcia","Aliquam","2014-01-10 17:53:08",1),(152,"et.ultrices.posuere@lacusvarius.co.uk","Emi","Clark","Phasellus","2014-10-02 17:50:41",3),(153,"vehicula.aliquet@egestasAliquamnec.edu","Leo","Mosley","arcu.","2014-01-03 05:01:45",1),(154,"auctor.velit@nonjusto.org","Jeanette","Saunders","risus.","2014-01-14 11:12:46",2),(155,"tellus@purus.ca","Uma","Roberson","primis","2014-01-25 22:02:13",3),(156,"Donec.porttitor@Phaselluselitpede.ca","Harlan","Burris","sem","2013-12-28 09:34:12",1),(157,"interdum@interdum.com","Cairo","Jarvis","eu","2014-10-03 18:42:59",3),(158,"urna.Ut.tincidunt@apurusDuis.com","Addison","Ramirez","ac","2014-01-13 10:06:19",2),(159,"luctus.ipsum@urnaVivamus.edu","Yeo","Duke","felis","2014-02-28 22:51:18",3),(160,"sapien.Cras@Vestibulum.edu","Kendall","Hicks","nunc","2014-02-07 10:22:13",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (161,"fringilla@intempuseu.ca","Jolene","Mcbride","augue","2013-11-22 20:33:47",2),(162,"consectetuer.euismod@vulputate.co.uk","Lois","Browning","et,","2014-04-14 06:24:30",1),(163,"dictum@anteNunc.ca","Claire","Summers","nec","2014-03-06 07:36:41",3),(164,"sem.molestie.sodales@semper.ca","Maile","Tran","neque","2014-02-09 13:57:00",3),(165,"elit@montes.co.uk","Amery","Chaney","dis","2014-02-04 13:09:25",1),(166,"tempus.eu@consequatnecmollis.edu","Conan","Levine","Morbi","2014-08-15 07:47:18",1),(167,"erat@arcuNuncmauris.edu","Curran","Booker","nascetur","2014-07-16 18:21:02",3),(168,"congue.turpis@acorciUt.co.uk","Chantale","Massey","nunc","2014-03-04 05:55:12",2),(169,"et@anteblanditviverra.org","Abra","Myers","sed","2014-09-03 12:22:16",3),(170,"fringilla@Duisrisus.co.uk","Penelope","Patrick","Donec","2014-04-22 00:18:40",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (171,"nisi@dapibusligulaAliquam.co.uk","Kirestin","Watkins","erat.","2014-04-08 14:19:47",3),(172,"amet.metus@euodio.ca","Winifred","Webster","a,","2013-12-25 14:23:22",3),(173,"mauris.sagittis.placerat@quis.edu","Leah","Drake","ut,","2013-11-05 10:01:39",2),(174,"non.massa@ametanteVivamus.ca","Ivory","Richard","luctus","2014-04-17 21:14:12",1),(175,"sapien.cursus@Praesent.ca","Damian","Howell","egestas.","2014-02-12 14:55:38",3),(176,"ut.eros@tellusPhaselluselit.com","Teegan","Ball","tortor.","2014-05-16 06:22:55",3),(177,"parturient.montes.nascetur@nibh.ca","Geraldine","Powell","Cum","2014-04-23 22:06:56",2),(178,"ac@gravidanonsollicitudin.co.uk","Drew","Serrano","odio.","2014-08-09 10:24:52",3),(179,"in.lobortis@nonummyultriciesornare.net","Jerry","Leach","turpis.","2014-05-20 00:05:08",3),(180,"est.tempor.bibendum@scelerisqueloremipsum.net","Amy","Bolton","convallis","2014-04-26 13:26:31",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (181,"sit.amet.ante@idlibero.edu","Kyle","Callahan","placerat,","2014-06-11 10:57:46",1),(182,"tempor@convallisligulaDonec.co.uk","Amal","Travis","elementum","2014-10-02 09:39:06",1),(183,"ac@Phasellusornare.org","Jane","Massey","leo","2014-07-31 17:17:00",1),(184,"aliquet.nec@eratvitaerisus.co.uk","Katell","Gay","scelerisque","2014-02-11 12:19:05",2),(185,"purus@egetmetusIn.ca","Lilah","Cooke","feugiat","2014-01-09 22:15:50",3),(186,"Fusce.dolor@euaugueporttitor.net","Amaya","Kinney","parturient","2014-09-19 21:27:18",2),(187,"Pellentesque.habitant.morbi@vitaealiquam.ca","Kasimir","Bauer","Cras","2014-06-27 14:38:06",3),(188,"Proin@hendreritconsectetuer.net","Karina","Phelps","Donec","2013-11-25 05:39:58",1),(189,"Vestibulum@porttitortellusnon.edu","Xerxes","Crawford","amet","2014-04-16 18:38:30",2),(190,"metus@malesuadafringillaest.edu","Elizabeth","Reese","adipiscing","2014-09-25 01:55:33",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (191,"dictum@velit.com","Tate","Cline","ullamcorper","2013-11-19 21:32:52",2),(192,"quis.diam.luctus@magnanecquam.edu","Kimberley","Maddox","metus.","2014-08-29 20:34:36",1),(193,"sed@sociisnatoquepenatibus.ca","Piper","Combs","urna","2014-10-05 11:36:53",3),(194,"augue@consectetuer.com","Clark","Miles","quis","2014-01-27 06:53:10",1),(195,"scelerisque.sed@Nunclectus.ca","Ginger","Sosa","felis","2014-01-14 08:08:15",1),(196,"suscipit.nonummy@ideratEtiam.org","Reagan","Golden","metus","2013-11-10 16:42:22",1),(197,"interdum.Sed.auctor@sociisnatoquepenatibus.org","Louis","Gibbs","rutrum","2014-02-22 07:48:25",3),(198,"blandit@nunc.edu","Oleg","Blankenship","Integer","2014-10-30 20:32:24",2),(199,"velit.Cras.lorem@semperNamtempor.org","Melanie","Peters","Duis","2014-08-06 15:50:23",2),(200,"congue@nec.edu","Anthony","Drake","ligula.","2013-12-29 02:56:03",2);

INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (201,"pede@vestibulumMauris.ca","Hedley","Daniels","iaculis","2014-04-25 23:45:28",3),(202,"Lorem@Vivamuseuismodurna.org","Alfonso","Villarreal","purus,","2014-03-31 07:09:27",2),(203,"Aenean@Aliquamnec.edu","Amir","Ramirez","urna.","2014-04-03 05:04:55",3),(204,"ac@variusorciin.co.uk","Neil","Hunt","Duis","2014-09-19 03:56:56",2),(205,"nisl@Integer.co.uk","Kai","Rush","egestas.","2014-08-02 16:16:51",2),(206,"Proin.mi@ligulaeuenim.edu","Neville","Kidd","est","2014-06-04 05:30:21",1),(207,"quis.diam@Nulla.org","Darryl","Price","eu","2014-09-17 19:46:00",3),(208,"In@enimdiamvel.edu","Halla","Moore","pede","2014-10-28 07:42:19",3),(209,"enim@lacusCrasinterdum.edu","Gil","Hart","vitae","2014-10-29 23:23:00",1),(210,"id.mollis.nec@In.co.uk","Frances","Kim","mi.","2013-12-27 13:16:47",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (211,"nunc.sit.amet@eratvolutpat.com","Katell","Puckett","orci.","2014-10-02 01:59:23",1),(212,"Mauris@tempusnon.co.uk","Jerome","Rivera","turpis","2014-07-30 02:26:28",2),(213,"congue@consequat.com","Silas","Christensen","dui.","2014-08-31 03:11:51",2),(214,"feugiat.nec@nequevenenatislacus.edu","Shafira","Pratt","Nunc","2014-09-19 04:30:08",2),(215,"Morbi.sit@diameudolor.com","Hall","Leon","nostra,","2014-03-08 13:18:21",1),(216,"congue.elit.sed@nislarcu.ca","Odessa","Downs","In","2014-06-03 15:58:21",1),(217,"eu.eleifend@ridiculusmusDonec.com","Duncan","Guerrero","odio,","2014-09-27 16:14:12",3),(218,"cursus.et.magna@elitpellentesque.co.uk","Jennifer","Colon","eu","2014-09-29 14:41:45",3),(219,"id.erat@Etiamimperdiet.net","Brennan","Gibbs","diam","2014-04-19 08:04:43",3),(220,"felis.Nulla.tempor@amet.net","Ashely","Potts","id,","2014-02-18 20:02:51",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (221,"magna.sed.dui@amet.com","Amelia","Chen","nec","2013-11-27 04:45:20",3),(222,"Phasellus@egestas.com","Summer","Leach","nec,","2013-12-15 00:01:32",2),(223,"Proin.non@purus.org","Conan","Dyer","pede","2014-05-10 17:23:36",1),(224,"vestibulum.Mauris@sed.ca","Evelyn","Ruiz","leo.","2014-01-08 19:53:24",1),(225,"egestas.hendrerit@eleifendnunc.ca","Moana","Hill","lorem,","2013-12-22 13:13:52",2),(226,"mattis.Cras@pharetranibh.co.uk","Thomas","Newton","mus.","2014-05-31 14:19:21",3),(227,"Nullam.scelerisque@ullamcorperDuiscursus.edu","Demetria","Maxwell","Donec","2013-12-17 17:19:42",3),(228,"ornare.libero.at@magnaet.ca","Tyrone","Talley","at,","2014-07-13 23:19:14",1),(229,"a.odio@purusinmolestie.co.uk","Candice","Mcfadden","Phasellus","2014-05-21 22:17:06",1),(230,"gravida.nunc@consectetuereuismodest.ca","Chastity","Barry","Nam","2014-09-30 14:34:55",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (231,"Curabitur@eratsemperrutrum.com","Jordan","Rodriquez","interdum.","2014-05-12 21:58:53",1),(232,"eu.sem.Pellentesque@lectusjusto.co.uk","Veda","Hebert","Quisque","2013-12-25 00:31:10",1),(233,"Nulla.tincidunt@dolorelit.com","Orson","Dennis","eget,","2014-07-14 19:59:53",2),(234,"amet@vitaealiquameros.edu","Daniel","Mccall","felis","2014-07-09 06:17:51",3),(235,"eget@lobortis.ca","Jessamine","Byers","consectetuer","2014-04-17 05:25:41",2),(236,"vitae@mieleifend.com","Brendan","Lowery","erat","2014-04-25 12:13:58",1),(237,"Curabitur.ut@Lorem.org","Irma","Palmer","elit.","2014-07-06 10:45:20",3),(238,"est.mollis@quis.ca","Ethan","Spence","eget","2013-11-20 13:52:08",1),(239,"tincidunt@utodiovel.org","Aileen","Gamble","feugiat.","2014-05-16 04:28:31",1),(240,"augue.eu@necorciDonec.ca","Aphrodite","Rios","est","2013-11-21 00:32:38",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (241,"nibh.Donec@habitantmorbitristique.org","Aiko","Mcfarland","est","2014-09-10 20:15:00",2),(242,"lectus.ante.dictum@arcuacorci.com","Uta","Sandoval","faucibus","2014-05-30 23:04:02",1),(243,"dapibus@imperdietnon.co.uk","Isabella","Valentine","Mauris","2014-02-10 20:44:27",2),(244,"Cras.convallis@eumetus.co.uk","Len","Tucker","commodo","2013-12-18 20:54:19",1),(245,"tristique.aliquet.Phasellus@magnaNam.net","Jerome","Sanchez","Fusce","2013-11-23 08:38:25",2),(246,"ultrices@tristique.com","Renee","Velazquez","parturient","2013-12-03 19:04:33",2),(247,"scelerisque@Inornare.org","Brian","Ward","dignissim.","2014-05-18 10:27:54",2),(248,"purus.Nullam@DonecegestasDuis.co.uk","Abdul","Patterson","nibh","2013-11-16 02:37:42",2),(249,"sed.libero.Proin@ametfaucibusut.org","Vera","Sharp","eu","2014-05-04 06:05:47",1),(250,"Morbi.sit@Vivamusnibhdolor.com","Wynne","Barber","nisl.","2014-07-30 16:42:22",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (251,"dolor.dapibus@sedsemegestas.net","Leo","Carpenter","placerat,","2014-06-10 04:50:18",3),(252,"inceptos@Morbi.edu","Gary","Benjamin","ligula.","2014-09-02 15:26:29",3),(253,"amet.risus.Donec@euultricessit.com","Camilla","Vincent","eu","2013-12-20 11:56:08",3),(254,"ligula.Nullam@dolordolortempus.com","Slade","Christensen","magna.","2014-05-07 22:36:42",3),(255,"Phasellus.fermentum.convallis@Etiamligulatortor.co.uk","Nathan","Farmer","sollicitudin","2014-04-13 02:32:40",2),(256,"malesuada.augue@In.edu","Emerald","Oconnor","orci","2014-07-15 19:43:01",2),(257,"nec.tellus.Nunc@nullavulputate.edu","Hope","Hicks","Donec","2014-08-08 06:08:29",1),(258,"eget.ipsum@et.org","Ignacia","Cox","auctor,","2014-03-09 21:26:08",1),(259,"Vivamus@sitamet.ca","Tanisha","Becker","faucibus","2014-02-19 00:06:57",3),(260,"vitae@molestiepharetranibh.co.uk","Nigel","Hood","faucibus","2014-06-04 09:55:55",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (261,"Nulla.tempor@atortorNunc.edu","Maya","Shannon","eget","2014-05-29 20:25:04",2),(262,"arcu.vel@Quisque.ca","Kieran","Harvey","lobortis.","2014-06-16 02:46:17",2),(263,"metus.In.lorem@Fusce.ca","Price","Monroe","Morbi","2014-02-10 20:18:56",2),(264,"Sed.eu.nibh@tincidunttempusrisus.com","Adena","Mack","a","2014-07-04 18:39:22",3),(265,"placerat.augue.Sed@Curabituregestasnunc.co.uk","Jin","Blair","Integer","2014-01-02 13:59:23",2),(266,"tincidunt.nunc@dictummiac.com","Caleb","Freeman","convallis,","2014-09-10 16:11:27",1),(267,"vulputate.eu.odio@ultriciesornare.co.uk","Pearl","Harris","sit","2013-12-26 07:57:45",1),(268,"fermentum@ante.ca","Martina","Manning","ultrices.","2014-10-21 05:12:37",2),(269,"sapien.Cras.dolor@Quisque.com","Galena","Garza","sociis","2014-07-28 11:35:16",2),(270,"turpis@etmagnisdis.edu","Hope","Gray","mauris","2014-01-07 03:10:26",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (271,"pretium.et.rutrum@eget.net","Geraldine","Workman","lorem,","2013-12-31 11:38:17",3),(272,"nec.diam@eratsemper.ca","Lawrence","Dickerson","elit","2014-05-05 07:32:32",1),(273,"Integer@pellentesquemassalobortis.edu","Iola","Cline","tristique","2014-02-26 06:17:34",3),(274,"amet.risus@estmauris.edu","Jane","Estrada","elit","2013-12-06 13:27:54",1),(275,"et@magna.net","Neil","Powers","Maecenas","2013-12-19 07:20:58",2),(276,"tellus@Proinvel.co.uk","Pearl","Shepard","feugiat.","2014-05-26 11:15:48",3),(277,"consectetuer@orciUt.com","Baker","Dickerson","Sed","2014-01-12 11:17:24",2),(278,"gravida.Aliquam@dictumeu.ca","Charissa","Berry","orci","2014-09-16 19:41:05",1),(279,"varius.et.euismod@turpisNullaaliquet.com","Gabriel","Moreno","Cum","2014-05-19 23:39:08",2),(280,"Cras.eu.tellus@adlitora.ca","Hayden","Odom","non","2013-12-03 08:57:02",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (281,"et.arcu.imperdiet@fringillami.com","Rhoda","Lara","Phasellus","2013-12-15 06:39:39",2),(282,"nibh.Donec@elitNullafacilisi.ca","David","Shepard","dolor.","2014-05-26 05:35:22",1),(283,"posuere.at.velit@dignissim.com","Yoshio","Larson","dolor.","2014-04-03 17:28:39",2),(284,"Phasellus.libero@utlacus.org","Venus","Buchanan","convallis","2014-06-29 14:25:40",1),(285,"pharetra.sed@risus.edu","Gray","Lynn","Donec","2013-11-21 14:41:06",2),(286,"ligula.Nullam@velit.com","Drake","Alexander","tortor.","2014-10-21 21:52:45",1),(287,"non@quis.org","Susan","Acosta","mauris","2014-05-31 13:17:52",2),(288,"vel.venenatis@arcuMorbisit.org","Kalia","Mcleod","odio","2014-04-17 23:04:03",3),(289,"Nullam.ut@Aliquamnisl.co.uk","Beck","Myers","libero","2013-11-27 16:15:23",2),(290,"eget.mollis@enimSednulla.org","Dacey","Beck","risus.","2014-08-31 23:42:00",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (291,"nisl@ornare.org","Kellie","Sanford","placerat","2013-12-09 06:37:48",2),(292,"erat.Vivamus.nisi@magna.edu","Hilary","Blankenship","aliquam,","2014-01-21 01:13:17",3),(293,"rutrum@anteiaculisnec.net","Noel","Patel","per","2014-09-01 08:35:41",3),(294,"non.enim.commodo@porttitorvulputateposuere.net","Madeline","Spencer","rhoncus","2014-08-14 13:08:35",1),(295,"nec.cursus.a@lacus.co.uk","Amos","Dorsey","eleifend.","2013-12-09 15:38:07",3),(296,"in.tempus.eu@nec.ca","Ulric","Larsen","velit","2014-07-20 08:15:32",2),(297,"erat.nonummy@sapienAeneanmassa.ca","Demetrius","Lane","augue","2014-08-08 12:17:40",1),(298,"nulla.Integer@ut.net","Demetria","Vinson","purus","2014-08-25 16:23:23",2),(299,"est@et.co.uk","Kelly","Odonnell","vitae","2013-12-06 09:55:06",2),(300,"et.risus@neque.com","Sophia","Dennis","augue","2014-08-10 14:38:54",3);

INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (301,"Mauris@iaculis.ca","Valentine","Conway","senectus","2014-04-07 01:11:47",3),(302,"ante.dictum@morbi.net","Adele","Mccarty","pede,","2013-12-29 01:33:59",2),(303,"sed@idmagna.org","Demetria","Knapp","Nullam","2014-03-27 01:57:26",1),(304,"risus@vitaevelit.org","Barry","Marshall","sed,","2014-05-29 14:32:24",2),(305,"lorem.ipsum@pellentesquea.ca","Hu","Barr","molestie","2014-01-11 01:38:55",2),(306,"ultrices.a.auctor@ornaretortor.co.uk","Amy","Webster","metus.","2014-07-20 07:46:37",1),(307,"ullamcorper.Duis.at@purusNullamscelerisque.co.uk","Fallon","Hopkins","Aenean","2013-12-22 10:45:48",2),(308,"tellus.imperdiet@nibhlaciniaorci.org","Aline","Monroe","Etiam","2014-01-20 17:35:24",3),(309,"molestie.arcu.Sed@tristique.ca","Jamalia","Dorsey","Mauris","2014-08-17 19:27:50",1),(310,"odio.Aliquam.vulputate@nonummy.ca","Tanner","Irwin","libero","2014-06-26 15:15:11",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (311,"facilisis@sed.org","Lacey","Frost","lobortis","2014-02-13 18:30:45",2),(312,"tempor.arcu@nec.net","Sybil","Calhoun","Donec","2014-02-18 22:36:08",3),(313,"nec@tellusid.net","Cedric","Sanchez","tristique","2014-05-30 16:03:38",2),(314,"a.dui.Cras@sagittis.com","Lunea","Harrell","at","2014-07-26 09:23:18",1),(315,"lobortis.quam.a@ipsumporta.net","Daryl","Clayton","cursus","2014-06-23 02:18:59",3),(316,"auctor.ullamcorper@CuraeDonec.co.uk","Alexander","Hooper","vulputate,","2013-11-19 22:49:06",2),(317,"Nunc.ut@arcuVivamus.edu","Alexa","Mckay","semper","2013-11-29 11:40:18",2),(318,"et@atnisiCum.ca","Macon","Klein","magnis","2014-02-03 14:05:19",2),(319,"nunc.nulla.vulputate@Aliquam.net","Martin","Alston","Nunc","2014-08-28 08:00:10",2),(320,"et.eros.Proin@aliquamiaculis.com","Seth","Delaney","Suspendisse","2013-12-03 15:11:20",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (321,"a@augue.edu","Jasper","Raymond","nibh.","2014-04-27 19:15:19",1),(322,"nibh.Donec.est@aliquamerosturpis.ca","Alexandra","Haney","massa.","2014-05-29 19:50:58",1),(323,"turpis.In.condimentum@semconsequat.org","Blythe","Mckay","libero","2014-09-17 04:13:49",1),(324,"nisi.sem@diamnunc.com","Joan","Jenkins","ante,","2014-03-06 04:57:53",3),(325,"non@volutpat.co.uk","Guinevere","Harris","orci.","2014-03-22 20:00:55",2),(326,"neque.sed.dictum@sed.net","Shay","Robinson","Proin","2014-03-05 17:15:28",3),(327,"In.nec@ipsumprimisin.edu","Kirsten","Cooper","at,","2014-03-31 04:11:20",3),(328,"odio.Nam.interdum@Proin.com","Maile","Steele","Etiam","2014-02-25 09:06:21",2),(329,"metus.Aliquam@sapien.org","Nomlanga","Buck","Vivamus","2014-10-11 18:24:13",1),(330,"quam.elementum@nondui.co.uk","Emery","Weber","Sed","2014-08-23 05:15:17",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (331,"et@pretiumaliquet.com","Ivory","Pitts","vel","2013-11-10 16:12:00",2),(332,"Curae@FuscefeugiatLorem.org","Kerry","Lott","sit","2014-05-11 18:44:57",1),(333,"eu.tellus.eu@nislelementum.com","Randall","Fletcher","ac","2014-02-20 21:17:05",1),(334,"Class.aptent@semperauctor.com","Leilani","Newman","vel","2014-09-22 03:17:44",1),(335,"hendrerit@ligulaAeneaneuismod.com","Kitra","Gay","Nunc","2014-05-09 23:29:26",1),(336,"Lorem@Sed.org","Hilary","Golden","ligula.","2014-08-11 22:16:57",2),(337,"eu@liberoProinsed.org","Bo","Calderon","sed","2014-07-25 22:06:50",1),(338,"sit.amet.consectetuer@lobortis.co.uk","Ocean","Farrell","nunc.","2013-11-25 18:51:05",2),(339,"amet.consectetuer.adipiscing@pedePraesent.net","Jerome","Craig","parturient","2014-08-06 17:29:15",1),(340,"semper.rutrum.Fusce@lacuspede.ca","Evangeline","York","Donec","2014-03-20 06:32:08",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (341,"Duis@tristique.edu","Akeem","Hooper","Vestibulum","2014-08-21 14:40:03",1),(342,"ipsum.primis@dolorFuscefeugiat.edu","Stella","Wood","ut,","2014-10-11 15:13:02",3),(343,"ut.ipsum@erosnectellus.org","Gwendolyn","Mcclain","Phasellus","2014-05-17 00:20:24",3),(344,"Phasellus.fermentum@facilisisvitae.edu","Veda","Hull","arcu","2014-05-30 18:17:43",2),(345,"Cras.eu.tellus@eleifendnondapibus.edu","Claudia","Trevino","ornare,","2014-10-11 03:25:41",1),(346,"purus.mauris.a@acfeugiat.com","Melyssa","Valencia","Morbi","2014-06-06 12:20:21",2),(347,"quam.a@ornareIn.co.uk","Xanthus","Stone","vitae","2014-08-09 14:40:21",3),(348,"eget.venenatis@aliquet.org","Walter","Porter","nec","2014-09-07 09:03:25",1),(349,"convallis.in.cursus@in.co.uk","Macon","Branch","faucibus","2014-01-31 02:21:08",3),(350,"amet@adipiscingelit.ca","Andrew","Pitts","nec,","2013-11-28 12:21:07",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (351,"mi@ametmetus.com","Akeem","Ramirez","mollis","2014-03-13 19:00:27",2),(352,"pretium.neque@semperauctorMauris.org","Vance","Faulkner","Phasellus","2014-03-23 09:15:11",3),(353,"Quisque.purus@Aliquameratvolutpat.edu","Dexter","Quinn","dolor.","2014-07-26 21:38:23",3),(354,"vitae.risus.Duis@interdumNunc.co.uk","Quentin","Lynn","mus.","2014-03-04 22:48:02",1),(355,"tincidunt.nibh@enimsit.com","Haviva","Fox","tellus.","2014-03-21 02:04:37",1),(356,"blandit.viverra@afacilisis.co.uk","Trevor","Parker","cursus","2013-12-14 02:25:22",3),(357,"imperdiet.nec@etultricesposuere.co.uk","Melvin","Crane","mi","2013-11-12 19:46:21",2),(358,"semper@mattisvelitjusto.co.uk","Karen","Richmond","massa.","2014-06-12 18:06:34",1),(359,"nec.urna.et@sodaleselit.net","Kevin","Serrano","risus.","2014-07-30 13:37:41",2),(360,"nisi@Nullamvelit.ca","Kiayada","Blanchard","fringilla","2013-12-28 14:19:48",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (361,"Curabitur@vitaevelit.co.uk","Kimberley","Wolf","eu,","2014-06-07 18:14:50",3),(362,"interdum.libero@Namnullamagna.co.uk","Joel","Bolton","dolor.","2013-12-08 10:13:53",2),(363,"Aliquam@ornaretortor.net","Jeanette","Horne","convallis","2014-02-02 22:46:59",3),(364,"eu.eros@odioPhasellus.edu","Marcia","Fuller","Etiam","2013-11-06 03:25:07",3),(365,"erat.Sed@Nunccommodo.edu","Adam","Weiss","In","2014-02-24 08:35:53",1),(366,"nisl@utcursus.co.uk","Dakota","Ruiz","urna","2014-06-09 07:33:54",1),(367,"lacinia.vitae@ligulaconsectetuerrhoncus.co.uk","Bethany","Mcintyre","scelerisque","2014-07-13 09:28:20",3),(368,"ac@inhendreritconsectetuer.edu","Joel","Steele","ipsum","2014-04-29 03:26:52",1),(369,"augue.Sed.molestie@arcuVestibulum.com","Pandora","Foley","tortor","2014-01-21 23:48:18",2),(370,"eu.neque.pellentesque@sociisnatoquepenatibus.org","Graiden","Mccullough","per","2014-01-06 15:02:45",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (371,"metus.Vivamus.euismod@faucibusorci.edu","Paloma","Cannon","adipiscing.","2013-12-17 19:04:03",1),(372,"molestie@velconvallisin.edu","Ciaran","Roberts","a","2014-06-28 00:31:34",1),(373,"tempus.mauris@aliquetdiamSed.edu","Chiquita","Boyle","facilisis","2014-07-26 10:34:08",2),(374,"diam.nunc@Etiamgravida.net","Althea","Medina","In","2014-01-24 17:43:51",2),(375,"erat.eget@maurisanunc.co.uk","Sierra","Bailey","erat,","2014-02-04 21:22:22",3),(376,"Nunc@enimSuspendissealiquet.com","Yael","Rios","tellus","2014-03-10 08:33:33",3),(377,"libero.dui.nec@sodales.ca","Christine","Turner","Fusce","2014-10-06 18:10:59",1),(378,"netus.et.malesuada@amalesuada.com","Edan","England","eget","2013-11-14 06:55:28",1),(379,"nonummy.ut.molestie@felispurus.org","Shelley","Aguilar","dui.","2014-07-11 14:44:31",2),(380,"mi@nondapibus.net","Taylor","Crosby","egestas","2014-01-29 16:29:24",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (381,"dictum@atvelit.net","Amal","Tran","ac","2014-09-19 08:34:35",1),(382,"porttitor@mattisvelitjusto.edu","Amy","Pena","non,","2014-03-23 10:14:28",1),(383,"aliquam.iaculis.lacus@semper.co.uk","Aileen","Trujillo","accumsan","2014-05-19 09:04:47",2),(384,"egestas.blandit.Nam@eget.ca","Dennis","Warner","Morbi","2014-02-28 00:32:12",1),(385,"orci@Praesentinterdum.edu","Jermaine","Oneal","odio","2014-08-25 12:37:34",3),(386,"netus@malesuadavelconvallis.com","Alea","Mcleod","pede","2014-08-02 12:01:01",1),(387,"dictum@nisiAeneaneget.net","Ora","Daugherty","ornare,","2014-08-04 09:04:20",2),(388,"eu@gravidaAliquam.org","Clayton","Houston","ornare","2013-12-24 16:20:10",3),(389,"dui.augue@Utsemper.ca","Shea","Barker","lorem.","2013-11-29 12:18:31",1),(390,"est.tempor@ornare.com","Holly","Nash","sociis","2014-05-26 01:52:03",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (391,"et.euismod@Donecfelis.net","Mariam","Vargas","commodo","2014-05-17 08:16:38",3),(392,"magna.Lorem@Nullam.net","Kaye","Nguyen","orci","2014-02-23 12:21:01",3),(393,"cursus@egetmagnaSuspendisse.com","Dominic","Strong","felis.","2014-03-24 05:27:47",2),(394,"vestibulum.Mauris.magna@Aliquamgravida.co.uk","Hoyt","Rice","natoque","2014-09-02 11:00:22",2),(395,"fermentum.vel@loremipsumsodales.org","Mona","Clay","ullamcorper.","2014-01-16 11:02:40",3),(396,"vitae.sodales.nisi@famesac.ca","Abraham","Palmer","magna","2014-08-05 11:33:11",2),(397,"mattis@diamPellentesque.com","Karleigh","Watkins","In","2013-12-13 12:30:54",2),(398,"tincidunt@odioNaminterdum.co.uk","Amir","French","Cras","2013-11-27 10:17:34",2),(399,"Suspendisse@Innec.net","Alexandra","Barnes","iaculis,","2014-06-26 13:17:24",3),(400,"natoque@sapiencursus.ca","Reece","Farley","aptent","2014-04-04 00:53:08",2);

INSERT INTO `LESSON` (`id`,`startTime`,`finishTime`) VALUES (1,"2013-11-02 08:30:00","2013-11-02 09:15:00"),(2,"2013-11-02 09:25:00","2013-11-02 10:10:00"),(3,"2013-11-02 10:30:00","2013-11-02 11:15:00"),(4,"2013-11-02 11:30:00","2013-11-02 12:15:00"),(5,"2013-11-02 12:25:00","2013-11-02 13:10:00"),(6,"2013-11-02 13:20:00","2013-11-02 14:05:00"),(7,"2013-11-02 14:10:00","2013-11-02 14:55:00"),(8,"2013-11-02 15:00:00","2013-11-02 15:45:00");

INSERT INTO `COURSE` (`id`,`additional`,`coeficient`,`courseName`,`groupNumber`,`price`) VALUES (1,0,1,"Algebra",5,0),(2,0,1,"Algebra",6,0),(3,0,1,"Algebra",7,0),(4,0,1,"Algebra",8,0),(5,0,1,"Algebra",9,0),(6,0,1,"Math analys",10,0),(7,0,1,"Math analys",11,0),(8,0,1,"Math analys",9,0),(9,0,1,"Ukrainian",5,0),(10,0,1,"Ukrainian",6,0),(11,0,1,"Ukrainian",7,0),(12,0,1,"Ukrainian",8,0),(13,0,1,"Ukrainian",9,0),(14,0,1,"Ukrainian",10,0),(15,0,1,"Ukrainian",11,0),(16,0,1,"English",5,0),(17,0,1,"English",6,0),(18,0,1,"English",7,0),(19,0,1,"English",8,0),(20,0,1,"English",9,0),(21,0,1,"English",10,0),(22,0,1,"English",11,0),(23,0,1,"Biology",5,0),(24,0,1,"Biology",6,0),(25,0,1,"Biology",7,0),(26,0,1,"Biology",8,0),(27,0,1,"Biology",9,0),(28,0,1,"Biology",10,0),(29,0,1,"Biology",11,0),(30,0,1,"Chemistry",5,0),(31,0,1,"Chemistry",6,0),(32,0,1,"Chemistry",7,0),(33,0,1,"Chemistry",8,0),(34,0,1,"Chemistry",9,0),(35,0,1,"Chemistry",10,0),(36,0,1,"Chemistry",11,0),(37,0,1,"Physics",5,0),(38,0,1,"Physics",6,0),(39,0,1,"Physics",7,0),(40,0,1,"Physics",8,0),(41,0,1,"Physics",9,0),(42,0,1,"Physics",10,0),(43,0,1,"Physics",11,0),(44,0,1,"History",5,0),(45,0,1,"History",6,0),(46,0,1,"History",7,0),(47,0,1,"History",8,0),(48,0,1,"History",9,0),(49,0,1,"History",10,0),(50,0,1,"History",11,0),(51,0,1,"Ukrainian literature",5,0),(52,0,1,"Ukrainian literature",6,0),(53,0,1,"Ukrainian literature",7,0),(54,0,1,"Ukrainian literature",8,0),(55,0,1,"Ukrainian literature",9,0),(56,0,1,"Ukrainian literature",10,0),(57,0,1,"Ukrainian literature",11,0),(58,0,1,"Foreign literature",5,0),(59,0,1,"Foreign literature",6,0),(60,0,1,"Foreign literature",7,0),(61,0,1,"Foreign literature",8,0),(62,0,1,"Foreign literature",9,0),(63,0,1,"Foreign literature",10,0),(64,0,1,"Foreign literature",11,0),(65,0,1,"Geography",5,0),(66,0,1,"Geography",6,0),(67,0,1,"Geography",7,0),(68,0,1,"Geography",8,0),(69,0,1,"Geography",9,0),(70,0,1,"Geography",10,0),(71,0,1,"Geography",11,0),(72,1,3,"Quantum Physics",6,1000),(73,1,3,"Quantum Physics",7,1000),(74,1,3,"Quantum Physics",8,1000),(75,1,2,"Music lessons",6,500),(76,1,2,"Music lessons",7,500),(77,1,2,"Music lessons",8,500),(78,1,2,"Music lessons",5,500),(79,1,3,"Quantum Physics",5,1000);

INSERT INTO `ROOM` (`id`,`available`,`roomNumber`,`size`) VALUES (1,1,100,28),(2,1,101,27),(3,1,102,28),(4,1,103,28),(5,1,104,28),(6,1,105,29),(7,1,106,28),(8,1,107,25),(9,1,108,26),(10,1,109,27);
INSERT INTO `ROOM` (`id`,`available`,`roomNumber`,`size`) VALUES (11,1,110,26),(12,1,111,26),(13,1,112,26),(14,1,113,30),(15,1,114,25),(16,1,115,27),(17,1,116,27),(18,1,117,30),(19,1,118,25),(20,1,119,30);
INSERT INTO `ROOM` (`id`,`available`,`roomNumber`,`size`) VALUES (21,1,120,28),(22,1,121,28),(23,1,122,30),(24,1,123,28),(25,1,124,26),(26,1,125,28),(27,1,126,27),(28,1,127,29),(29,1,128,25),(30,1,129,26);
INSERT INTO `ROOM` (`id`,`available`,`roomNumber`,`size`) VALUES (31,1,130,29),(32,1,131,28),(33,1,132,28),(34,1,133,27),(35,1,134,25),(36,1,135,28),(37,1,136,29),(38,1,137,27),(39,1,138,25),(40,1,139,30);

INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=1 and ROLE.id=1;

INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=2 and ROLE.id=2;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=3 and ROLE.id=2;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=4 and ROLE.id=2;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=5 and ROLE.id=2;

INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=6 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=7 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=8 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=9 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=10 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=11 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=12 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=13 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=14 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=15 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=16 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=17 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=18 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=19 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=20 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=21 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=22 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=23 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=24 and ROLE.id=3;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=25 and ROLE.id=3;

INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=26 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=27 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=28 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=29 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=30 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=31 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=32 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=33 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=34 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=35 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=36 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=37 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=38 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=39 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=40 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=41 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=42 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=43 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=44 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=45 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=46 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=47 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=48 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=49 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=50 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=51 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=52 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=53 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=54 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=55 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=56 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=57 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=58 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=59 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=60 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=61 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=62 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=63 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=64 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=65 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=66 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=67 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=68 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=69 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=70 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=71 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=72 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=73 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=74 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=75 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=76 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=77 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=78 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=79 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=80 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=81 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=82 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=83 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=84 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=85 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=86 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=87 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=88 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=89 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=90 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=91 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=92 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=93 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=94 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=95 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=96 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=97 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=98 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=99 and ROLE.id=5;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=100 and ROLE.id=5;

INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=101 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=102 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=103 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=104 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=105 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=106 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=107 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=108 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=109 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=110 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=111 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=112 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=113 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=114 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=115 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=116 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=117 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=118 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=119 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=120 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=121 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=122 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=123 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=124 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=125 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=126 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=127 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=128 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=129 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=130 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=131 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=132 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=133 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=134 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=135 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=136 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=137 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=138 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=139 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=140 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=141 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=142 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=143 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=144 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=145 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=146 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=147 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=148 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=149 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=150 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=151 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=152 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=153 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=154 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=155 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=156 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=157 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=158 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=159 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=160 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=161 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=162 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=163 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=164 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=165 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=166 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=167 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=168 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=169 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=170 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=171 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=172 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=173 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=174 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=175 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=176 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=177 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=178 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=179 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=180 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=181 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=182 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=183 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=184 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=185 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=186 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=187 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=188 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=189 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=190 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=191 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=192 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=193 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=194 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=195 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=196 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=197 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=198 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=199 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=200 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=201 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=202 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=203 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=204 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=205 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=206 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=207 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=208 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=209 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=210 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=211 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=212 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=213 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=214 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=215 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=216 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=217 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=218 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=219 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=220 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=221 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=222 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=223 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=224 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=225 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=226 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=227 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=228 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=229 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=230 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=231 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=232 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=233 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=234 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=235 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=236 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=237 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=238 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=239 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=240 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=241 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=242 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=243 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=244 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=245 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=246 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=247 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=248 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=249 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=250 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=251 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=252 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=253 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=254 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=255 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=256 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=257 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=258 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=259 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=260 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=261 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=262 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=263 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=264 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=265 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=266 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=267 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=268 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=269 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=270 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=271 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=272 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=273 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=274 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=275 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=276 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=277 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=278 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=279 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=280 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=281 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=282 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=283 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=284 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=285 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=286 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=287 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=288 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=289 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=290 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=291 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=292 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=293 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=294 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=295 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=296 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=297 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=298 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=299 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=300 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=301 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=302 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=303 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=304 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=305 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=306 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=307 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=308 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=309 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=310 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=311 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=312 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=313 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=314 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=315 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=316 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=317 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=318 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=319 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=320 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=321 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=322 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=323 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=324 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=325 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=326 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=327 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=328 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=329 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=330 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=331 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=332 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=333 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=334 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=335 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=336 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=337 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=338 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=339 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=340 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=341 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=342 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=343 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=344 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=345 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=346 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=347 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=348 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=349 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=350 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=351 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=352 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=353 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=354 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=355 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=356 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=357 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=358 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=359 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=360 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=361 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=362 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=363 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=364 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=365 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=366 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=367 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=368 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=369 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=370 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=371 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=372 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=373 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=374 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=375 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=376 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=377 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=378 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=379 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=380 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=381 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=382 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=383 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=384 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=385 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=386 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=387 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=388 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=389 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=390 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=391 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=392 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=393 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=394 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=395 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=396 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=397 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=398 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=399 and ROLE.id=4;
INSERT INTO `USER_ROLE_REF` (`userId`,`roleId`) select USER.id, ROLE.id from USER inner join ROLE on USER.id=400 and ROLE.id=4;

INSERT INTO `TEACHER` (`id`,`isActive`,`rate`,`userId`) VALUES (1,1,4,6),(2,1,3,7),(3,1,4,8),(4,1,1,9),(5,1,7,10),(6,1,1,11),(7,1,4,12),(8,1,1,13),(9,1,7,14),(10,1,3,15);
INSERT INTO `TEACHER` (`id`,`isActive`,`rate`,`userId`) VALUES (11,1,8,16),(12,1,3,17),(13,1,1,18),(14,1,2,19),(15,1,3,20),(16,1,2,21),(17,1,6,22),(18,1,2,23),(19,1,8,24),(20,1,8,25);


INSERT INTO `GROUPS` (`id`,`additional`,`endDate`,`letter`,`number`,`startDate`,`teacherId`) VALUES (8,0,"2014-12-23 00:00:00","A",5,"2014-09-01 00:00:00",13),(9,0,"2014-12-23 00:00:00","A",6,"2014-09-01 00:00:00",14),(10,0,"2014-12-23 00:00:00","A",7,"2014-09-01 00:00:00",15),(11,0,"2014-12-23 00:00:00","A",8,"2014-09-01 00:00:00",16),(12,0,"2014-12-23 00:00:00","A",9,"2014-09-01 00:00:00",17),(13,0,"2014-12-23 00:00:00","A",10,"2014-09-01 00:00:00",18),(14,0,"2014-12-23 00:00:00","A",11,"2014-09-01 00:00:00",19);
INSERT INTO `GROUPS` (`id`,`additional`,`endDate`,`letter`,`number`,`startDate`,`teacherId`) VALUES (1,0,"2014-12-23 00:00:00","B",5,"2014-09-01 00:00:00",6),(2,0,"2014-12-23 00:00:00","B",6,"2014-09-01 00:00:00",7),(3,0,"2014-12-23 00:00:00","B",7,"2014-09-01 00:00:00",8),(4,0,"2014-12-23 00:00:00","B",8,"2014-09-01 00:00:00",9),(5,0,"2014-12-23 00:00:00","B",9,"2014-09-01 00:00:00",10),(6,0,"2014-12-23 00:00:00","B",10,"2014-09-01 00:00:00",11),(7,0,"2014-12-23 00:00:00","B",11,"2014-09-01 00:00:00",12);
INSERT INTO `GROUPS` (`id`,`additional`,`endDate`,`letter`,`number`,`startDate`,`teacherId`,`additionCourseId`) VALUES (15,1,"2014-12-23 00:00:00","Z",6,"2014-09-01 00:00:00",6,72),(16,1,"2014-12-23 00:00:00","Z",6,"2014-09-01 00:00:00",13,75);

INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (1,1,"1",101),(2,1,"1",102),(3,1,"1",103),(4,1,"1",104),(5,1,"1",105),(6,1,"1",106),(7,1,"1",107),(8,1,"1",108),(9,1,"1",109),(10,1,"1",110);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (11,1,"1",111),(12,1,"1",112),(13,1,"1",113),(14,1,"1",114),(15,1,"1",115),(16,1,"1",116),(17,1,"1",117),(18,1,"1",118),(19,1,"1",119),(20,1,"1",120);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (21,1,"1",121),(22,1,"1",122),(23,1,"2",123),(24,1,"2",124),(25,1,"2",125),(26,1,"2",126),(27,1,"2",127),(28,1,"2",128),(29,1,"2",129),(30,1,"2",130);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (31,1,"2",131),(32,1,"2",132),(33,1,"2",133),(34,1,"2",134),(35,1,"2",135),(36,1,"2",136),(37,1,"2",137),(38,1,"2",138),(39,1,"2",139),(40,1,"2",140);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (41,1,"2",141),(42,1,"2",142),(43,1,"2",143),(44,1,"2",144),(45,1,"3",145),(46,1,"3",146),(47,1,"3",147),(48,1,"3",148),(49,1,"3",149),(50,1,"3",150);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (51,1,"3",151),(52,1,"3",152),(53,1,"3",153),(54,1,"3",154),(55,1,"3",155),(56,1,"3",156),(57,1,"3",157),(58,1,"3",158),(59,1,"3",159),(60,1,"3",160);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (61,1,"3",161),(62,1,"3",162),(63,1,"3",163),(64,1,"3",164),(65,1,"3",165),(66,1,"3",166),(67,1,"4",167),(68,1,"4",168),(69,1,"4",169),(70,1,"4",170);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (71,1,"4",171),(72,1,"4",172),(73,1,"4",173),(74,1,"4",174),(75,1,"4",175),(76,1,"4",176),(77,1,"4",177),(78,1,"4",178),(79,1,"4",179),(80,1,"4",180);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (81,1,"4",181),(82,1,"4",182),(83,1,"4",183),(84,1,"4",184),(85,1,"4",185),(86,1,"4",186),(87,1,"4",187),(88,1,"4",188);

INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (89,1,"5",189),(90,1,"5",190),(91,1,"5",191),(92,1,"5",192),(93,1,"5",193),(94,1,"5",194),(95,1,"5",195),(96,1,"5",196),(97,1,"5",197),(98,1,"5",198);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (99,1,"5",199),(100,1,"5",200),(101,1,"5",201),(102,1,"5",202),(103,1,"5",203),(104,1,"5",204),(105,1,"5",205),(106,1,"5",206),(107,1,"5",207),(108,1,"5",208);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (109,1,"5",209),(110,1,"5",210),(111,1,"6",211),(112,1,"6",212),(113,1,"6",213),(114,1,"6",214),(115,1,"6",215),(116,1,"6",216),(117,1,"6",217),(118,1,"6",218);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (119,1,"6",219),(120,1,"6",220),(121,1,"6",221),(122,1,"6",222),(123,1,"6",223),(124,1,"6",224),(125,1,"6",225),(126,1,"6",226),(127,1,"6",227),(128,1,"6",228);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (129,1,"6",229),(130,1,"6",230),(131,1,"6",231),(132,1,"6",232),(133,1,"7",233),(134,1,"7",234),(135,1,"7",235),(136,1,"7",236),(137,1,"7",237),(138,1,"7",238);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (139,1,"7",239),(140,1,"7",240),(141,1,"7",241),(142,1,"7",242),(143,1,"7",243),(144,1,"7",244),(145,1,"7",245),(146,1,"7",246),(147,1,"7",247),(148,1,"7",248);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (149,1,"7",249),(150,1,"7",250),(151,1,"7",251),(152,1,"7",252),(153,1,"7",253),(154,1,"7",254),(155,1,"8",255),(156,1,"8",256),(157,1,"8",257),(158,1,"8",258);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (159,1,"8",259),(160,1,"8",260),(161,1,"8",261),(162,1,"8",262),(163,1,"8",263),(164,1,"8",264),(165,1,"8",265),(166,1,"8",266),(167,1,"8",267),(168,1,"8",268);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (169,1,"8",269),(170,1,"8",270),(171,1,"8",271),(172,1,"8",272),(173,1,"8",273),(174,1,"8",274),(175,1,"8",275),(176,1,"8",276);

INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (177,1,"9",277),(178,1,"9",278),(179,1,"9",279),(180,1,"9",280),(181,1,"9",281),(182,1,"9",282),(183,1,"9",283),(184,1,"9",284),(185,1,"9",285),(186,1,"9",286);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (187,1,"9",287),(188,1,"9",288),(189,1,"9",289),(190,1,"9",290),(191,1,"9",291),(192,1,"9",292),(193,1,"9",293),(194,1,"9",294),(195,1,"9",295),(196,1,"9",296);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (197,1,"9",297),(198,1,"9",298),(199,1,"10",299),(200,1,"10",300),(201,1,"10",301),(202,1,"10",302),(203,1,"10",303),(204,1,"10",304),(205,1,"10",305),(206,1,"10",306);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (207,1,"10",307),(208,1,"10",308),(209,1,"10",309),(210,1,"10",310),(211,1,"10",311),(212,1,"10",312),(213,1,"10",313),(214,1,"10",314),(215,1,"10",315),(216,1,"10",316);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (217,1,"10",317),(218,1,"10",318),(219,1,"10",319),(220,1,"10",320),(221,1,"11",321),(222,1,"11",322),(223,1,"11",323),(224,1,"11",324),(225,1,"11",325),(226,1,"11",326);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (227,1,"11",327),(228,1,"11",328),(229,1,"11",329),(230,1,"11",330),(231,1,"11",331),(232,1,"11",332),(233,1,"11",333),(234,1,"11",334),(235,1,"11",335),(236,1,"11",336);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (237,1,"11",337),(238,1,"11",338),(239,1,"11",339),(240,1,"11",340),(241,1,"11",341),(242,1,"11",342),(243,1,"12",343),(244,1,"12",344),(245,1,"12",345),(246,1,"12",346);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (247,1,"12",347),(248,1,"12",348),(249,1,"12",349),(250,1,"12",350),(251,1,"12",351),(252,1,"12",352),(253,1,"12",353),(254,1,"12",354),(255,1,"12",355),(256,1,"12",356);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (257,1,"12",357),(258,1,"12",358),(259,1,"12",359),(260,1,"12",360),(261,1,"12",361),(262,1,"12",362),(263,1,"12",363),(264,1,"12",364);

INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (265,1,"13",365),(266,1,"13",366),(267,1,"13",367),(268,1,"13",368),(269,1,"13",369),(270,1,"13",370),(271,1,"13",371),(272,1,"13",372),(273,1,"13",373),(274,1,"13",374);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (275,1,"13",375),(276,1,"13",376),(277,1,"13",377),(278,1,"13",378),(279,1,"13",379),(280,1,"13",380),(281,1,"13",381),(282,1,"13",382),(283,1,"13",383),(284,1,"13",384);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (285,1,"13",385),(286,1,"13",386),(287,1,"14",387),(288,1,"14",388),(289,1,"14",389),(290,1,"14",390),(291,1,"14",391),(292,1,"14",392),(293,1,"14",393),(294,1,"14",394);
INSERT INTO `STUDENT` (`id`,`isActive`,`groupId`,`userId`) VALUES (295,1,"14",395),(296,1,"14",396),(297,1,"14",397),(298,1,"14",398),(299,1,"14",399),(300,1,"14",400);

INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=40 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=41 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=42 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=43 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=44 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=45 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=46 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=47 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=48 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=49 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=50 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=51 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=52 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=53 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=54 and GROUPS.id=15;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=55 and GROUPS.id=15;

INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=80 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=81 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=82 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=83 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=84 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=85 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=86 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=87 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=88 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=89 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=90 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=91 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=92 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=93 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=94 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=95 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=96 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=97 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=98 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=99 and GROUPS.id=16;
INSERT INTO `STUDENT_ADDITION_GROUP_REF` (`studentId`,`groupId`) select STUDENT.id, GROUPS.id from STUDENT inner join GROUPS on STUDENT.id=100 and GROUPS.id=16;

INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Algebra' and TEACHER.id=1;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Math analys' and TEACHER.id=2;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Ukrainian' and TEACHER.id=3;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'English' and TEACHER.id=4;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Biology' and TEACHER.id=5;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Chemistry' and TEACHER.id=6;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Physics' and TEACHER.id=7;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'History' and TEACHER.id=8;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Ukrainian literature' and TEACHER.id=9;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Geography' and TEACHER.id=10;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Foreign literature' and TEACHER.id=11;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Quantum physics' and TEACHER.id=12;
INSERT INTO `COURSE_TEACHER_REF` (`courseId`,`teacherId`) select COURSE.id, TEACHER.id from COURSE inner join TEACHER on COURSE.courseName like 'Music lessons' and TEACHER.id=13;

INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (1,'2014-09-10',4931,98,1);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (2,'2014-09-10',4943,101,2);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (3,'2014-09-10',3388,67,3);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (4,'2014-09-10',3556,74,4);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (5,'2014-09-10',4780,89,5);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (6,'2014-09-10',3729,69,6);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (7,'2014-09-10',3457,64,7);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (8,'2014-09-10',3105,62,8);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (9,'2014-09-10',4212,85,9);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (10,'2014-09-10',4822,96,10);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (11,'2014-09-10',4338,88,11);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (12,'2014-09-10',3851,77,12);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (13,'2014-09-10',3526,71,13);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (14,'2014-09-10',3426,70,14);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (15,'2014-09-10',3266,66,15);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (16,'2014-09-10',3125,65,16);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (17,'2014-09-10',3432,69,17);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (18,'2014-09-10',3903,78,18);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (19,'2014-09-10',3340,65,19);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (20,'2014-09-10',3841,74,20);

INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (21,'2014-10-10',4680,98,1);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (22,'2014-10-10',4933,101,2);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (23,'2014-10-10',3402,68,3);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (24,'2014-10-10',3368,67,4);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (25,'2014-10-10',3700,74,5);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (26,'2014-10-10',3296,64,6);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (27,'2014-10-10',3469,68,7);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (28,'2014-10-10',4132,82,8);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (29,'2014-10-10',4400,88,9);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (30,'2014-10-10',4872,97,10);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (31,'2014-10-10',3834,87,11);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (32,'2014-10-10',3488,83,12);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (33,'2014-10-10',4393,91,13);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (34,'2014-10-10',4903,98,14);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (35,'2014-10-10',3040,61,15);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (36,'2014-10-10',3224,63,16);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (37,'2014-10-10',3844,67,17);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (38,'2014-10-10',3672,65,18);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (39,'2014-10-10',3475,64,19);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`hours`,`teacherId`) values (40,'2014-10-10',4611,92,20);

INSERT INTO `PARENT` (`id`,`userId`) values (1,26);
INSERT INTO `PARENT` (`id`,`userId`) values (2,27);
INSERT INTO `PARENT` (`id`,`userId`) values (3,28);
INSERT INTO `PARENT` (`id`,`userId`) values (4,29);
INSERT INTO `PARENT` (`id`,`userId`) values (5,30);
INSERT INTO `PARENT` (`id`,`userId`) values (6,31);
INSERT INTO `PARENT` (`id`,`userId`) values (7,32);
INSERT INTO `PARENT` (`id`,`userId`) values (8,33);
INSERT INTO `PARENT` (`id`,`userId`) values (9,34);
INSERT INTO `PARENT` (`id`,`userId`) values (10,35);
INSERT INTO `PARENT` (`id`,`userId`) values (11,36);
INSERT INTO `PARENT` (`id`,`userId`) values (12,37);
INSERT INTO `PARENT` (`id`,`userId`) values (13,38);
INSERT INTO `PARENT` (`id`,`userId`) values (14,39);
INSERT INTO `PARENT` (`id`,`userId`) values (15,40);
INSERT INTO `PARENT` (`id`,`userId`) values (16,41);
INSERT INTO `PARENT` (`id`,`userId`) values (17,42);
INSERT INTO `PARENT` (`id`,`userId`) values (18,43);
INSERT INTO `PARENT` (`id`,`userId`) values (19,44);
INSERT INTO `PARENT` (`id`,`userId`) values (20,45);
INSERT INTO `PARENT` (`id`,`userId`) values (21,46);
INSERT INTO `PARENT` (`id`,`userId`) values (22,47);
INSERT INTO `PARENT` (`id`,`userId`) values (23,48);
INSERT INTO `PARENT` (`id`,`userId`) values (24,49);
INSERT INTO `PARENT` (`id`,`userId`) values (25,50);
INSERT INTO `PARENT` (`id`,`userId`) values (26,51);
INSERT INTO `PARENT` (`id`,`userId`) values (27,52);
INSERT INTO `PARENT` (`id`,`userId`) values (28,53);
INSERT INTO `PARENT` (`id`,`userId`) values (29,54);
INSERT INTO `PARENT` (`id`,`userId`) values (30,55);
INSERT INTO `PARENT` (`id`,`userId`) values (31,56);
INSERT INTO `PARENT` (`id`,`userId`) values (32,57);
INSERT INTO `PARENT` (`id`,`userId`) values (33,58);
INSERT INTO `PARENT` (`id`,`userId`) values (34,59);
INSERT INTO `PARENT` (`id`,`userId`) values (35,60);
INSERT INTO `PARENT` (`id`,`userId`) values (36,61);
INSERT INTO `PARENT` (`id`,`userId`) values (37,62);
INSERT INTO `PARENT` (`id`,`userId`) values (38,63);
INSERT INTO `PARENT` (`id`,`userId`) values (39,64);
INSERT INTO `PARENT` (`id`,`userId`) values (40,65);
INSERT INTO `PARENT` (`id`,`userId`) values (41,66);
INSERT INTO `PARENT` (`id`,`userId`) values (42,67);
INSERT INTO `PARENT` (`id`,`userId`) values (43,68);
INSERT INTO `PARENT` (`id`,`userId`) values (44,69);
INSERT INTO `PARENT` (`id`,`userId`) values (45,70);
INSERT INTO `PARENT` (`id`,`userId`) values (46,71);
INSERT INTO `PARENT` (`id`,`userId`) values (47,72);
INSERT INTO `PARENT` (`id`,`userId`) values (48,73);
INSERT INTO `PARENT` (`id`,`userId`) values (49,74);
INSERT INTO `PARENT` (`id`,`userId`) values (50,75);
INSERT INTO `PARENT` (`id`,`userId`) values (51,76);
INSERT INTO `PARENT` (`id`,`userId`) values (52,77);
INSERT INTO `PARENT` (`id`,`userId`) values (53,78);
INSERT INTO `PARENT` (`id`,`userId`) values (54,79);
INSERT INTO `PARENT` (`id`,`userId`) values (55,80);
INSERT INTO `PARENT` (`id`,`userId`) values (56,81);
INSERT INTO `PARENT` (`id`,`userId`) values (57,82);
INSERT INTO `PARENT` (`id`,`userId`) values (58,83);
INSERT INTO `PARENT` (`id`,`userId`) values (59,84);
INSERT INTO `PARENT` (`id`,`userId`) values (60,85);
INSERT INTO `PARENT` (`id`,`userId`) values (61,86);
INSERT INTO `PARENT` (`id`,`userId`) values (62,87);
INSERT INTO `PARENT` (`id`,`userId`) values (63,88);
INSERT INTO `PARENT` (`id`,`userId`) values (64,89);
INSERT INTO `PARENT` (`id`,`userId`) values (65,90);
INSERT INTO `PARENT` (`id`,`userId`) values (66,91);
INSERT INTO `PARENT` (`id`,`userId`) values (67,92);
INSERT INTO `PARENT` (`id`,`userId`) values (68,93);
INSERT INTO `PARENT` (`id`,`userId`) values (69,94);
INSERT INTO `PARENT` (`id`,`userId`) values (70,95);
INSERT INTO `PARENT` (`id`,`userId`) values (71,96);
INSERT INTO `PARENT` (`id`,`userId`) values (72,97);
INSERT INTO `PARENT` (`id`,`userId`) values (73,98);
INSERT INTO `PARENT` (`id`,`userId`) values (74,99);
INSERT INTO `PARENT` (`id`,`userId`) values (75,100);

INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 151 and PARENT.id=1;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 152 and PARENT.id=2;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 153 and PARENT.id=3;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 154 and PARENT.id=4;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 155 and PARENT.id=5;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 156 and PARENT.id=6;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 157 and PARENT.id=7;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 158 and PARENT.id=8;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 159 and PARENT.id=9;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 160 and PARENT.id=10;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 161 and PARENT.id=11;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 162 and PARENT.id=12;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 163 and PARENT.id=13;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 164 and PARENT.id=14;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 165 and PARENT.id=15;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 166 and PARENT.id=16;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 167 and PARENT.id=17;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 168 and PARENT.id=18;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 169 and PARENT.id=19;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 170 and PARENT.id=20;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 171 and PARENT.id=21;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 172 and PARENT.id=22;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 173 and PARENT.id=23;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 174 and PARENT.id=24;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 175 and PARENT.id=25;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 176 and PARENT.id=26;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 177 and PARENT.id=27;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 178 and PARENT.id=28;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 179 and PARENT.id=29;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 180 and PARENT.id=30;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 181 and PARENT.id=31;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 182 and PARENT.id=32;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 183 and PARENT.id=33;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 184 and PARENT.id=34;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 185 and PARENT.id=35;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 186 and PARENT.id=36;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 187 and PARENT.id=37;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 188 and PARENT.id=38;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 189 and PARENT.id=39;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 190 and PARENT.id=40;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 191 and PARENT.id=41;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 192 and PARENT.id=42;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 193 and PARENT.id=43;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 194 and PARENT.id=44;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 195 and PARENT.id=45;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 196 and PARENT.id=46;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 197 and PARENT.id=47;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 198 and PARENT.id=48;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 199 and PARENT.id=49;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 200 and PARENT.id=50;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 201 and PARENT.id=51;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 202 and PARENT.id=52;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 203 and PARENT.id=53;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 204 and PARENT.id=54;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 205 and PARENT.id=55;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 206 and PARENT.id=56;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 207 and PARENT.id=57;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 208 and PARENT.id=58;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 209 and PARENT.id=59;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 210 and PARENT.id=60;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 211 and PARENT.id=61;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 212 and PARENT.id=62;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 213 and PARENT.id=63;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 214 and PARENT.id=64;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 215 and PARENT.id=65;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 216 and PARENT.id=66;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 217 and PARENT.id=67;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 218 and PARENT.id=68;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 219 and PARENT.id=69;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 220 and PARENT.id=70;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 221 and PARENT.id=71;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 222 and PARENT.id=72;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 223 and PARENT.id=73;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 224 and PARENT.id=74;
INSERT INTO `STUDENT_PARENT_REF` (`studentId`,`parentId`) select STUDENT.id, PARENT.id from STUDENT inner join PARENT on STUDENT.id = 225 and PARENT.id=75;

INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(1,'2014-09-28',1,72,1);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(2,'2014-09-28',1,72,2);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(3,'2014-09-28',1,72,3);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(4,'2014-09-28',1,72,4);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(5,'2014-09-28',1,72,5);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(6,'2014-09-28',1,72,6);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(7,'2014-09-28',1,72,7);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(8,'2014-09-28',1,72,8);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(9,'2014-09-28',1,72,9);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(10,'2014-09-28',1,72,10);

INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(11,'2014-09-28',1,73,11);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(12,'2014-09-28',1,73,12);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(13,'2014-09-28',1,73,13);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(14,'2014-09-28',1,73,14);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(15,'2014-09-28',1,73,15);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(16,'2014-09-28',1,73,16);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(17,'2014-09-28',1,73,17);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(18,'2014-09-28',1,73,18);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(19,'2014-09-28',1,73,19);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(20,'2014-09-28',1,73,20);

INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(21,'2014-10-28',1,74,21);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(22,'2014-10-28',1,74,22);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(23,'2014-10-28',1,74,23);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(24,'2014-10-28',1,74,24);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(25,'2014-10-28',1,74,25);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(26,'2014-10-28',1,74,26);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(27,'2014-10-28',1,74,27);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(28,'2014-10-28',1,74,28);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(29,'2014-10-28',1,74,29);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(30,'2014-10-28',1,74,30);


INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(31,'2014-10-28',1,75,31);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(32,'2014-10-28',1,75,32);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(33,'2014-10-28',1,75,33);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(34,'2014-10-28',1,75,34);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(35,'2014-10-28',1,75,35);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(36,'2014-10-28',1,75,36);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(37,'2014-10-28',1,75,37);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(38,'2014-10-28',1,75,38);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(39,'2014-10-28',1,75,39);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(40,'2014-10-28',1,75,40);

INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(41,'2014-10-28',1,76,41);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(42,'2014-10-28',1,76,42);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(43,'2014-10-28',1,76,43);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(44,'2014-10-28',1,76,44);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(45,'2014-10-28',1,76,45);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(46,'2014-10-28',1,76,46);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(47,'2014-10-28',1,76,47);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(48,'2014-10-28',1,76,48);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(49,'2014-10-28',1,76,49);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(50,'2014-10-28',1,76,50);

INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(51,'2014-10-28',1,77,51);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(52,'2014-10-28',1,77,52);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(53,'2014-10-28',1,77,53);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(54,'2014-10-28',1,77,54);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(55,'2014-10-28',1,77,55);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(56,'2014-10-28',1,77,56);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(57,'2014-10-28',1,77,57);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(58,'2014-10-28',1,77,58);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(59,'2014-10-28',1,77,59);
INSERT INTO `COURSE_REQUEST` (`id`,`date`,`isActive`,`courseId`,`studentId`) values(60,'2014-10-28',1,77,60);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1,'2014-09-01',1,8,1,5,1), (2,'2014-09-01',9,8,2,13,3), (3,'2014-09-01',16,8,3,11,4), (4,'2014-09-01',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (5,'2014-09-02',44,8,1,19,8), (6,'2014-09-02',51,8,2,32,9), (7,'2014-09-02',37,8,3,4,7), (8,'2014-09-02',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (9,'2014-09-03',58,8,1,12,11), (10,'2014-09-03',1,8,2,5,1), (11,'2014-09-03',16,8,3,11,4), (12,'2014-09-03',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (13,'2014-09-04',23,8,1,40,5), (14,'2014-09-04',9,8,2,13,3), (15,'2014-09-04',16,8,3,11,4), (16,'2014-09-04',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (17,'2014-09-05',51,8,1,32,9), (18,'2014-09-05',1,8,2,5,1), (19,'2014-09-05',9,8,3,13,3), (20,'2014-09-05',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (21,'2014-09-01',44,1,1,19,8), (22,'2014-09-01',51,1,2,32,9), (23,'2014-09-01',65,1,3,2,10), (24,'2014-09-01',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (25,'2014-09-02',1,1,1,5,1), (26,'2014-09-02',16,1,2,11,4), (27,'2014-09-02',58,1,3,12,11), (28,'2014-09-02',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (29,'2014-09-03',16,1,1,11,4), (30,'2014-09-03',23,1,2,40,5), (31,'2014-09-03',9,1,3,13,3), (32,'2014-09-03',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (33,'2014-09-04',51,1,1,32,9), (34,'2014-09-04',16,1,2,11,4), (35,'2014-09-04',1,1,3,5,1), (36,'2014-09-04',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (37,'2014-09-05',23,1,1,40,5), (38,'2014-09-05',9,1,2,13,3), (39,'2014-09-05',16,1,3,11,4), (40,'2014-09-05',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (41,'2014-09-01',10,9,1,13,3), (42,'2014-09-01',2,9,2,5,1),   (43,'2014-09-01',38,9,3,4,7),  (44,'2014-09-01',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (45,'2014-09-02',17,9,1,11,4),  (46,'2014-09-02',2,9,2,5,1),   (47,'2014-09-02',31,9,3,34,6), (48,'2014-09-02',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (49,'2014-09-03',45,9,1,19,8),  (50,'2014-09-03',59,9,2,12,11),(51,'2014-09-03',2,9,3,5,1),   (52,'2014-09-03',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (53,'2014-09-04',17,9,1,11,4),  (54,'2014-09-04',59,9,2,12,11),(55,'2014-09-04',24,9,3,40,5), (56,'2014-09-04',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (57,'2014-09-05',2,9,1,5,1),    (58,'2014-09-05',17,9,2,11,4), (59,'2014-09-05',45,9,3,19,8), (60,'2014-09-05',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (61,'2014-09-01',59,2,1,12,11), (62,'2014-09-01',17,2,2,11,4), (63,'2014-09-01',2,2,3,5,1), (64,'2014-09-01',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (65,'2014-09-02',31,2,1,34,6), (66,'2014-09-02',10,2,2,13,3), (67,'2014-09-02',17,2,3,11,4), (68,'2014-09-02',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (69,'2014-09-03',10,2,1,13,3), (70,'2014-09-03',38,2,2,4,7), (71,'2014-09-03',24,2,3,40,5), (72,'2014-09-03',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (73,'2014-09-04',2,2,1,5,1), (74,'2014-09-04',66,2,2,2,10), (75,'2014-09-04',52,2,3,32,9), (76,'2014-09-04',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (77,'2014-09-05',17,2,1,11,4), (78,'2014-09-05',52,2,2,32,9), (79,'2014-09-05',2,2,3,5,1), (80,'2014-09-05',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (81,'2014-09-01',18,10,1,11,4), (82,'2014-09-01',60,10,2,12,11), (83,'2014-09-01',32,10,3,34,6), (84,'2014-09-01',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (85,'2014-09-02',11,10,1,13,3), (86,'2014-09-02',46,10,2,19,8), (87,'2014-09-02',3,10,3,5,1), (88,'2014-09-02',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (89,'2014-09-03',3,10,1,5,1), (90,'2014-09-03',67,10,2,2,10), (91,'2014-09-03',60,10,3,12,11), (92,'2014-09-03',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (93,'2014-09-04',11,10,1,13,3), (94,'2014-09-04',3,10,2,5,1), (95,'2014-09-04',46,10,3,19,8), (96,'2014-09-04',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (97,'2014-09-05',11,10,1,13,3), (98,'2014-09-05',25,10,2,40,5), (99,'2014-09-05',53,10,3,32,9), (100,'2014-09-05',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (101,'2014-09-08',1,8,1,5,1), (102,'2014-09-08',9,8,2,13,3), (103,'2014-09-08',16,8,3,11,4), (104,'2014-09-08',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (105,'2014-09-09',44,8,1,19,8), (106,'2014-09-09',51,8,2,32,9), (107,'2014-09-09',37,8,3,4,7), (108,'2014-09-09',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (109,'2014-09-10',58,8,1,12,11), (110,'2014-09-10',1,8,2,5,1), (111,'2014-09-10',16,8,3,11,4), (112,'2014-09-10',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (113,'2014-09-11',23,8,1,40,5), (114,'2014-09-11',9,8,2,13,3), (115,'2014-09-11',16,8,3,11,4), (116,'2014-09-11',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (117,'2014-09-12',51,8,1,32,9), (118,'2014-09-12',1,8,2,5,1), (119,'2014-09-12',9,8,3,13,3), (120,'2014-09-12',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (121,'2014-09-08',44,1,1,19,8), (122,'2014-09-08',51,1,2,32,9), (123,'2014-09-08',65,1,3,2,10), (124,'2014-09-08',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (125,'2014-09-09',1,1,1,5,1), (126,'2014-09-09',16,1,2,11,4), (127,'2014-09-09',58,1,3,12,11), (128,'2014-09-09',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (129,'2014-09-10',16,1,1,11,4), (130,'2014-09-10',23,1,2,40,5), (131,'2014-09-10',9,1,3,13,3), (132,'2014-09-10',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (133,'2014-09-11',51,1,1,32,9), (134,'2014-09-11',16,1,2,11,4), (135,'2014-09-11',1,1,3,5,1), (136,'2014-09-11',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (137,'2014-09-12',23,1,1,40,5), (138,'2014-09-12',9,1,2,13,3), (139,'2014-09-12',16,1,3,11,4), (140,'2014-09-12',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (141,'2014-09-08',10,9,1,13,3), (142,'2014-09-08',2,9,2,5,1), (143,'2014-09-08',38,9,3,4,7), (144,'2014-09-08',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (145,'2014-09-09',17,9,1,11,4), (146,'2014-09-09',2,9,2,5,1), (147,'2014-09-09',31,9,3,34,6), (148,'2014-09-09',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (149,'2014-09-10',45,9,1,19,8), (150,'2014-09-10',59,9,2,12,11), (151,'2014-09-10',2,9,3,5,1), (152,'2014-09-10',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (153,'2014-09-11',17,9,1,11,4), (154,'2014-09-11',59,9,2,12,11), (155,'2014-09-11',24,9,3,40,5), (156,'2014-09-11',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (157,'2014-09-12',2,9,1,5,1), (158,'2014-09-12',17,9,2,11,4), (159,'2014-09-12',45,9,3,19,8), (160,'2014-09-12',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (161,'2014-09-01',59,2,1,12,11), (162,'2014-09-08',17,2,2,11,4), (163,'2014-09-08',2,2,3,5,1), (164,'2014-09-08',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (165,'2014-09-02',31,2,1,34,6), (166,'2014-09-09',10,2,2,13,3), (167,'2014-09-09',17,2,3,11,4), (168,'2014-09-09',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (169,'2014-09-03',10,2,1,13,3), (170,'2014-09-10',38,2,2,4,7), (171,'2014-09-10',24,2,3,40,5), (172,'2014-09-10',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (173,'2014-09-04',2,2,1,5,1), (174,'2014-09-11',66,2,2,2,10), (175,'2014-09-11',52,2,3,32,9), (176,'2014-09-11',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (177,'2014-09-05',17,2,1,11,4), (178,'2014-09-12',52,2,2,32,9), (179,'2014-09-12',2,2,3,5,1), (180,'2014-09-12',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (181,'2014-09-08',18,10,1,11,4), (182,'2014-09-08',60,10,2,12,11), (183,'2014-09-08',32,10,3,34,6), (184,'2014-09-08',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (185,'2014-09-09',11,10,1,13,3), (186,'2014-09-09',46,10,2,19,8), (187,'2014-09-09',3,10,3,5,1), (188,'2014-09-09',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (189,'2014-09-10',3,10,1,5,1), (190,'2014-09-10',67,10,2,2,10), (191,'2014-09-10',60,10,3,12,11), (192,'2014-09-10',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (193,'2014-09-11',11,10,1,13,3), (194,'2014-09-11',3,10,2,5,1), (195,'2014-09-11',46,10,3,19,8), (196,'2014-09-11',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (197,'2014-09-12',11,10,1,13,3), (198,'2014-09-12',25,10,2,40,5), (199,'2014-09-12',53,10,3,32,9), (200,'2014-09-12',3,10,4,5,1);





INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (201,'2014-09-15',1,8,1,5,1), (202,'2014-09-15',9,8,2,13,3), (203,'2014-09-15',16,8,3,11,4), (204,'2014-09-15',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (205,'2014-09-16',44,8,1,19,8), (206,'2014-09-16',51,8,2,32,9), (207,'2014-09-16',37,8,3,4,7), (208,'2014-09-16',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (209,'2014-09-17',58,8,1,12,11), (210,'2014-09-17',1,8,2,5,1), (211,'2014-09-17',16,8,3,11,4), (212,'2014-09-17',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (213,'2014-09-18',23,8,1,40,5), (214,'2014-09-18',9,8,2,13,3), (215,'2014-09-18',16,8,3,11,4), (216,'2014-09-18',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (217,'2014-09-19',51,8,1,32,9), (218,'2014-09-19',1,8,2,5,1), (219,'2014-09-19',9,8,3,13,3), (220,'2014-09-19',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (221,'2014-09-15',44,1,1,19,8), (222,'2014-09-15',51,1,2,32,9), (223,'2014-09-15',65,1,3,2,10), (224,'2014-09-15',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (225,'2014-09-16',1,1,1,5,1), (226,'2014-09-16',16,1,2,11,4), (227,'2014-09-16',58,1,3,12,11), (228,'2014-09-16',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (229,'2014-09-17',16,1,1,11,4), (230,'2014-09-17',23,1,2,40,5), (231,'2014-09-17',9,1,3,13,3), (232,'2014-09-17',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (233,'2014-09-18',51,1,1,32,9), (234,'2014-09-18',16,1,2,11,4), (235,'2014-09-18',1,1,3,5,1), (236,'2014-09-18',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (237,'2014-09-19',23,1,1,40,5), (238,'2014-09-19',9,1,2,13,3), (239,'2014-09-19',16,1,3,11,4), (240,'2014-09-19',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (241,'2014-09-15',10,9,1,13,3),(242,'2014-09-15',2,9,2,5,1),   (243,'2014-09-15',38,9,3,4,7),  (244,'2014-09-15',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (245,'2014-09-16',17,9,1,11,4), (246,'2014-09-16',2,9,2,5,1),   (247,'2014-09-16',31,9,3,34,6), (248,'2014-09-16',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (249,'2014-09-17',45,9,1,19,8), (250,'2014-09-17',59,9,2,12,11),(251,'2014-09-17',2,9,3,5,1),   (252,'2014-09-17',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (253,'2014-09-18',17,9,1,11,4), (254,'2014-09-18',59,9,2,12,11),(255,'2014-09-18',24,9,3,40,5), (256,'2014-09-18',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (257,'2014-09-19',2,9,1,5,1),   (258,'2014-09-19',17,9,2,11,4), (259,'2014-09-19',45,9,3,19,8), (260,'2014-09-19',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (261,'2014-09-15',59,2,1,12,11),(262,'2014-09-15',17,2,2,11,4), (263,'2014-09-15',2,2,3,5,1),   (264,'2014-09-15',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (265,'2014-09-16',31,2,1,34,6), (266,'2014-09-16',10,2,2,13,3), (267,'2014-09-16',17,2,3,11,4), (268,'2014-09-16',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (269,'2014-09-17',10,2,1,13,3), (270,'2014-09-17',38,2,2,4,7),  (271,'2014-09-17',24,2,3,40,5), (272,'2014-09-17',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (273,'2014-09-18',2,2,1,5,1),   (274,'2014-09-18',66,2,2,2,10), (275,'2014-09-18',52,2,3,32,9), (276,'2014-09-18',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (277,'2014-09-19',17,2,1,11,4), (278,'2014-09-19',52,2,2,32,9), (279,'2014-09-19',2,2,3,5,1),   (280,'2014-09-19',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (281,'2014-09-15',18,10,1,11,4), (282,'2014-09-15',60,10,2,12,11), (283,'2014-09-15',32,10,3,34,6), (284,'2014-09-15',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (285,'2014-09-16',11,10,1,13,3), (286,'2014-09-16',46,10,2,19,8),  (287,'2014-09-16',3,10,3,5,1),   (288,'2014-09-16',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (289,'2014-09-17',3,10,1,5,1),   (290,'2014-09-17',67,10,2,2,10),  (291,'2014-09-17',60,10,3,12,11),(292,'2014-09-17',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (293,'2014-09-18',11,10,1,13,3), (294,'2014-09-18',3,10,2,5,1),    (295,'2014-09-18',46,10,3,19,8), (296,'2014-09-18',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (297,'2014-09-19',11,10,1,13,3), (298,'2014-09-19',25,10,2,40,5),  (299,'2014-09-19',53,10,3,32,9), (300,'2014-09-19',3,10,4,5,1);




INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (301,'2014-09-22',1,8,1,5,1),   (302,'2014-09-22',9,8,2,13,3),  (303,'2014-09-22',16,8,3,11,4), (304,'2014-09-22',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (305,'2014-09-23',44,8,1,19,8), (306,'2014-09-23',51,8,2,32,9), (307,'2014-09-23',37,8,3,4,7),  (308,'2014-09-23',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (309,'2014-09-24',58,8,1,12,11),(310,'2014-09-24',1,8,2,5,1),   (311,'2014-09-24',16,8,3,11,4), (312,'2014-09-24',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (313,'2014-09-25',23,8,1,40,5), (314,'2014-09-25',9,8,2,13,3),  (315,'2014-09-25',16,8,3,11,4), (316,'2014-09-25',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (317,'2014-09-26',51,8,1,32,9), (318,'2014-09-26',1,8,2,5,1),   (319,'2014-09-26',9,8,3,13,3),  (320,'2014-09-26',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (321,'2014-09-22',44,1,1,19,8), (322,'2014-09-22',51,1,2,32,9), (323,'2014-09-22',65,1,3,2,10),  (324,'2014-09-22',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (325,'2014-09-23',1,1,1,5,1),   (326,'2014-09-23',16,1,2,11,4), (327,'2014-09-23',58,1,3,12,11), (328,'2014-09-23',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (329,'2014-09-24',16,1,1,11,4), (330,'2014-09-24',23,1,2,40,5), (331,'2014-09-24',9,1,3,13,3),   (332,'2014-09-24',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (333,'2014-09-25',51,1,1,32,9), (334,'2014-09-25',16,1,2,11,4), (335,'2014-09-25',1,1,3,5,1),    (336,'2014-09-25',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (337,'2014-09-26',23,1,1,40,5), (338,'2014-09-26',9,1,2,13,3),  (339,'2014-09-26',16,1,3,11,4),  (340,'2014-09-26',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (341,'2014-09-22',10,9,1,13,3),(342,'2014-09-22',2,9,2,5,1),   (343,'2014-09-22',38,9,3,4,7),  (344,'2014-09-22',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (345,'2014-09-23',17,9,1,11,4), (346,'2014-09-23',2,9,2,5,1),   (347,'2014-09-23',31,9,3,34,6), (348,'2014-09-23',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (349,'2014-09-24',45,9,1,19,8), (350,'2014-09-24',59,9,2,12,11),(351,'2014-09-24',2,9,3,5,1),   (352,'2014-09-24',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (353,'2014-09-25',17,9,1,11,4), (354,'2014-09-25',59,9,2,12,11),(355,'2014-09-25',24,9,3,40,5), (356,'2014-09-25',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (357,'2014-09-26',2,9,1,5,1),   (358,'2014-09-26',17,9,2,11,4), (359,'2014-09-26',45,9,3,19,8), (360,'2014-09-26',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (361,'2014-09-22',59,2,1,12,11),(362,'2014-09-22',17,2,2,11,4), (363,'2014-09-22',2,2,3,5,1),   (364,'2014-09-22',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (365,'2014-09-23',31,2,1,34,6), (366,'2014-09-23',10,2,2,13,3), (367,'2014-09-23',17,2,3,11,4), (368,'2014-09-23',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (369,'2014-09-24',10,2,1,13,3), (370,'2014-09-24',38,2,2,4,7),  (371,'2014-09-24',24,2,3,40,5), (372,'2014-09-24',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (373,'2014-09-25',2,2,1,5,1),   (374,'2014-09-25',66,2,2,2,10), (375,'2014-09-25',52,2,3,32,9), (376,'2014-09-25',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (377,'2014-09-26',17,2,1,11,4), (378,'2014-09-26',52,2,2,32,9), (379,'2014-09-26',2,2,3,5,1),   (380,'2014-09-26',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (381,'2014-09-22',18,10,1,11,4), (382,'2014-09-22',60,10,2,12,11), (383,'2014-09-22',32,10,3,34,6), (384,'2014-09-22',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (385,'2014-09-23',11,10,1,13,3), (386,'2014-09-23',46,10,2,19,8),  (387,'2014-09-23',3,10,3,5,1),   (388,'2014-09-23',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (389,'2014-09-24',3,10,1,5,1),   (390,'2014-09-24',67,10,2,2,10),  (391,'2014-09-24',60,10,3,12,11),(392,'2014-09-24',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (393,'2014-09-25',11,10,1,13,3), (394,'2014-09-25',3,10,2,5,1),    (395,'2014-09-25',46,10,3,19,8), (396,'2014-09-25',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (397,'2014-09-26',11,10,1,13,3), (398,'2014-09-26',25,10,2,40,5),  (399,'2014-09-26',53,10,3,32,9), (400,'2014-09-26',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (401,'2014-09-29',1,8,1,5,1),   (402,'2014-09-29',9,8,2,13,3),  (403,'2014-09-29',16,8,3,11,4), (404,'2014-09-29',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (405,'2014-09-30',44,8,1,19,8), (406,'2014-09-30',51,8,2,32,9), (407,'2014-09-30',37,8,3,4,7),  (408,'2014-09-30',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (409,'2014-10-01',58,8,1,12,11),(410,'2014-10-01',1,8,2,5,1),   (411,'2014-10-01',16,8,3,11,4), (412,'2014-10-01',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (413,'2014-10-02',23,8,1,40,5), (414,'2014-10-02',9,8,2,13,3),  (415,'2014-10-02',16,8,3,11,4), (416,'2014-10-02',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (417,'2014-10-03',51,8,1,32,9), (418,'2014-10-03',1,8,2,5,1),   (419,'2014-10-03',9,8,3,13,3),  (420,'2014-10-03',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (421,'2014-09-29',44,1,1,19,8), (422,'2014-09-29',51,1,2,32,9), (423,'2014-09-29',65,1,3,2,10),  (424,'2014-09-29',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (425,'2014-09-30',1,1,1,5,1),   (426,'2014-09-30',16,1,2,11,4), (427,'2014-09-30',58,1,3,12,11), (428,'2014-09-30',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (429,'2014-10-01',16,1,1,11,4), (430,'2014-10-01',23,1,2,40,5), (431,'2014-10-01',9,1,3,13,3),   (432,'2014-10-01',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (433,'2014-10-02',51,1,1,32,9), (434,'2014-10-02',16,1,2,11,4), (435,'2014-10-02',1,1,3,5,1),    (436,'2014-10-02',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (437,'2014-10-03',23,1,1,40,5), (438,'2014-10-03',9,1,2,13,3),  (439,'2014-10-03',16,1,3,11,4),  (440,'2014-10-03',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (441,'2014-09-29',10,9,1,13,3),(442,'2014-09-29',2,9,2,5,1),   (443,'2014-09-29',38,9,3,4,7),  (444,'2014-09-29',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (445,'2014-09-30',17,9,1,11,4), (446,'2014-09-30',2,9,2,5,1),   (447,'2014-09-30',31,9,3,34,6), (448,'2014-09-30',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (449,'2014-10-01',45,9,1,19,8), (450,'2014-10-01',59,9,2,12,11),(451,'2014-10-01',2,9,3,5,1),   (452,'2014-10-01',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (453,'2014-10-02',17,9,1,11,4), (454,'2014-10-02',59,9,2,12,11),(455,'2014-10-02',24,9,3,40,5), (456,'2014-10-02',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (457,'2014-10-03',2,9,1,5,1),   (458,'2014-10-03',17,9,2,11,4), (459,'2014-10-03',45,9,3,19,8), (460,'2014-10-03',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (461,'2014-09-29',59,2,1,12,11),(462,'2014-09-29',17,2,2,11,4), (463,'2014-09-29',2,2,3,5,1),   (464,'2014-09-29',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (465,'2014-09-30',31,2,1,34,6), (466,'2014-09-30',10,2,2,13,3), (467,'2014-09-30',17,2,3,11,4), (468,'2014-09-30',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (469,'2014-10-01',10,2,1,13,3), (470,'2014-10-01',38,2,2,4,7),  (471,'2014-10-01',24,2,3,40,5), (472,'2014-10-01',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (473,'2014-10-02',2,2,1,5,1),   (474,'2014-10-02',66,2,2,2,10), (475,'2014-10-02',52,2,3,32,9), (476,'2014-10-02',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (477,'2014-10-03',17,2,1,11,4), (478,'2014-10-03',52,2,2,32,9), (479,'2014-10-03',2,2,3,5,1),   (480,'2014-10-03',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (481,'2014-09-29',18,10,1,11,4), (482,'2014-09-29',60,10,2,12,11), (483,'2014-09-29',32,10,3,34,6), (484,'2014-09-29',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (485,'2014-09-30',11,10,1,13,3), (486,'2014-09-30',46,10,2,19,8),  (487,'2014-09-30',3,10,3,5,1),   (488,'2014-09-30',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (489,'2014-10-01',3,10,1,5,1),   (490,'2014-10-01',67,10,2,2,10),  (491,'2014-10-01',60,10,3,12,11),(492,'2014-10-01',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (493,'2014-10-02',11,10,1,13,3), (494,'2014-10-02',3,10,2,5,1),    (495,'2014-10-02',46,10,3,19,8), (496,'2014-10-02',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (497,'2014-10-03',11,10,1,13,3), (498,'2014-10-03',25,10,2,40,5),  (499,'2014-10-03',53,10,3,32,9), (500,'2014-10-03',3,10,4,5,1);


INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (501,'2014-10-06',1,8,1,5,1),   (502,'2014-10-06',9,8,2,13,3),  (503,'2014-10-06',16,8,3,11,4), (504,'2014-10-06',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (505,'2014-10-07',44,8,1,19,8), (506,'2014-10-07',51,8,2,32,9), (507,'2014-10-07',37,8,3,4,7),  (508,'2014-10-07',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (509,'2014-10-08',58,8,1,12,11),(510,'2014-10-08',1,8,2,5,1),   (511,'2014-10-08',16,8,3,11,4), (512,'2014-10-08',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (513,'2014-10-09',23,8,1,40,5), (514,'2014-10-09',9,8,2,13,3),  (515,'2014-10-09',16,8,3,11,4), (516,'2014-10-09',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (517,'2014-10-10',51,8,1,32,9), (518,'2014-10-10',1,8,2,5,1),   (519,'2014-10-10',9,8,3,13,3),  (520,'2014-10-10',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (521,'2014-10-06',44,1,1,19,8), (522,'2014-10-06',51,1,2,32,9), (523,'2014-10-06',65,1,3,2,10),  (524,'2014-10-06',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (525,'2014-10-07',1,1,1,5,1),   (526,'2014-10-07',16,1,2,11,4), (527,'2014-10-07',58,1,3,12,11), (528,'2014-10-07',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (529,'2014-10-08',16,1,1,11,4), (530,'2014-10-08',23,1,2,40,5), (531,'2014-10-08',9,1,3,13,3),   (532,'2014-10-08',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (533,'2014-10-09',51,1,1,32,9), (534,'2014-10-09',16,1,2,11,4), (535,'2014-10-09',1,1,3,5,1),    (536,'2014-10-09',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (537,'2014-10-10',23,1,1,40,5), (538,'2014-10-10',9,1,2,13,3),  (539,'2014-10-10',16,1,3,11,4),  (540,'2014-10-10',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (541,'2014-10-06',10,9,1,13,3),(542,'2014-10-06',2,9,2,5,1),   (543,'2014-10-06',38,9,3,4,7),  (544,'2014-10-06',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (545,'2014-10-07',17,9,1,11,4), (546,'2014-10-07',2,9,2,5,1),   (547,'2014-10-07',31,9,3,34,6), (548,'2014-10-07',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (549,'2014-10-08',45,9,1,19,8), (550,'2014-10-08',59,9,2,12,11),(551,'2014-10-08',2,9,3,5,1),   (552,'2014-10-08',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (553,'2014-10-09',17,9,1,11,4), (554,'2014-10-09',59,9,2,12,11),(555,'2014-10-09',24,9,3,40,5), (556,'2014-10-09',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (557,'2014-10-10',2,9,1,5,1),   (558,'2014-10-10',17,9,2,11,4), (559,'2014-10-10',45,9,3,19,8), (560,'2014-10-10',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (561,'2014-10-06',59,2,1,12,11),(562,'2014-10-06',17,2,2,11,4), (563,'2014-10-06',2,2,3,5,1),   (564,'2014-10-06',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (565,'2014-10-07',31,2,1,34,6), (566,'2014-10-07',10,2,2,13,3), (567,'2014-10-07',17,2,3,11,4), (568,'2014-10-07',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (569,'2014-10-08',10,2,1,13,3), (570,'2014-10-08',38,2,2,4,7),  (571,'2014-10-08',24,2,3,40,5), (572,'2014-10-08',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (573,'2014-10-09',2,2,1,5,1),   (574,'2014-10-09',66,2,2,2,10), (575,'2014-10-09',52,2,3,32,9), (576,'2014-10-09',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (577,'2014-10-10',17,2,1,11,4), (578,'2014-10-10',52,2,2,32,9), (579,'2014-10-10',2,2,3,5,1),   (580,'2014-10-10',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (581,'2014-10-06',18,10,1,11,4), (582,'2014-10-06',60,10,2,12,11), (583,'2014-10-06',32,10,3,34,6), (584,'2014-10-06',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (585,'2014-10-07',11,10,1,13,3), (586,'2014-10-07',46,10,2,19,8),  (587,'2014-10-07',3,10,3,5,1),   (588,'2014-10-07',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (589,'2014-10-08',3,10,1,5,1),   (590,'2014-10-08',67,10,2,2,10),  (591,'2014-10-08',60,10,3,12,11),(592,'2014-10-08',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (593,'2014-10-09',11,10,1,13,3), (594,'2014-10-09',3,10,2,5,1),    (595,'2014-10-09',46,10,3,19,8), (596,'2014-10-09',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (597,'2014-10-10',11,10,1,13,3), (598,'2014-10-10',25,10,2,40,5),  (599,'2014-10-10',53,10,3,32,9), (600,'2014-10-10',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (601,'2014-10-13',1,8,1,5,1),   (602,'2014-10-13',9,8,2,13,3),  (603,'2014-10-13',16,8,3,11,4), (604,'2014-10-13',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (605,'2014-10-14',44,8,1,19,8), (606,'2014-10-14',51,8,2,32,9), (607,'2014-10-14',37,8,3,4,7),  (608,'2014-10-14',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (609,'2014-10-15',58,8,1,12,11),(610,'2014-10-15',1,8,2,5,1),   (611,'2014-10-15',16,8,3,11,4), (612,'2014-10-15',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (613,'2014-10-16',23,8,1,40,5), (614,'2014-10-16',9,8,2,13,3),  (615,'2014-10-16',16,8,3,11,4), (616,'2014-10-16',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (617,'2014-10-17',51,8,1,32,9), (618,'2014-10-17',1,8,2,5,1),   (619,'2014-10-17',9,8,3,13,3),  (620,'2014-10-17',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (621,'2014-10-13',44,1,1,19,8), (622,'2014-10-13',51,1,2,32,9), (623,'2014-10-13',65,1,3,2,10),  (624,'2014-10-13',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (625,'2014-10-14',1,1,1,5,1),   (626,'2014-10-14',16,1,2,11,4), (627,'2014-10-14',58,1,3,12,11), (628,'2014-10-14',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (629,'2014-10-15',16,1,1,11,4), (630,'2014-10-15',23,1,2,40,5), (631,'2014-10-15',9,1,3,13,3),   (632,'2014-10-15',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (633,'2014-10-16',51,1,1,32,9), (634,'2014-10-16',16,1,2,11,4), (635,'2014-10-16',1,1,3,5,1),    (636,'2014-10-16',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (637,'2014-10-17',23,1,1,40,5), (638,'2014-10-17',9,1,2,13,3),  (639,'2014-10-17',16,1,3,11,4),  (640,'2014-10-17',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (641,'2014-10-13',10,9,1,13,3),(642,'2014-10-13',2,9,2,5,1),   (643,'2014-10-13',38,9,3,4,7),  (644,'2014-10-13',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (645,'2014-10-14',17,9,1,11,4), (646,'2014-10-14',2,9,2,5,1),   (647,'2014-10-14',31,9,3,34,6), (648,'2014-10-14',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (649,'2014-10-15',45,9,1,19,8), (650,'2014-10-15',59,9,2,12,11),(651,'2014-10-15',2,9,3,5,1),   (652,'2014-10-15',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (653,'2014-10-16',17,9,1,11,4), (654,'2014-10-16',59,9,2,12,11),(655,'2014-10-16',24,9,3,40,5), (656,'2014-10-16',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (657,'2014-10-17',2,9,1,5,1),   (658,'2014-10-17',17,9,2,11,4), (659,'2014-10-17',45,9,3,19,8), (660,'2014-10-17',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (661,'2014-10-13',59,2,1,12,11),(662,'2014-10-13',17,2,2,11,4), (663,'2014-10-13',2,2,3,5,1),   (664,'2014-10-13',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (665,'2014-10-14',31,2,1,34,6), (666,'2014-10-14',10,2,2,13,3), (667,'2014-10-14',17,2,3,11,4), (668,'2014-10-14',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (669,'2014-10-15',10,2,1,13,3), (670,'2014-10-15',38,2,2,4,7),  (671,'2014-10-15',24,2,3,40,5), (672,'2014-10-15',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (673,'2014-10-16',2,2,1,5,1),   (674,'2014-10-16',66,2,2,2,10), (675,'2014-10-16',52,2,3,32,9), (676,'2014-10-16',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (677,'2014-10-17',17,2,1,11,4), (678,'2014-10-17',52,2,2,32,9), (679,'2014-10-17',2,2,3,5,1),   (680,'2014-10-17',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (681,'2014-10-13',18,10,1,11,4), (682,'2014-10-13',60,10,2,12,11), (683,'2014-10-13',32,10,3,34,6), (684,'2014-10-13',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (685,'2014-10-14',11,10,1,13,3), (686,'2014-10-14',46,10,2,19,8),  (687,'2014-10-14',3,10,3,5,1),   (688,'2014-10-14',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (689,'2014-10-15',3,10,1,5,1),   (690,'2014-10-15',67,10,2,2,10),  (691,'2014-10-15',60,10,3,12,11),(692,'2014-10-15',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (693,'2014-10-16',11,10,1,13,3), (694,'2014-10-16',3,10,2,5,1),    (695,'2014-10-16',46,10,3,19,8), (696,'2014-10-16',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (697,'2014-10-17',11,10,1,13,3), (698,'2014-10-17',25,10,2,40,5),  (699,'2014-10-17',53,10,3,32,9), (700,'2014-10-17',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (701,'2014-10-20',1,8,1,5,1),   (702,'2014-10-20',9,8,2,13,3),  (703,'2014-10-20',16,8,3,11,4), (704,'2014-10-20',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (705,'2014-10-21',44,8,1,19,8), (706,'2014-10-21',51,8,2,32,9), (707,'2014-10-21',37,8,3,4,7),  (708,'2014-10-21',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (709,'2014-10-22',58,8,1,12,11),(710,'2014-10-22',1,8,2,5,1),   (711,'2014-10-22',16,8,3,11,4), (712,'2014-10-22',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (713,'2014-10-23',23,8,1,40,5), (714,'2014-10-23',9,8,2,13,3),  (715,'2014-10-23',16,8,3,11,4), (716,'2014-10-23',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (717,'2014-10-24',51,8,1,32,9), (718,'2014-10-24',1,8,2,5,1),   (719,'2014-10-24',9,8,3,13,3),  (720,'2014-10-24',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (721,'2014-10-20',44,1,1,19,8), (722,'2014-10-20',51,1,2,32,9), (723,'2014-10-20',65,1,3,2,10),  (724,'2014-10-20',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (725,'2014-10-21',1,1,1,5,1),   (726,'2014-10-21',16,1,2,11,4), (727,'2014-10-21',58,1,3,12,11), (728,'2014-10-21',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (729,'2014-10-22',16,1,1,11,4), (730,'2014-10-22',23,1,2,40,5), (731,'2014-10-22',9,1,3,13,3),   (732,'2014-10-22',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (733,'2014-10-23',51,1,1,32,9), (734,'2014-10-23',16,1,2,11,4), (735,'2014-10-23',1,1,3,5,1),    (736,'2014-10-23',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (737,'2014-10-24',23,1,1,40,5), (738,'2014-10-24',9,1,2,13,3),  (739,'2014-10-24',16,1,3,11,4),  (740,'2014-10-24',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (741,'2014-10-20',10,9,1,13,3),(742,'2014-10-20',2,9,2,5,1),   (743,'2014-10-20',38,9,3,4,7),  (744,'2014-10-20',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (745,'2014-10-21',17,9,1,11,4), (746,'2014-10-21',2,9,2,5,1),   (747,'2014-10-21',31,9,3,34,6), (748,'2014-10-21',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (749,'2014-10-22',45,9,1,19,8), (750,'2014-10-22',59,9,2,12,11),(751,'2014-10-22',2,9,3,5,1),   (752,'2014-10-22',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (753,'2014-10-23',17,9,1,11,4), (754,'2014-10-23',59,9,2,12,11),(755,'2014-10-23',24,9,3,40,5), (756,'2014-10-23',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (757,'2014-10-24',2,9,1,5,1),   (758,'2014-10-24',17,9,2,11,4), (759,'2014-10-24',45,9,3,19,8), (760,'2014-10-24',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (761,'2014-10-20',59,2,1,12,11),(762,'2014-10-20',17,2,2,11,4), (763,'2014-10-20',2,2,3,5,1),   (764,'2014-10-20',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (765,'2014-10-21',31,2,1,34,6), (766,'2014-10-21',10,2,2,13,3), (767,'2014-10-21',17,2,3,11,4), (768,'2014-10-21',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (769,'2014-10-22',10,2,1,13,3), (770,'2014-10-22',38,2,2,4,7),  (771,'2014-10-22',24,2,3,40,5), (772,'2014-10-22',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (773,'2014-10-23',2,2,1,5,1),   (774,'2014-10-23',66,2,2,2,10), (775,'2014-10-23',52,2,3,32,9), (776,'2014-10-23',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (777,'2014-10-24',17,2,1,11,4), (778,'2014-10-24',52,2,2,32,9), (779,'2014-10-24',2,2,3,5,1),   (780,'2014-10-24',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (781,'2014-10-20',18,10,1,11,4), (782,'2014-10-20',60,10,2,12,11), (783,'2014-10-20',32,10,3,34,6), (784,'2014-10-20',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (785,'2014-10-21',11,10,1,13,3), (786,'2014-10-21',46,10,2,19,8),  (787,'2014-10-21',3,10,3,5,1),   (788,'2014-10-21',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (789,'2014-10-22',3,10,1,5,1),   (790,'2014-10-22',67,10,2,2,10),  (791,'2014-10-22',60,10,3,12,11),(792,'2014-10-22',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (793,'2014-10-23',11,10,1,13,3), (794,'2014-10-23',3,10,2,5,1),    (795,'2014-10-23',46,10,3,19,8), (796,'2014-10-23',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (797,'2014-10-24',11,10,1,13,3), (798,'2014-10-24',25,10,2,40,5),  (799,'2014-10-24',53,10,3,32,9), (800,'2014-10-24',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (801,'2014-10-27',1,8,1,5,1),   (802,'2014-10-27',9,8,2,13,3),  (803,'2014-10-27',16,8,3,11,4), (804,'2014-10-27',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (805,'2014-10-28',44,8,1,19,8), (806,'2014-10-28',51,8,2,32,9), (807,'2014-10-28',37,8,3,4,7),  (808,'2014-10-28',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (809,'2014-10-29',58,8,1,12,11),(810,'2014-10-29',1,8,2,5,1),   (811,'2014-10-29',16,8,3,11,4), (812,'2014-10-29',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (813,'2014-10-30',23,8,1,40,5), (814,'2014-10-30',9,8,2,13,3),  (815,'2014-10-30',16,8,3,11,4), (816,'2014-10-30',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (817,'2014-10-31',51,8,1,32,9), (818,'2014-10-31',1,8,2,5,1),   (819,'2014-10-31',9,8,3,13,3),  (820,'2014-10-31',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (821,'2014-10-27',44,1,1,19,8), (822,'2014-10-27',51,1,2,32,9), (823,'2014-10-27',65,1,3,2,10),  (824,'2014-10-27',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (825,'2014-10-28',1,1,1,5,1),   (826,'2014-10-28',16,1,2,11,4), (827,'2014-10-28',58,1,3,12,11), (828,'2014-10-28',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (829,'2014-10-29',16,1,1,11,4), (830,'2014-10-29',23,1,2,40,5), (831,'2014-10-29',9,1,3,13,3),   (832,'2014-10-29',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (833,'2014-10-30',51,1,1,32,9), (834,'2014-10-30',16,1,2,11,4), (835,'2014-10-30',1,1,3,5,1),    (836,'2014-10-30',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (837,'2014-10-31',23,1,1,40,5), (838,'2014-10-31',9,1,2,13,3),  (839,'2014-10-31',16,1,3,11,4),  (840,'2014-10-31',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (841,'2014-10-27',10,9,1,13,3),(842,'2014-10-27',2,9,2,5,1),   (843,'2014-10-27',38,9,3,4,7),  (844,'2014-10-27',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (845,'2014-10-28',17,9,1,11,4), (846,'2014-10-28',2,9,2,5,1),   (847,'2014-10-28',31,9,3,34,6), (848,'2014-10-28',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (849,'2014-10-29',45,9,1,19,8), (850,'2014-10-29',59,9,2,12,11),(851,'2014-10-29',2,9,3,5,1),   (852,'2014-10-29',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (853,'2014-10-30',17,9,1,11,4), (854,'2014-10-30',59,9,2,12,11),(855,'2014-10-30',24,9,3,40,5), (856,'2014-10-30',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (857,'2014-10-31',2,9,1,5,1),   (858,'2014-10-31',17,9,2,11,4), (859,'2014-10-31',45,9,3,19,8), (860,'2014-10-31',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (861,'2014-10-27',59,2,1,12,11),(862,'2014-10-27',17,2,2,11,4), (863,'2014-10-27',2,2,3,5,1),   (864,'2014-10-27',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (865,'2014-10-28',31,2,1,34,6), (866,'2014-10-28',10,2,2,13,3), (867,'2014-10-28',17,2,3,11,4), (868,'2014-10-28',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (869,'2014-10-29',10,2,1,13,3), (870,'2014-10-29',38,2,2,4,7),  (871,'2014-10-29',24,2,3,40,5), (872,'2014-10-29',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (873,'2014-10-30',2,2,1,5,1),   (874,'2014-10-30',66,2,2,2,10), (875,'2014-10-30',52,2,3,32,9), (876,'2014-10-30',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (877,'2014-10-31',17,2,1,11,4), (878,'2014-10-31',52,2,2,32,9), (879,'2014-10-31',2,2,3,5,1),   (880,'2014-10-31',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (881,'2014-10-27',18,10,1,11,4), (882,'2014-10-27',60,10,2,12,11), (883,'2014-10-27',32,10,3,34,6), (884,'2014-10-27',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (885,'2014-10-28',11,10,1,13,3), (886,'2014-10-28',46,10,2,19,8),  (887,'2014-10-28',3,10,3,5,1),   (888,'2014-10-28',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (889,'2014-10-29',3,10,1,5,1),   (890,'2014-10-29',67,10,2,2,10),  (891,'2014-10-29',60,10,3,12,11),(892,'2014-10-29',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (893,'2014-10-30',11,10,1,13,3), (894,'2014-10-30',3,10,2,5,1),    (895,'2014-10-30',46,10,3,19,8), (896,'2014-10-30',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (897,'2014-10-31',11,10,1,13,3), (898,'2014-10-31',25,10,2,40,5),  (899,'2014-10-31',53,10,3,32,9), (900,'2014-10-31',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (901,'2014-11-03',1,8,1,5,1),   (902,'2014-11-03',9,8,2,13,3),  (903,'2014-11-03',16,8,3,11,4), (904,'2014-11-03',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (905,'2014-11-04',44,8,1,19,8), (906,'2014-11-04',51,8,2,32,9), (907,'2014-11-04',37,8,3,4,7),  (908,'2014-11-04',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (909,'2014-11-05',58,8,1,12,11),(910,'2014-11-05',1,8,2,5,1),   (911,'2014-11-05',16,8,3,11,4), (912,'2014-11-05',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (913,'2014-11-06',23,8,1,40,5), (914,'2014-11-06',9,8,2,13,3),  (915,'2014-11-06',16,8,3,11,4), (916,'2014-11-06',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (917,'2014-11-07',51,8,1,32,9), (918,'2014-11-07',1,8,2,5,1),   (919,'2014-11-07',9,8,3,13,3),  (920,'2014-11-07',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (921,'2014-11-03',44,1,1,19,8), (922,'2014-11-03',51,1,2,32,9), (923,'2014-11-03',65,1,3,2,10),  (924,'2014-11-03',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (925,'2014-11-04',1,1,1,5,1),   (926,'2014-11-04',16,1,2,11,4), (927,'2014-11-04',58,1,3,12,11), (928,'2014-11-04',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (929,'2014-11-05',16,1,1,11,4), (930,'2014-11-05',23,1,2,40,5), (931,'2014-11-05',9,1,3,13,3),   (932,'2014-11-05',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (933,'2014-11-06',51,1,1,32,9), (934,'2014-11-06',16,1,2,11,4), (935,'2014-11-06',1,1,3,5,1),    (936,'2014-11-06',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (937,'2014-11-07',23,1,1,40,5), (938,'2014-11-07',9,1,2,13,3),  (939,'2014-11-07',16,1,3,11,4),  (940,'2014-11-07',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (941,'2014-11-03',10,9,1,13,3), (942,'2014-11-03',2,9,2,5,1),   (943,'2014-11-03',38,9,3,4,7),  (944,'2014-11-03',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (945,'2014-11-04',17,9,1,11,4), (946,'2014-11-04',2,9,2,5,1),   (947,'2014-11-04',31,9,3,34,6), (948,'2014-11-04',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (949,'2014-11-05',45,9,1,19,8), (950,'2014-11-05',59,9,2,12,11),(951,'2014-11-05',2,9,3,5,1),   (952,'2014-11-05',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (953,'2014-11-06',17,9,1,11,4), (954,'2014-11-06',59,9,2,12,11),(955,'2014-11-06',24,9,3,40,5), (956,'2014-11-06',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (957,'2014-11-07',2,9,1,5,1),   (958,'2014-11-07',17,9,2,11,4), (959,'2014-11-07',45,9,3,19,8), (960,'2014-11-07',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (961,'2014-11-03',59,2,1,12,11),(962,'2014-11-03',17,2,2,11,4), (963,'2014-11-03',2,2,3,5,1),   (964,'2014-11-03',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (965,'2014-11-04',31,2,1,34,6), (966,'2014-11-04',10,2,2,13,3), (967,'2014-11-04',17,2,3,11,4), (968,'2014-11-04',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (969,'2014-11-05',10,2,1,13,3), (970,'2014-11-05',38,2,2,4,7),  (971,'2014-11-05',24,2,3,40,5), (972,'2014-11-05',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (973,'2014-11-06',2,2,1,5,1),   (974,'2014-11-06',66,2,2,2,10), (975,'2014-11-06',52,2,3,32,9), (976,'2014-11-06',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (977,'2014-11-07',17,2,1,11,4), (978,'2014-11-07',52,2,2,32,9), (979,'2014-11-07',2,2,3,5,1),   (980,'2014-11-07',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (981,'2014-11-03',18,10,1,11,4), (982,'2014-11-03',60,10,2,12,11), (983,'2014-11-03',32,10,3,34,6), (984,'2014-11-03',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (985,'2014-11-04',11,10,1,13,3), (986,'2014-11-04',46,10,2,19,8),  (987,'2014-11-04',3,10,3,5,1),   (988,'2014-11-04',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (989,'2014-11-05',3,10,1,5,1),   (990,'2014-11-05',67,10,2,2,10),  (991,'2014-11-05',60,10,3,12,11),(992,'2014-11-05',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (993,'2014-11-06',11,10,1,13,3), (994,'2014-11-06',3,10,2,5,1),    (995,'2014-11-06',46,10,3,19,8), (996,'2014-11-06',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (997,'2014-11-07',11,10,1,13,3), (998,'2014-11-07',25,10,2,40,5),  (999,'2014-11-07',53,10,3,32,9), (1000,'2014-11-07',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1001,'2014-11-10',1,8,1,5,1),   (1002,'2014-11-10',9,8,2,13,3),  (1003,'2014-11-10',16,8,3,11,4), (1004,'2014-11-10',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1005,'2014-11-11',44,8,1,19,8), (1006,'2014-11-11',51,8,2,32,9), (1007,'2014-11-11',37,8,3,4,7),  (1008,'2014-11-11',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1009,'2014-11-12',58,8,1,12,11),(1010,'2014-11-12',1,8,2,5,1),   (1011,'2014-11-12',16,8,3,11,4), (1012,'2014-11-12',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1013,'2014-11-13',23,8,1,40,5), (1014,'2014-11-13',9,8,2,13,3),  (1015,'2014-11-13',16,8,3,11,4), (1016,'2014-11-13',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1017,'2014-11-14',51,8,1,32,9), (1018,'2014-11-14',1,8,2,5,1),   (1019,'2014-11-14',9,8,3,13,3),  (1020,'2014-11-14',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1021,'2014-11-10',44,1,1,19,8), (1022,'2014-11-10',51,1,2,32,9), (1023,'2014-11-10',65,1,3,2,10),  (1024,'2014-11-10',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1025,'2014-11-11',1,1,1,5,1),   (1026,'2014-11-11',16,1,2,11,4), (1027,'2014-11-11',58,1,3,12,11), (1028,'2014-11-11',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1029,'2014-11-12',16,1,1,11,4), (1030,'2014-11-12',23,1,2,40,5), (1031,'2014-11-12',9,1,3,13,3),   (1032,'2014-11-12',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1033,'2014-11-13',51,1,1,32,9), (1034,'2014-11-13',16,1,2,11,4), (1035,'2014-11-13',1,1,3,5,1),    (1036,'2014-11-13',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1037,'2014-11-14',23,1,1,40,5), (1038,'2014-11-14',9,1,2,13,3),  (1039,'2014-11-14',16,1,3,11,4),  (1040,'2014-11-14',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1041,'2014-11-10',10,9,1,13,3), (1042,'2014-11-10',2,9,2,5,1),   (1043,'2014-11-10',38,9,3,4,7),  (1044,'2014-11-10',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1045,'2014-11-11',17,9,1,11,4), (1046,'2014-11-11',2,9,2,5,1),   (1047,'2014-11-11',31,9,3,34,6), (1048,'2014-11-11',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1049,'2014-11-12',45,9,1,19,8), (1050,'2014-11-12',59,9,2,12,11),(1051,'2014-11-12',2,9,3,5,1),   (1052,'2014-11-12',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1053,'2014-11-13',17,9,1,11,4), (1054,'2014-11-13',59,9,2,12,11),(1055,'2014-11-13',24,9,3,40,5), (1056,'2014-11-13',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1057,'2014-11-14',2,9,1,5,1),   (1058,'2014-11-14',17,9,2,11,4), (1059,'2014-11-14',45,9,3,19,8), (1060,'2014-11-14',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1061,'2014-11-10',59,2,1,12,11),(1062,'2014-11-10',17,2,2,11,4), (1063,'2014-11-10',2,2,3,5,1),   (1064,'2014-11-10',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1065,'2014-11-11',31,2,1,34,6), (1066,'2014-11-11',10,2,2,13,3), (1067,'2014-11-11',17,2,3,11,4), (1068,'2014-11-11',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1069,'2014-11-12',10,2,1,13,3), (1070,'2014-11-12',38,2,2,4,7),  (1071,'2014-11-12',24,2,3,40,5), (1072,'2014-11-12',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1073,'2014-11-13',2,2,1,5,1),   (1074,'2014-11-13',66,2,2,2,10), (1075,'2014-11-13',52,2,3,32,9), (1076,'2014-11-13',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1077,'2014-11-14',17,2,1,11,4), (1078,'2014-11-14',52,2,2,32,9), (1079,'2014-11-14',2,2,3,5,1),   (1080,'2014-11-14',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1081,'2014-11-10',18,10,1,11,4), (1082,'2014-11-10',60,10,2,12,11), (1083,'2014-11-10',32,10,3,34,6), (1084,'2014-11-10',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1085,'2014-11-11',11,10,1,13,3), (1086,'2014-11-11',46,10,2,19,8),  (1087,'2014-11-11',3,10,3,5,1),   (1088,'2014-11-11',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1089,'2014-11-12',3,10,1,5,1),   (1090,'2014-11-12',67,10,2,2,10),  (1091,'2014-11-12',60,10,3,12,11),(1092,'2014-11-12',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1093,'2014-11-13',11,10,1,13,3), (1094,'2014-11-13',3,10,2,5,1),    (1095,'2014-11-13',46,10,3,19,8), (1096,'2014-11-13',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1097,'2014-11-14',11,10,1,13,3), (1098,'2014-11-14',25,10,2,40,5),  (1099,'2014-11-14',53,10,3,32,9), (1100,'2014-11-14',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1101,'2014-11-17',1,8,1,5,1),   (1102,'2014-11-17',9,8,2,13,3),  (1103,'2014-11-17',16,8,3,11,4), (1104,'2014-11-17',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1105,'2014-11-18',44,8,1,19,8), (1106,'2014-11-18',51,8,2,32,9), (1107,'2014-11-18',37,8,3,4,7),  (1108,'2014-11-18',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1109,'2014-11-19',58,8,1,12,11),(1110,'2014-11-19',1,8,2,5,1),   (1111,'2014-11-19',16,8,3,11,4), (1112,'2014-11-19',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1113,'2014-11-20',23,8,1,40,5), (1114,'2014-11-20',9,8,2,13,3),  (1115,'2014-11-20',16,8,3,11,4), (1116,'2014-11-20',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1117,'2014-11-21',51,8,1,32,9), (1118,'2014-11-21',1,8,2,5,1),   (1119,'2014-11-21',9,8,3,13,3),  (1120,'2014-11-21',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1121,'2014-11-17',44,1,1,19,8), (1122,'2014-11-17',51,1,2,32,9), (1123,'2014-11-17',65,1,3,2,10),  (1124,'2014-11-17',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1125,'2014-11-18',1,1,1,5,1),   (1126,'2014-11-18',16,1,2,11,4), (1127,'2014-11-18',58,1,3,12,11), (1128,'2014-11-18',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1129,'2014-11-19',16,1,1,11,4), (1130,'2014-11-19',23,1,2,40,5), (1131,'2014-11-19',9,1,3,13,3),   (1132,'2014-11-19',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1133,'2014-11-20',51,1,1,32,9), (1134,'2014-11-20',16,1,2,11,4), (1135,'2014-11-20',1,1,3,5,1),    (1136,'2014-11-20',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1137,'2014-11-21',23,1,1,40,5), (1138,'2014-11-21',9,1,2,13,3),  (1139,'2014-11-21',16,1,3,11,4),  (1140,'2014-11-21',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1141,'2014-11-17',10,9,1,13,3), (1142,'2014-11-17',2,9,2,5,1),   (1143,'2014-11-17',38,9,3,4,7),  (1144,'2014-11-17',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1145,'2014-11-18',17,9,1,11,4), (1146,'2014-11-18',2,9,2,5,1),   (1147,'2014-11-18',31,9,3,34,6), (1148,'2014-11-18',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1149,'2014-11-19',45,9,1,19,8), (1150,'2014-11-19',59,9,2,12,11),(1151,'2014-11-19',2,9,3,5,1),   (1152,'2014-11-19',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1153,'2014-11-20',17,9,1,11,4), (1154,'2014-11-20',59,9,2,12,11),(1155,'2014-11-20',24,9,3,40,5), (1156,'2014-11-20',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1157,'2014-11-21',2,9,1,5,1),   (1158,'2014-11-21',17,9,2,11,4), (1159,'2014-11-21',45,9,3,19,8), (1160,'2014-11-21',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1161,'2014-11-17',59,2,1,12,11),(1162,'2014-11-17',17,2,2,11,4), (1163,'2014-11-17',2,2,3,5,1),   (1164,'2014-11-17',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1165,'2014-11-18',31,2,1,34,6), (1166,'2014-11-18',10,2,2,13,3), (1167,'2014-11-18',17,2,3,11,4), (1168,'2014-11-18',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1169,'2014-11-19',10,2,1,13,3), (1170,'2014-11-19',38,2,2,4,7),  (1171,'2014-11-19',24,2,3,40,5), (1172,'2014-11-19',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1173,'2014-11-20',2,2,1,5,1),   (1174,'2014-11-20',66,2,2,2,10), (1175,'2014-11-20',52,2,3,32,9), (1176,'2014-11-20',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1177,'2014-11-21',17,2,1,11,4), (1178,'2014-11-21',52,2,2,32,9), (1179,'2014-11-21',2,2,3,5,1),   (1180,'2014-11-21',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1181,'2014-11-17',18,10,1,11,4), (1182,'2014-11-17',60,10,2,12,11), (1183,'2014-11-17',32,10,3,34,6), (1184,'2014-11-17',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1185,'2014-11-18',11,10,1,13,3), (1186,'2014-11-18',46,10,2,19,8),  (1187,'2014-11-18',3,10,3,5,1),   (1188,'2014-11-18',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1189,'2014-11-19',3,10,1,5,1),   (1190,'2014-11-19',67,10,2,2,10),  (1191,'2014-11-19',60,10,3,12,11),(1192,'2014-11-19',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1193,'2014-11-20',11,10,1,13,3), (1194,'2014-11-20',3,10,2,5,1),    (1195,'2014-11-20',46,10,3,19,8), (1196,'2014-11-20',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1197,'2014-11-21',11,10,1,13,3), (1198,'2014-11-21',25,10,2,40,5),  (1199,'2014-11-21',53,10,3,32,9), (1200,'2014-11-21',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1201,'2014-11-24',1,8,1,5,1),   (1202,'2014-11-24',9,8,2,13,3),  (1203,'2014-11-24',16,8,3,11,4), (1204,'2014-11-24',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1205,'2014-11-25',44,8,1,19,8), (1206,'2014-11-25',51,8,2,32,9), (1207,'2014-11-25',37,8,3,4,7),  (1208,'2014-11-25',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1209,'2014-11-26',58,8,1,12,11),(1210,'2014-11-26',1,8,2,5,1),   (1211,'2014-11-26',16,8,3,11,4), (1212,'2014-11-26',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1213,'2014-11-27',23,8,1,40,5), (1214,'2014-11-27',9,8,2,13,3),  (1215,'2014-11-27',16,8,3,11,4), (1216,'2014-11-27',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1217,'2014-11-28',51,8,1,32,9), (1218,'2014-11-28',1,8,2,5,1),   (1219,'2014-11-28',9,8,3,13,3),  (1220,'2014-11-28',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1221,'2014-11-24',44,1,1,19,8), (1222,'2014-11-24',51,1,2,32,9), (1223,'2014-11-24',65,1,3,2,10),  (1224,'2014-11-24',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1225,'2014-11-25',1,1,1,5,1),   (1226,'2014-11-25',16,1,2,11,4), (1227,'2014-11-25',58,1,3,12,11), (1228,'2014-11-25',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1229,'2014-11-26',16,1,1,11,4), (1230,'2014-11-26',23,1,2,40,5), (1231,'2014-11-26',9,1,3,13,3),   (1232,'2014-11-26',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1233,'2014-11-27',51,1,1,32,9), (1234,'2014-11-27',16,1,2,11,4), (1235,'2014-11-27',1,1,3,5,1),    (1236,'2014-11-27',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1237,'2014-11-28',23,1,1,40,5), (1238,'2014-11-28',9,1,2,13,3),  (1239,'2014-11-28',16,1,3,11,4),  (1240,'2014-11-28',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1241,'2014-11-24',10,9,1,13,3), (1242,'2014-11-24',2,9,2,5,1),   (1243,'2014-11-24',38,9,3,4,7),  (1244,'2014-11-24',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1245,'2014-11-25',17,9,1,11,4), (1246,'2014-11-25',2,9,2,5,1),   (1247,'2014-11-25',31,9,3,34,6), (1248,'2014-11-25',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1249,'2014-11-26',45,9,1,19,8), (1250,'2014-11-26',59,9,2,12,11),(1251,'2014-11-26',2,9,3,5,1),   (1252,'2014-11-26',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1253,'2014-11-27',17,9,1,11,4), (1254,'2014-11-27',59,9,2,12,11),(1255,'2014-11-27',24,9,3,40,5), (1256,'2014-11-27',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1257,'2014-11-28',2,9,1,5,1),   (1258,'2014-11-28',17,9,2,11,4), (1259,'2014-11-28',45,9,3,19,8), (1260,'2014-11-28',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1261,'2014-11-24',59,2,1,12,11),(1262,'2014-11-24',17,2,2,11,4), (1263,'2014-11-24',2,2,3,5,1),   (1264,'2014-11-24',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1265,'2014-11-25',31,2,1,34,6), (1266,'2014-11-25',10,2,2,13,3), (1267,'2014-11-25',17,2,3,11,4), (1268,'2014-11-25',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1269,'2014-11-26',10,2,1,13,3), (1270,'2014-11-26',38,2,2,4,7),  (1271,'2014-11-26',24,2,3,40,5), (1272,'2014-11-26',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1273,'2014-11-27',2,2,1,5,1),   (1274,'2014-11-27',66,2,2,2,10), (1275,'2014-11-27',52,2,3,32,9), (1276,'2014-11-27',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1277,'2014-11-28',17,2,1,11,4), (1278,'2014-11-28',52,2,2,32,9), (1279,'2014-11-28',2,2,3,5,1),   (1280,'2014-11-28',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1281,'2014-11-24',18,10,1,11,4), (1282,'2014-11-24',60,10,2,12,11), (1283,'2014-11-24',32,10,3,34,6), (1284,'2014-11-24',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1285,'2014-11-25',11,10,1,13,3), (1286,'2014-11-25',46,10,2,19,8),  (1287,'2014-11-25',3,10,3,5,1),   (1288,'2014-11-25',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1289,'2014-11-26',3,10,1,5,1),   (1290,'2014-11-26',67,10,2,2,10),  (1291,'2014-11-26',60,10,3,12,11),(1292,'2014-11-26',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1293,'2014-11-27',11,10,1,13,3), (1294,'2014-11-27',3,10,2,5,1),    (1295,'2014-11-27',46,10,3,19,8), (1296,'2014-11-27',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1297,'2014-11-28',11,10,1,13,3), (1298,'2014-11-28',25,10,2,40,5),  (1299,'2014-11-28',53,10,3,32,9), (1300,'2014-11-28',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1301,'2014-12-01',1,8,1,5,1),   (1302,'2014-12-01',9,8,2,13,3),  (1303,'2014-12-01',16,8,3,11,4), (1304,'2014-12-01',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1305,'2014-12-02',44,8,1,19,8), (1306,'2014-12-02',51,8,2,32,9), (1307,'2014-12-02',37,8,3,4,7),  (1308,'2014-12-02',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1309,'2014-12-03',58,8,1,12,11),(1310,'2014-12-03',1,8,2,5,1),   (1311,'2014-12-03',16,8,3,11,4), (1312,'2014-12-03',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1313,'2014-12-04',23,8,1,40,5), (1314,'2014-12-04',9,8,2,13,3),  (1315,'2014-12-04',16,8,3,11,4), (1316,'2014-12-04',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1317,'2014-12-05',51,8,1,32,9), (1318,'2014-12-05',1,8,2,5,1),   (1319,'2014-12-05',9,8,3,13,3),  (1320,'2014-12-05',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1321,'2014-12-01',44,1,1,19,8), (1322,'2014-12-01',51,1,2,32,9), (1323,'2014-12-01',65,1,3,2,10),  (1324,'2014-12-01',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1325,'2014-12-02',1,1,1,5,1),   (1326,'2014-12-02',16,1,2,11,4), (1327,'2014-12-02',58,1,3,12,11), (1328,'2014-12-02',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1329,'2014-12-03',16,1,1,11,4), (1330,'2014-12-03',23,1,2,40,5), (1331,'2014-12-03',9,1,3,13,3),   (1332,'2014-12-03',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1333,'2014-12-04',51,1,1,32,9), (1334,'2014-12-04',16,1,2,11,4), (1335,'2014-12-04',1,1,3,5,1),    (1336,'2014-12-04',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1337,'2014-12-05',23,1,1,40,5), (1338,'2014-12-05',9,1,2,13,3),  (1339,'2014-12-05',16,1,3,11,4),  (1340,'2014-12-05',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1341,'2014-12-01',10,9,1,13,3), (1342,'2014-12-01',2,9,2,5,1),   (1343,'2014-12-01',38,9,3,4,7),  (1344,'2014-12-01',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1345,'2014-12-02',17,9,1,11,4), (1346,'2014-12-02',2,9,2,5,1),   (1347,'2014-12-02',31,9,3,34,6), (1348,'2014-12-02',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1349,'2014-12-03',45,9,1,19,8), (1350,'2014-12-03',59,9,2,12,11),(1351,'2014-12-03',2,9,3,5,1),   (1352,'2014-12-03',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1353,'2014-12-04',17,9,1,11,4), (1354,'2014-12-04',59,9,2,12,11),(1355,'2014-12-04',24,9,3,40,5), (1356,'2014-12-04',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1357,'2014-12-05',2,9,1,5,1),   (1358,'2014-12-05',17,9,2,11,4), (1359,'2014-12-05',45,9,3,19,8), (1360,'2014-12-05',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1361,'2014-12-01',59,2,1,12,11),(1362,'2014-12-01',17,2,2,11,4), (1363,'2014-12-01',2,2,3,5,1),   (1364,'2014-12-01',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1365,'2014-12-02',31,2,1,34,6), (1366,'2014-12-02',10,2,2,13,3), (1367,'2014-12-02',17,2,3,11,4), (1368,'2014-12-02',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1369,'2014-12-03',10,2,1,13,3), (1370,'2014-12-03',38,2,2,4,7),  (1371,'2014-12-03',24,2,3,40,5), (1372,'2014-12-03',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1373,'2014-12-04',2,2,1,5,1),   (1374,'2014-12-04',66,2,2,2,10), (1375,'2014-12-04',52,2,3,32,9), (1376,'2014-12-04',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1377,'2014-12-05',17,2,1,11,4), (1378,'2014-12-05',52,2,2,32,9), (1379,'2014-12-05',2,2,3,5,1),   (1380,'2014-12-05',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1381,'2014-12-01',18,10,1,11,4), (1382,'2014-12-01',60,10,2,12,11), (1383,'2014-12-01',32,10,3,34,6), (1384,'2014-12-01',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1385,'2014-12-02',11,10,1,13,3), (1386,'2014-12-02',46,10,2,19,8),  (1387,'2014-12-02',3,10,3,5,1),   (1388,'2014-12-02',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1389,'2014-12-03',3,10,1,5,1),   (1390,'2014-12-03',67,10,2,2,10),  (1391,'2014-12-03',60,10,3,12,11),(1392,'2014-12-03',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1393,'2014-12-04',11,10,1,13,3), (1394,'2014-12-04',3,10,2,5,1),    (1395,'2014-12-04',46,10,3,19,8), (1396,'2014-12-04',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1397,'2014-12-05',11,10,1,13,3), (1398,'2014-12-05',25,10,2,40,5),  (1399,'2014-12-05',53,10,3,32,9), (1400,'2014-12-05',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1401,'2014-12-08',1,8,1,5,1),   (1402,'2014-12-08',9,8,2,13,3),  (1403,'2014-12-08',16,8,3,11,4), (1404,'2014-12-08',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1405,'2014-12-09',44,8,1,19,8), (1406,'2014-12-09',51,8,2,32,9), (1407,'2014-12-09',37,8,3,4,7),  (1408,'2014-12-09',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1409,'2014-12-10',58,8,1,12,11),(1410,'2014-12-10',1,8,2,5,1),   (1411,'2014-12-10',16,8,3,11,4), (1412,'2014-12-10',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1413,'2014-12-11',23,8,1,40,5), (1414,'2014-12-11',9,8,2,13,3),  (1415,'2014-12-11',16,8,3,11,4), (1416,'2014-12-11',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1417,'2014-12-12',51,8,1,32,9), (1418,'2014-12-12',1,8,2,5,1),   (1419,'2014-12-12',9,8,3,13,3),  (1420,'2014-12-12',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1421,'2014-12-08',44,1,1,19,8), (1422,'2014-12-08',51,1,2,32,9), (1423,'2014-12-08',65,1,3,2,10),  (1424,'2014-12-08',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1425,'2014-12-09',1,1,1,5,1),   (1426,'2014-12-09',16,1,2,11,4), (1427,'2014-12-09',58,1,3,12,11), (1428,'2014-12-09',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1429,'2014-12-10',16,1,1,11,4), (1430,'2014-12-10',23,1,2,40,5), (1431,'2014-12-10',9,1,3,13,3),   (1432,'2014-12-10',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1433,'2014-12-11',51,1,1,32,9), (1434,'2014-12-11',16,1,2,11,4), (1435,'2014-12-11',1,1,3,5,1),    (1436,'2014-12-11',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1437,'2014-12-12',23,1,1,40,5), (1438,'2014-12-12',9,1,2,13,3),  (1439,'2014-12-12',16,1,3,11,4),  (1440,'2014-12-12',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1441,'2014-12-08',10,9,1,13,3), (1442,'2014-12-08',2,9,2,5,1),   (1443,'2014-12-08',38,9,3,4,7),  (1444,'2014-12-08',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1445,'2014-12-09',17,9,1,11,4), (1446,'2014-12-09',2,9,2,5,1),   (1447,'2014-12-09',31,9,3,34,6), (1448,'2014-12-09',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1449,'2014-12-10',45,9,1,19,8), (1450,'2014-12-10',59,9,2,12,11),(1451,'2014-12-10',2,9,3,5,1),   (1452,'2014-12-10',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1453,'2014-12-11',17,9,1,11,4), (1454,'2014-12-11',59,9,2,12,11),(1455,'2014-12-11',24,9,3,40,5), (1456,'2014-12-11',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1457,'2014-12-12',2,9,1,5,1),   (1458,'2014-12-12',17,9,2,11,4), (1459,'2014-12-12',45,9,3,19,8), (1460,'2014-12-12',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1461,'2014-12-08',59,2,1,12,11),(1462,'2014-12-08',17,2,2,11,4), (1463,'2014-12-08',2,2,3,5,1),   (1464,'2014-12-08',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1465,'2014-12-09',31,2,1,34,6), (1466,'2014-12-09',10,2,2,13,3), (1467,'2014-12-09',17,2,3,11,4), (1468,'2014-12-09',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1469,'2014-12-10',10,2,1,13,3), (1470,'2014-12-10',38,2,2,4,7),  (1471,'2014-12-10',24,2,3,40,5), (1472,'2014-12-10',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1473,'2014-12-11',2,2,1,5,1),   (1474,'2014-12-11',66,2,2,2,10), (1475,'2014-12-11',52,2,3,32,9), (1476,'2014-12-11',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1477,'2014-12-12',17,2,1,11,4), (1478,'2014-12-12',52,2,2,32,9), (1479,'2014-12-12',2,2,3,5,1),   (1480,'2014-12-12',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1481,'2014-12-08',18,10,1,11,4), (1482,'2014-12-08',60,10,2,12,11), (1483,'2014-12-08',32,10,3,34,6), (1484,'2014-12-08',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1485,'2014-12-09',11,10,1,13,3), (1486,'2014-12-09',46,10,2,19,8),  (1487,'2014-12-09',3,10,3,5,1),   (1488,'2014-12-09',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1489,'2014-12-10',3,10,1,5,1),   (1490,'2014-12-10',67,10,2,2,10),  (1491,'2014-12-10',60,10,3,12,11),(1492,'2014-12-10',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1493,'2014-12-11',11,10,1,13,3), (1494,'2014-12-11',3,10,2,5,1),    (1495,'2014-12-11',46,10,3,19,8), (1496,'2014-12-11',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1497,'2014-12-12',11,10,1,13,3), (1498,'2014-12-12',25,10,2,40,5),  (1499,'2014-12-12',53,10,3,32,9), (1500,'2014-12-12',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1501,'2014-12-15',1,8,1,5,1),   (1502,'2014-12-15',9,8,2,13,3),  (1503,'2014-12-15',16,8,3,11,4), (1504,'2014-12-15',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1505,'2014-12-16',44,8,1,19,8), (1506,'2014-12-16',51,8,2,32,9), (1507,'2014-12-16',37,8,3,4,7),  (1508,'2014-12-16',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1509,'2014-12-17',58,8,1,12,11),(1510,'2014-12-17',1,8,2,5,1),   (1511,'2014-12-17',16,8,3,11,4), (1512,'2014-12-17',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1513,'2014-12-18',23,8,1,40,5), (1514,'2014-12-18',9,8,2,13,3),  (1515,'2014-12-18',16,8,3,11,4), (1516,'2014-12-18',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1517,'2014-12-19',51,8,1,32,9), (1518,'2014-12-19',1,8,2,5,1),   (1519,'2014-12-19',9,8,3,13,3),  (1520,'2014-12-19',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1521,'2014-12-15',44,1,1,19,8), (1522,'2014-12-15',51,1,2,32,9), (1523,'2014-12-15',65,1,3,2,10),  (1524,'2014-12-15',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1525,'2014-12-16',1,1,1,5,1),   (1526,'2014-12-16',16,1,2,11,4), (1527,'2014-12-16',58,1,3,12,11), (1528,'2014-12-16',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1529,'2014-12-17',16,1,1,11,4), (1530,'2014-12-17',23,1,2,40,5), (1531,'2014-12-17',9,1,3,13,3),   (1532,'2014-12-17',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1533,'2014-12-18',51,1,1,32,9), (1534,'2014-12-18',16,1,2,11,4), (1535,'2014-12-18',1,1,3,5,1),    (1536,'2014-12-18',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1537,'2014-12-19',23,1,1,40,5), (1538,'2014-12-19',9,1,2,13,3),  (1539,'2014-12-19',16,1,3,11,4),  (1540,'2014-12-19',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1541,'2014-12-15',10,9,1,13,3), (1542,'2014-12-15',2,9,2,5,1),   (1543,'2014-12-15',38,9,3,4,7),  (1544,'2014-12-15',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1545,'2014-12-16',17,9,1,11,4), (1546,'2014-12-16',2,9,2,5,1),   (1547,'2014-12-16',31,9,3,34,6), (1548,'2014-12-16',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1549,'2014-12-17',45,9,1,19,8), (1550,'2014-12-17',59,9,2,12,11),(1551,'2014-12-17',2,9,3,5,1),   (1552,'2014-12-17',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1553,'2014-12-18',17,9,1,11,4), (1554,'2014-12-18',59,9,2,12,11),(1555,'2014-12-18',24,9,3,40,5), (1556,'2014-12-18',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1557,'2014-12-19',2,9,1,5,1),   (1558,'2014-12-19',17,9,2,11,4), (1559,'2014-12-19',45,9,3,19,8), (1560,'2014-12-19',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1561,'2014-12-15',59,2,1,12,11),(1562,'2014-12-15',17,2,2,11,4), (1563,'2014-12-15',2,2,3,5,1),   (1564,'2014-12-15',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1565,'2014-12-16',31,2,1,34,6), (1566,'2014-12-16',10,2,2,13,3), (1567,'2014-12-16',17,2,3,11,4), (1568,'2014-12-16',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1569,'2014-12-17',10,2,1,13,3), (1570,'2014-12-17',38,2,2,4,7),  (1571,'2014-12-17',24,2,3,40,5), (1572,'2014-12-17',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1573,'2014-12-18',2,2,1,5,1),   (1574,'2014-12-18',66,2,2,2,10), (1575,'2014-12-18',52,2,3,32,9), (1576,'2014-12-18',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1577,'2014-12-19',17,2,1,11,4), (1578,'2014-12-19',52,2,2,32,9), (1579,'2014-12-19',2,2,3,5,1),   (1580,'2014-12-19',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1581,'2014-12-15',18,10,1,11,4), (1582,'2014-12-15',60,10,2,12,11), (1583,'2014-12-15',32,10,3,34,6), (1584,'2014-12-15',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1585,'2014-12-16',11,10,1,13,3), (1586,'2014-12-16',46,10,2,19,8),  (1587,'2014-12-16',3,10,3,5,1),   (1588,'2014-12-16',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1589,'2014-12-17',3,10,1,5,1),   (1590,'2014-12-17',67,10,2,2,10),  (1591,'2014-12-17',60,10,3,12,11),(1592,'2014-12-17',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1593,'2014-12-18',11,10,1,13,3), (1594,'2014-12-18',3,10,2,5,1),    (1595,'2014-12-18',46,10,3,19,8), (1596,'2014-12-18',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1597,'2014-12-19',11,10,1,13,3), (1598,'2014-12-19',25,10,2,40,5),  (1599,'2014-12-19',53,10,3,32,9), (1600,'2014-12-19',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1601,'2014-12-22',1,8,1,5,1),   (1602,'2014-12-22',9,8,2,13,3),  (1603,'2014-12-22',16,8,3,11,4), (1604,'2014-12-22',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1605,'2014-12-23',44,8,1,19,8), (1606,'2014-12-23',51,8,2,32,9), (1607,'2014-12-23',37,8,3,4,7),  (1608,'2014-12-23',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1609,'2014-12-24',58,8,1,12,11),(1610,'2014-12-24',1,8,2,5,1),   (1611,'2014-12-24',16,8,3,11,4), (1612,'2014-12-24',30,8,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1613,'2014-12-25',23,8,1,40,5), (1614,'2014-12-25',9,8,2,13,3),  (1615,'2014-12-25',16,8,3,11,4), (1616,'2014-12-25',44,8,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1617,'2014-12-26',51,8,1,32,9), (1618,'2014-12-26',1,8,2,5,1),   (1619,'2014-12-26',9,8,3,13,3),  (1620,'2014-12-26',16,8,4,11,4);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1621,'2014-12-22',44,1,1,19,8), (1622,'2014-12-22',51,1,2,32,9), (1623,'2014-12-22',65,1,3,2,10),  (1624,'2014-12-22',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1625,'2014-12-23',1,1,1,5,1),   (1626,'2014-12-23',16,1,2,11,4), (1627,'2014-12-23',58,1,3,12,11), (1628,'2014-12-23',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1629,'2014-12-24',16,1,1,11,4), (1630,'2014-12-24',23,1,2,40,5), (1631,'2014-12-24',9,1,3,13,3),   (1632,'2014-12-24',44,1,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1633,'2014-12-25',51,1,1,32,9), (1634,'2014-12-25',16,1,2,11,4), (1635,'2014-12-25',1,1,3,5,1),    (1636,'2014-12-25',9,1,4,13,3);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1637,'2014-12-26',23,1,1,40,5), (1638,'2014-12-26',9,1,2,13,3),  (1639,'2014-12-26',16,1,3,11,4),  (1640,'2014-12-26',58,1,4,12,11);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1641,'2014-12-22',10,9,1,13,3), (1642,'2014-12-22',2,9,2,5,1),   (1643,'2014-12-22',38,9,3,4,7),  (1644,'2014-12-22',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1645,'2014-12-23',17,9,1,11,4), (1646,'2014-12-23',2,9,2,5,1),   (1647,'2014-12-23',31,9,3,34,6), (1648,'2014-12-23',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1649,'2014-12-24',45,9,1,19,8), (1650,'2014-12-24',59,9,2,12,11),(1651,'2014-12-24',2,9,3,5,1),   (1652,'2014-12-24',2,9,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1653,'2014-12-25',17,9,1,11,4), (1654,'2014-12-25',59,9,2,12,11),(1655,'2014-12-25',24,9,3,40,5), (1656,'2014-12-25',38,9,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1657,'2014-12-26',2,9,1,5,1),   (1658,'2014-12-26',17,9,2,11,4), (1659,'2014-12-26',45,9,3,19,8), (1660,'2014-12-26',10,9,4,13,3);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1661,'2014-12-22',59,2,1,12,11),(1662,'2014-12-22',17,2,2,11,4), (1663,'2014-12-22',2,2,3,5,1),   (1664,'2014-12-22',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1665,'2014-12-23',31,2,1,34,6), (1666,'2014-12-23',10,2,2,13,3), (1667,'2014-12-23',17,2,3,11,4), (1668,'2014-12-23',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1669,'2014-12-24',10,2,1,13,3), (1670,'2014-12-24',38,2,2,4,7),  (1671,'2014-12-24',24,2,3,40,5), (1672,'2014-12-24',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1673,'2014-12-25',2,2,1,5,1),   (1674,'2014-12-25',66,2,2,2,10), (1675,'2014-12-25',52,2,3,32,9), (1676,'2014-12-25',17,2,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1677,'2014-12-26',17,2,1,11,4), (1678,'2014-12-26',52,2,2,32,9), (1679,'2014-12-26',2,2,3,5,1),   (1680,'2014-12-26',38,2,4,4,7);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1681,'2014-12-22',18,10,1,11,4), (1682,'2014-12-22',60,10,2,12,11), (1683,'2014-12-22',32,10,3,34,6), (1684,'2014-12-22',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1685,'2014-12-23',11,10,1,13,3), (1686,'2014-12-23',46,10,2,19,8),  (1687,'2014-12-23',3,10,3,5,1),   (1688,'2014-12-23',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1689,'2014-12-24',3,10,1,5,1),   (1690,'2014-12-24',67,10,2,2,10),  (1691,'2014-12-24',60,10,3,12,11),(1692,'2014-12-24',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1693,'2014-12-25',11,10,1,13,3), (1694,'2014-12-25',3,10,2,5,1),    (1695,'2014-12-25',46,10,3,19,8), (1696,'2014-12-25',3,10,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1697,'2014-12-26',11,10,1,13,3), (1698,'2014-12-26',25,10,2,40,5),  (1699,'2014-12-26',53,10,3,32,9), (1700,'2014-12-26',3,10,4,5,1);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1701,'2014-12-29',1,8,1,5,1),   (1702,'2014-12-29',9,8,2,13,3),  (1703,'2014-12-29',16,8,3,11,4), (1704,'2014-12-29',23,8,4,40,5);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1705,'2014-12-30',44,8,1,19,8), (1706,'2014-12-30',51,8,2,32,9), (1707,'2014-12-30',37,8,3,4,7),  (1708,'2014-12-30',65,8,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1709,'2014-12-31',58,8,1,12,11),(1710,'2014-12-31',1,8,2,5,1),   (1711,'2014-12-31',16,8,3,11,4), (1712,'2014-12-31',30,8,4,34,6);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1713,'2014-12-29',44,1,1,19,8), (1714,'2014-12-29',51,1,2,32,9), (1715,'2014-12-29',65,1,3,2,10),  (1716,'2014-12-29',30,1,4,34,6);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1717,'2014-12-30',1,1,1,5,1),   (1718,'2014-12-30',16,1,2,11,4), (1719,'2014-12-30',58,1,3,12,11), (1720,'2014-12-30',37,1,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1721,'2014-12-31',16,1,1,11,4), (1722,'2014-12-31',23,1,2,40,5), (1723,'2014-12-31',9,1,3,13,3),   (1724,'2014-12-31',44,1,4,19,8);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1725,'2014-12-29',10,9,1,13,3), (1726,'2014-12-29',2,9,2,5,1),   (1727,'2014-12-29',38,9,3,4,7),  (1728,'2014-12-29',66,9,4,2,10);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1729,'2014-12-30',17,9,1,11,4), (1730,'2014-12-30',2,9,2,5,1),   (1731,'2014-12-30',31,9,3,34,6), (1732,'2014-12-30',52,9,4,32,9);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1733,'2014-12-31',45,9,1,19,8), (1734,'2014-12-31',59,9,2,12,11),(1735,'2014-12-31',2,9,3,5,1),   (1736,'2014-12-31',2,9,4,5,1);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1737,'2014-12-29',59,2,1,12,11),(1738,'2014-12-29',17,2,2,11,4), (1739,'2014-12-29',2,2,3,5,1),   (1740,'2014-12-29',2,2,4,5,1);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1741,'2014-12-30',31,2,1,34,6), (1742,'2014-12-30',10,2,2,13,3), (1743,'2014-12-30',17,2,3,11,4), (1744,'2014-12-30',45,2,4,19,8);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1745,'2014-12-31',10,2,1,13,3), (1746,'2014-12-31',38,2,2,4,7),  (1747,'2014-12-31',24,2,3,40,5), (1748,'2014-12-31',45,2,4,19,8);

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1749,'2014-12-29',18,10,1,11,4), (1750,'2014-12-29',60,10,2,12,11), (1751,'2014-12-29',32,10,3,34,6), (1752,'2014-12-29',39,10,4,4,7);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1753,'2014-12-30',11,10,1,13,3), (1754,'2014-12-30',46,10,2,19,8),  (1755,'2014-12-30',3,10,3,5,1),   (1756,'2014-12-30',18,10,4,11,4);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1757,'2014-12-31',3,10,1,5,1),   (1758,'2014-12-31',67,10,2,2,10),  (1759,'2014-12-31',60,10,3,12,11),(1760,'2014-12-31',18,10,4,11,4);




INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1761,'2014-09-01',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1762,'2014-09-03',73,16,5,4,12); 
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1763,'2014-09-05',73,16,5,4,12);



INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1764,'2014-09-08',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1765,'2014-09-10',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1766,'2014-09-12',73,16,5,4,12);

 
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1767,'2014-09-15',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1768,'2014-09-17',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1769,'2014-09-19',73,16,5,4,12); 

 
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1770,'2014-09-22',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1771,'2014-09-24',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1772,'2014-09-26',73,16,5,4,12); 


INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1773,'2014-09-29',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1774,'2014-10-01',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1775,'2014-10-03',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1776,'2014-10-06',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1777,'2014-10-08',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1778,'2014-10-10',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1779,'2014-10-13',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1780,'2014-10-15',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1781,'2014-10-17',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1782,'2014-10-20',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1783,'2014-10-22',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1784,'2014-10-24',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1785,'2014-10-27',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1786,'2014-10-29',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1787,'2014-10-31',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1788,'2014-11-03',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1789,'2014-11-05',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1790,'2014-11-07',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1791,'2014-11-10',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1792,'2014-11-12',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1793,'2014-11-14',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1794,'2014-11-17',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1795,'2014-11-19',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1796,'2014-11-21',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1797,'2014-11-24',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1798,'2014-11-26',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1799,'2014-11-28',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1800,'2014-12-01',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1801,'2014-12-03',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1802,'2014-12-05',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1803,'2014-12-08',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1804,'2014-12-10',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1805,'2014-12-12',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1806,'2014-12-15',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1807,'2014-12-17',73,16,5,4,12);
INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1808,'2014-12-19',73,16,5,4,12); 

INSERT INTO `SCHEDULE` (`id`,`date`,`courseId`,`groupId`, `lessonId`,`roomId`,`teacherId` ) VALUES (1809,'2014-12-22',73,16,5,4,12);

INSERT INTO `NEWS` VALUES (1,'The start of school is the most exciting time of the year for students!\n\nThey want to meet their teachers, catch up with their friends, and begin exploring a whole new world of knowledge. As exciting as these first weeks of school are, your children can\'t do this on their own. They need your help to get readynow and every day. You need to read aloud to young children to reinforce the importance of literacy. You have to be ready to help them when they\'re stuck on homework. You should make sure they have a nutritious lunch every day. You need to build relationships with their teachers so you\'re all working together to provide your children the best learning experience possible. Helping your children with school is one of your most important jobs as a parent. That\'s why the U.S. Department of Education, National PTA, and Parenting have teamed up to bring you Countdown to School Success. This booklet takes you step-by-step through the typical school-year calendar, explaining how you can help your children at home, support them in the classroom, and assist their teachers as they address each of your children\'s unique abilities. We hope your whole family enjoys following this road map to the exciting year ahead.',1,'Educational success'),(2,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',0,'It competiton'),(3,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',0,'Mathematical competiton'),(4,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',0,'Chemistry competition'),(5,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',1,'Something'),(6,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',1,'Interesting'),(7,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',0,'Winners of competition');

update USER set birthday = "1968-8-15 00:00:00" where USER.id=1;
update USER set birthday = "1986-0-2 00:00:00" where USER.id=2;
update USER set birthday = "1972-6-18 00:00:00" where USER.id=3;
update USER set birthday = "1973-11-14 00:00:00" where USER.id=4;
update USER set birthday = "1969-7-25 00:00:00" where USER.id=5;
update USER set birthday = "1976-3-19 00:00:00" where USER.id=6;
update USER set birthday = "1985-7-11 00:00:00" where USER.id=7;
update USER set birthday = "1980-10-7 00:00:00" where USER.id=8;
update USER set birthday = "1977-0-20 00:00:00" where USER.id=9;
update USER set birthday = "1983-0-24 00:00:00" where USER.id=10;
update USER set birthday = "1970-7-1 00:00:00" where USER.id=11;
update USER set birthday = "1967-3-11 00:00:00" where USER.id=12;
update USER set birthday = "1989-7-23 00:00:00" where USER.id=13;
update USER set birthday = "1974-2-3 00:00:00" where USER.id=14;
update USER set birthday = "1976-1-11 00:00:00" where USER.id=15;
update USER set birthday = "1981-7-19 00:00:00" where USER.id=16;
update USER set birthday = "1980-9-24 00:00:00" where USER.id=17;
update USER set birthday = "1986-5-1 00:00:00" where USER.id=18;
update USER set birthday = "1976-4-21 00:00:00" where USER.id=19;
update USER set birthday = "1984-5-7 00:00:00" where USER.id=20;
update USER set birthday = "1968-4-5 00:00:00" where USER.id=21;
update USER set birthday = "1985-0-1 00:00:00" where USER.id=22;
update USER set birthday = "1986-5-5 00:00:00" where USER.id=23;
update USER set birthday = "1985-0-14 00:00:00" where USER.id=24;
update USER set birthday = "1973-8-18 00:00:00" where USER.id=25;
update USER set birthday = "1968-11-8 00:00:00" where USER.id=26;
update USER set birthday = "1988-8-26 00:00:00" where USER.id=27;
update USER set birthday = "1974-4-27 00:00:00" where USER.id=28;
update USER set birthday = "1980-6-9 00:00:00" where USER.id=29;
update USER set birthday = "1975-1-23 00:00:00" where USER.id=30;
update USER set birthday = "1967-7-22 00:00:00" where USER.id=31;
update USER set birthday = "1975-11-12 00:00:00" where USER.id=32;
update USER set birthday = "1987-8-7 00:00:00" where USER.id=33;
update USER set birthday = "1970-6-1 00:00:00" where USER.id=34;
update USER set birthday = "1970-3-12 00:00:00" where USER.id=35;
update USER set birthday = "1976-5-8 00:00:00" where USER.id=36;
update USER set birthday = "1978-4-10 00:00:00" where USER.id=37;
update USER set birthday = "1976-2-4 00:00:00" where USER.id=38;
update USER set birthday = "1977-6-15 00:00:00" where USER.id=39;
update USER set birthday = "1974-2-7 00:00:00" where USER.id=40;
update USER set birthday = "1980-0-15 00:00:00" where USER.id=41;
update USER set birthday = "1965-9-27 00:00:00" where USER.id=42;
update USER set birthday = "1977-5-16 00:00:00" where USER.id=43;
update USER set birthday = "1981-4-26 00:00:00" where USER.id=44;
update USER set birthday = "1969-10-21 00:00:00" where USER.id=45;
update USER set birthday = "1989-3-5 00:00:00" where USER.id=46;
update USER set birthday = "1982-1-22 00:00:00" where USER.id=47;
update USER set birthday = "1976-10-21 00:00:00" where USER.id=48;
update USER set birthday = "1966-5-26 00:00:00" where USER.id=49;
update USER set birthday = "1985-4-14 00:00:00" where USER.id=50;
update USER set birthday = "1972-0-2 00:00:00" where USER.id=51;
update USER set birthday = "1984-5-5 00:00:00" where USER.id=52;
update USER set birthday = "1987-7-8 00:00:00" where USER.id=53;
update USER set birthday = "1967-3-22 00:00:00" where USER.id=54;
update USER set birthday = "1978-9-6 00:00:00" where USER.id=55;
update USER set birthday = "1971-3-16 00:00:00" where USER.id=56;
update USER set birthday = "1987-2-26 00:00:00" where USER.id=57;
update USER set birthday = "1984-11-3 00:00:00" where USER.id=58;
update USER set birthday = "1975-11-2 00:00:00" where USER.id=59;
update USER set birthday = "1970-9-21 00:00:00" where USER.id=60;
update USER set birthday = "1979-0-9 00:00:00" where USER.id=61;
update USER set birthday = "1973-4-1 00:00:00" where USER.id=62;
update USER set birthday = "1989-4-5 00:00:00" where USER.id=63;
update USER set birthday = "1971-0-24 00:00:00" where USER.id=64;
update USER set birthday = "1969-2-6 00:00:00" where USER.id=65;
update USER set birthday = "1973-0-11 00:00:00" where USER.id=66;
update USER set birthday = "1974-3-27 00:00:00" where USER.id=67;
update USER set birthday = "1981-8-2 00:00:00" where USER.id=68;
update USER set birthday = "1981-3-14 00:00:00" where USER.id=69;
update USER set birthday = "1977-2-0 00:00:00" where USER.id=70;
update USER set birthday = "1970-6-20 00:00:00" where USER.id=71;
update USER set birthday = "1968-5-15 00:00:00" where USER.id=72;
update USER set birthday = "1981-4-19 00:00:00" where USER.id=73;
update USER set birthday = "1982-7-3 00:00:00" where USER.id=74;
update USER set birthday = "1974-10-10 00:00:00" where USER.id=75;
update USER set birthday = "1971-5-14 00:00:00" where USER.id=76;
update USER set birthday = "1978-1-23 00:00:00" where USER.id=77;
update USER set birthday = "1976-7-0 00:00:00" where USER.id=78;
update USER set birthday = "1981-1-3 00:00:00" where USER.id=79;
update USER set birthday = "1974-9-19 00:00:00" where USER.id=80;
update USER set birthday = "1975-6-18 00:00:00" where USER.id=81;
update USER set birthday = "1989-8-18 00:00:00" where USER.id=82;
update USER set birthday = "1973-1-1 00:00:00" where USER.id=83;
update USER set birthday = "1974-3-6 00:00:00" where USER.id=84;
update USER set birthday = "1982-10-18 00:00:00" where USER.id=85;
update USER set birthday = "1968-7-10 00:00:00" where USER.id=86;
update USER set birthday = "1971-0-2 00:00:00" where USER.id=87;
update USER set birthday = "1981-11-17 00:00:00" where USER.id=88;
update USER set birthday = "1975-6-10 00:00:00" where USER.id=89;
update USER set birthday = "1975-3-1 00:00:00" where USER.id=90;
update USER set birthday = "1977-1-21 00:00:00" where USER.id=91;
update USER set birthday = "1987-5-22 00:00:00" where USER.id=92;
update USER set birthday = "1975-9-13 00:00:00" where USER.id=93;
update USER set birthday = "1983-8-2 00:00:00" where USER.id=94;
update USER set birthday = "1976-7-22 00:00:00" where USER.id=95;
update USER set birthday = "1977-1-23 00:00:00" where USER.id=96;
update USER set birthday = "1986-0-17 00:00:00" where USER.id=97;
update USER set birthday = "1978-4-23 00:00:00" where USER.id=98;
update USER set birthday = "1968-9-7 00:00:00" where USER.id=99;
update USER set birthday = "1966-7-11 00:00:00" where USER.id=100;

update USER set birthday = "2003-7-2 00:00:00" where USER.id=101;
update USER set birthday = "2003-2-27 00:00:00" where USER.id=102;
update USER set birthday = "2003-7-23 00:00:00" where USER.id=103;
update USER set birthday = "2003-2-12 00:00:00" where USER.id=104;
update USER set birthday = "2003-10-14 00:00:00" where USER.id=105;
update USER set birthday = "2003-4-18 00:00:00" where USER.id=106;
update USER set birthday = "2003-1-26 00:00:00" where USER.id=107;
update USER set birthday = "2003-3-11 00:00:00" where USER.id=108;
update USER set birthday = "2003-2-10 00:00:00" where USER.id=109;
update USER set birthday = "2003-7-8 00:00:00" where USER.id=110;
update USER set birthday = "2003-6-26 00:00:00" where USER.id=111;
update USER set birthday = "2003-8-18 00:00:00" where USER.id=112;
update USER set birthday = "2003-4-2 00:00:00" where USER.id=113;
update USER set birthday = "2003-3-5 00:00:00" where USER.id=114;
update USER set birthday = "2003-9-12 00:00:00" where USER.id=115;
update USER set birthday = "2003-1-21 00:00:00" where USER.id=116;
update USER set birthday = "2003-0-4 00:00:00" where USER.id=117;
update USER set birthday = "2003-3-6 00:00:00" where USER.id=118;
update USER set birthday = "2003-4-27 00:00:00" where USER.id=119;
update USER set birthday = "2003-6-1 00:00:00" where USER.id=120;
update USER set birthday = "2003-6-19 00:00:00" where USER.id=121;
update USER set birthday = "2003-6-22 00:00:00" where USER.id=122;

update USER set birthday = "2002-0-26 00:00:00" where USER.id=123;
update USER set birthday = "2002-1-7 00:00:00" where USER.id=124;
update USER set birthday = "2002-10-25 00:00:00" where USER.id=125;
update USER set birthday = "2002-1-13 00:00:00" where USER.id=126;
update USER set birthday = "2002-7-26 00:00:00" where USER.id=127;
update USER set birthday = "2002-0-20 00:00:00" where USER.id=128;
update USER set birthday = "2002-6-25 00:00:00" where USER.id=129;
update USER set birthday = "2002-2-21 00:00:00" where USER.id=130;
update USER set birthday = "2002-8-7 00:00:00" where USER.id=131;
update USER set birthday = "2002-10-10 00:00:00" where USER.id=132;
update USER set birthday = "2002-1-8 00:00:00" where USER.id=133;
update USER set birthday = "2002-0-8 00:00:00" where USER.id=134;
update USER set birthday = "2002-8-12 00:00:00" where USER.id=135;
update USER set birthday = "2002-4-20 00:00:00" where USER.id=136;
update USER set birthday = "2002-9-6 00:00:00" where USER.id=137;
update USER set birthday = "2002-9-4 00:00:00" where USER.id=138;
update USER set birthday = "2002-7-3 00:00:00" where USER.id=139;
update USER set birthday = "2002-8-9 00:00:00" where USER.id=140;
update USER set birthday = "2002-10-20 00:00:00" where USER.id=141;
update USER set birthday = "2002-9-6 00:00:00" where USER.id=142;
update USER set birthday = "2002-9-17 00:00:00" where USER.id=143;
update USER set birthday = "2002-0-20 00:00:00" where USER.id=144;

update USER set birthday = "2001-4-4 00:00:00" where USER.id=145;
update USER set birthday = "2001-0-15 00:00:00" where USER.id=146;
update USER set birthday = "2001-8-6 00:00:00" where USER.id=147;
update USER set birthday = "2001-5-7 00:00:00" where USER.id=148;
update USER set birthday = "2001-10-2 00:00:00" where USER.id=149;
update USER set birthday = "2001-7-18 00:00:00" where USER.id=150;
update USER set birthday = "2001-9-19 00:00:00" where USER.id=151;
update USER set birthday = "2001-4-12 00:00:00" where USER.id=152;
update USER set birthday = "2001-10-8 00:00:00" where USER.id=153;
update USER set birthday = "2001-7-15 00:00:00" where USER.id=154;
update USER set birthday = "2001-1-19 00:00:00" where USER.id=155;
update USER set birthday = "2001-1-4 00:00:00" where USER.id=156;
update USER set birthday = "2001-10-10 00:00:00" where USER.id=157;
update USER set birthday = "2001-5-18 00:00:00" where USER.id=158;
update USER set birthday = "2001-0-6 00:00:00" where USER.id=159;
update USER set birthday = "2001-6-16 00:00:00" where USER.id=160;
update USER set birthday = "2001-5-2 00:00:00" where USER.id=161;
update USER set birthday = "2001-9-6 00:00:00" where USER.id=162;
update USER set birthday = "2001-5-2 00:00:00" where USER.id=163;
update USER set birthday = "2001-5-27 00:00:00" where USER.id=164;
update USER set birthday = "2001-11-19 00:00:00" where USER.id=165;
update USER set birthday = "2001-4-4 00:00:00" where USER.id=166;

update USER set birthday = "2000-8-2 00:00:00" where USER.id=167;
update USER set birthday = "2000-6-1 00:00:00" where USER.id=168;
update USER set birthday = "2000-1-13 00:00:00" where USER.id=169;
update USER set birthday = "2000-9-17 00:00:00" where USER.id=170;
update USER set birthday = "2000-3-15 00:00:00" where USER.id=171;
update USER set birthday = "2000-8-21 00:00:00" where USER.id=172;
update USER set birthday = "2000-9-24 00:00:00" where USER.id=173;
update USER set birthday = "2000-8-20 00:00:00" where USER.id=174;
update USER set birthday = "2000-5-1 00:00:00" where USER.id=175;
update USER set birthday = "2000-7-7 00:00:00" where USER.id=176;
update USER set birthday = "2000-8-11 00:00:00" where USER.id=177;
update USER set birthday = "2000-7-20 00:00:00" where USER.id=178;
update USER set birthday = "2000-6-23 00:00:00" where USER.id=179;
update USER set birthday = "2000-3-18 00:00:00" where USER.id=180;
update USER set birthday = "2000-10-15 00:00:00" where USER.id=181;
update USER set birthday = "2000-3-0 00:00:00" where USER.id=182;
update USER set birthday = "2000-9-6 00:00:00" where USER.id=183;
update USER set birthday = "2000-2-22 00:00:00" where USER.id=184;
update USER set birthday = "2000-6-3 00:00:00" where USER.id=185;
update USER set birthday = "2000-9-23 00:00:00" where USER.id=186;
update USER set birthday = "2000-5-13 00:00:00" where USER.id=187;
update USER set birthday = "2000-6-3 00:00:00" where USER.id=188;

update USER set birthday = "1999-7-2 00:00:00" where USER.id=189;
update USER set birthday = "1999-11-3 00:00:00" where USER.id=190;
update USER set birthday = "1999-9-26 00:00:00" where USER.id=191;
update USER set birthday = "1999-7-9 00:00:00" where USER.id=192;
update USER set birthday = "1999-11-3 00:00:00" where USER.id=193;
update USER set birthday = "1999-10-8 00:00:00" where USER.id=194;
update USER set birthday = "1999-9-11 00:00:00" where USER.id=195;
update USER set birthday = "1999-2-20 00:00:00" where USER.id=196;
update USER set birthday = "1999-5-21 00:00:00" where USER.id=197;
update USER set birthday = "1999-3-23 00:00:00" where USER.id=198;
update USER set birthday = "1999-10-17 00:00:00" where USER.id=199;
update USER set birthday = "1999-11-21 00:00:00" where USER.id=200;
update USER set birthday = "1999-3-6 00:00:00" where USER.id=201;
update USER set birthday = "1999-7-16 00:00:00" where USER.id=202;
update USER set birthday = "1999-1-4 00:00:00" where USER.id=203;
update USER set birthday = "1999-4-19 00:00:00" where USER.id=204;
update USER set birthday = "1999-6-17 00:00:00" where USER.id=205;
update USER set birthday = "1999-1-15 00:00:00" where USER.id=206;
update USER set birthday = "1999-0-3 00:00:00" where USER.id=207;
update USER set birthday = "1999-4-17 00:00:00" where USER.id=208;
update USER set birthday = "1999-5-6 00:00:00" where USER.id=209;
update USER set birthday = "1999-6-21 00:00:00" where USER.id=210;

update USER set birthday = "1998-9-12 00:00:00" where USER.id=211;
update USER set birthday = "1998-5-15 00:00:00" where USER.id=212;
update USER set birthday = "1998-10-2 00:00:00" where USER.id=213;
update USER set birthday = "1998-7-21 00:00:00" where USER.id=214;
update USER set birthday = "1998-0-22 00:00:00" where USER.id=215;
update USER set birthday = "1998-2-20 00:00:00" where USER.id=216;
update USER set birthday = "1998-4-12 00:00:00" where USER.id=217;
update USER set birthday = "1998-3-13 00:00:00" where USER.id=218;
update USER set birthday = "1998-11-2 00:00:00" where USER.id=219;
update USER set birthday = "1998-1-13 00:00:00" where USER.id=220;
update USER set birthday = "1998-9-21 00:00:00" where USER.id=221;
update USER set birthday = "1998-1-4 00:00:00" where USER.id=222;
update USER set birthday = "1998-8-9 00:00:00" where USER.id=223;
update USER set birthday = "1998-9-3 00:00:00" where USER.id=224;
update USER set birthday = "1998-1-27 00:00:00" where USER.id=225;
update USER set birthday = "1998-0-0 00:00:00" where USER.id=226;
update USER set birthday = "1998-7-15 00:00:00" where USER.id=227;
update USER set birthday = "1998-1-11 00:00:00" where USER.id=228;
update USER set birthday = "1998-7-6 00:00:00" where USER.id=229;
update USER set birthday = "1998-9-8 00:00:00" where USER.id=230;
update USER set birthday = "1998-1-8 00:00:00" where USER.id=231;
update USER set birthday = "1998-4-6 00:00:00" where USER.id=232;

update USER set birthday = "1997-3-2 00:00:00" where USER.id=233;
update USER set birthday = "1997-11-1 00:00:00" where USER.id=234;
update USER set birthday = "1997-7-21 00:00:00" where USER.id=235;
update USER set birthday = "1997-5-1 00:00:00" where USER.id=236;
update USER set birthday = "1997-6-25 00:00:00" where USER.id=237;
update USER set birthday = "1997-11-2 00:00:00" where USER.id=238;
update USER set birthday = "1997-1-3 00:00:00" where USER.id=239;
update USER set birthday = "1997-3-9 00:00:00" where USER.id=240;
update USER set birthday = "1997-7-0 00:00:00" where USER.id=241;
update USER set birthday = "1997-5-18 00:00:00" where USER.id=242;
update USER set birthday = "1997-2-15 00:00:00" where USER.id=243;
update USER set birthday = "1997-10-0 00:00:00" where USER.id=244;
update USER set birthday = "1997-8-2 00:00:00" where USER.id=245;
update USER set birthday = "1997-8-22 00:00:00" where USER.id=246;
update USER set birthday = "1997-3-6 00:00:00" where USER.id=247;
update USER set birthday = "1997-5-1 00:00:00" where USER.id=248;
update USER set birthday = "1997-9-25 00:00:00" where USER.id=249;
update USER set birthday = "1997-7-16 00:00:00" where USER.id=250;
update USER set birthday = "1997-3-8 00:00:00" where USER.id=251;
update USER set birthday = "1997-8-0 00:00:00" where USER.id=252;
update USER set birthday = "1997-9-25 00:00:00" where USER.id=253;
update USER set birthday = "1997-8-16 00:00:00" where USER.id=254;

update USER set birthday = "2003-8-10 00:00:00" where USER.id=255;
update USER set birthday = "2003-0-16 00:00:00" where USER.id=256;
update USER set birthday = "2003-1-6 00:00:00" where USER.id=257;
update USER set birthday = "2003-3-4 00:00:00" where USER.id=258;
update USER set birthday = "2003-10-7 00:00:00" where USER.id=259;
update USER set birthday = "2003-9-22 00:00:00" where USER.id=260;
update USER set birthday = "2003-4-13 00:00:00" where USER.id=261;
update USER set birthday = "2003-0-23 00:00:00" where USER.id=262;
update USER set birthday = "2003-10-0 00:00:00" where USER.id=263;
update USER set birthday = "2003-4-17 00:00:00" where USER.id=264;
update USER set birthday = "2003-0-14 00:00:00" where USER.id=265;
update USER set birthday = "2003-10-7 00:00:00" where USER.id=266;
update USER set birthday = "2003-1-4 00:00:00" where USER.id=267;
update USER set birthday = "2003-5-16 00:00:00" where USER.id=268;
update USER set birthday = "2003-10-1 00:00:00" where USER.id=269;
update USER set birthday = "2003-4-0 00:00:00" where USER.id=270;
update USER set birthday = "2003-0-4 00:00:00" where USER.id=271;
update USER set birthday = "2003-4-25 00:00:00" where USER.id=272;
update USER set birthday = "2003-8-9 00:00:00" where USER.id=273;
update USER set birthday = "2003-8-0 00:00:00" where USER.id=274;
update USER set birthday = "2003-10-8 00:00:00" where USER.id=275;
update USER set birthday = "2003-9-22 00:00:00" where USER.id=276;

update USER set birthday = "2002-11-3 00:00:00" where USER.id=277;
update USER set birthday = "2002-6-7 00:00:00" where USER.id=278;
update USER set birthday = "2002-5-5 00:00:00" where USER.id=279;
update USER set birthday = "2002-11-25 00:00:00" where USER.id=280;
update USER set birthday = "2002-0-16 00:00:00" where USER.id=281;
update USER set birthday = "2002-5-13 00:00:00" where USER.id=282;
update USER set birthday = "2002-2-3 00:00:00" where USER.id=283;
update USER set birthday = "2002-2-15 00:00:00" where USER.id=284;
update USER set birthday = "2002-3-27 00:00:00" where USER.id=285;
update USER set birthday = "2002-0-11 00:00:00" where USER.id=286;
update USER set birthday = "2002-0-24 00:00:00" where USER.id=287;
update USER set birthday = "2002-8-22 00:00:00" where USER.id=288;
update USER set birthday = "2002-8-6 00:00:00" where USER.id=289;
update USER set birthday = "2002-8-4 00:00:00" where USER.id=290;
update USER set birthday = "2002-1-6 00:00:00" where USER.id=291;
update USER set birthday = "2002-2-16 00:00:00" where USER.id=292;
update USER set birthday = "2002-8-20 00:00:00" where USER.id=293;
update USER set birthday = "2002-1-25 00:00:00" where USER.id=294;
update USER set birthday = "2002-2-20 00:00:00" where USER.id=295;
update USER set birthday = "2002-1-15 00:00:00" where USER.id=296;
update USER set birthday = "2002-2-1 00:00:00" where USER.id=297;
update USER set birthday = "2002-1-13 00:00:00" where USER.id=298;

update USER set birthday = "2001-3-17 00:00:00" where USER.id=299;
update USER set birthday = "2001-8-12 00:00:00" where USER.id=300;
update USER set birthday = "2001-11-1 00:00:00" where USER.id=301;
update USER set birthday = "2001-4-2 00:00:00" where USER.id=302;
update USER set birthday = "2001-9-11 00:00:00" where USER.id=303;
update USER set birthday = "2001-10-16 00:00:00" where USER.id=304;
update USER set birthday = "2001-5-4 00:00:00" where USER.id=305;
update USER set birthday = "2001-4-25 00:00:00" where USER.id=306;
update USER set birthday = "2001-2-24 00:00:00" where USER.id=307;
update USER set birthday = "2001-6-18 00:00:00" where USER.id=308;
update USER set birthday = "2001-4-11 00:00:00" where USER.id=309;
update USER set birthday = "2001-10-9 00:00:00" where USER.id=310;
update USER set birthday = "2001-4-11 00:00:00" where USER.id=311;
update USER set birthday = "2001-0-6 00:00:00" where USER.id=312;
update USER set birthday = "2001-2-11 00:00:00" where USER.id=313;
update USER set birthday = "2001-7-8 00:00:00" where USER.id=314;
update USER set birthday = "2001-9-3 00:00:00" where USER.id=315;
update USER set birthday = "2001-6-24 00:00:00" where USER.id=316;
update USER set birthday = "2001-7-23 00:00:00" where USER.id=317;
update USER set birthday = "2001-6-17 00:00:00" where USER.id=318;
update USER set birthday = "2001-6-24 00:00:00" where USER.id=319;
update USER set birthday = "2001-6-25 00:00:00" where USER.id=320;

update USER set birthday = "2000-7-12 00:00:00" where USER.id=321;
update USER set birthday = "2000-0-21 00:00:00" where USER.id=322;
update USER set birthday = "2000-10-2 00:00:00" where USER.id=323;
update USER set birthday = "2000-7-26 00:00:00" where USER.id=324;
update USER set birthday = "2000-5-10 00:00:00" where USER.id=325;
update USER set birthday = "2000-4-26 00:00:00" where USER.id=326;
update USER set birthday = "2000-7-16 00:00:00" where USER.id=327;
update USER set birthday = "2000-10-3 00:00:00" where USER.id=328;
update USER set birthday = "2000-2-20 00:00:00" where USER.id=329;
update USER set birthday = "2000-7-21 00:00:00" where USER.id=330;
update USER set birthday = "2000-5-1 00:00:00" where USER.id=331;
update USER set birthday = "2000-6-5 00:00:00" where USER.id=332;
update USER set birthday = "2000-9-25 00:00:00" where USER.id=333;
update USER set birthday = "2000-7-0 00:00:00" where USER.id=334;
update USER set birthday = "2000-5-8 00:00:00" where USER.id=335;
update USER set birthday = "2000-1-6 00:00:00" where USER.id=336;
update USER set birthday = "2000-11-7 00:00:00" where USER.id=337;
update USER set birthday = "2000-1-20 00:00:00" where USER.id=338;
update USER set birthday = "2000-0-16 00:00:00" where USER.id=339;
update USER set birthday = "2000-8-13 00:00:00" where USER.id=340;
update USER set birthday = "2000-4-22 00:00:00" where USER.id=341;
update USER set birthday = "2000-2-3 00:00:00" where USER.id=342;

update USER set birthday = "1999-2-1 00:00:00" where USER.id=343;
update USER set birthday = "1999-7-23 00:00:00" where USER.id=344;
update USER set birthday = "1999-2-9 00:00:00" where USER.id=345;
update USER set birthday = "1999-7-25 00:00:00" where USER.id=346;
update USER set birthday = "1999-11-18 00:00:00" where USER.id=347;
update USER set birthday = "1999-9-12 00:00:00" where USER.id=348;
update USER set birthday = "1999-2-25 00:00:00" where USER.id=349;
update USER set birthday = "1999-6-1 00:00:00" where USER.id=350;
update USER set birthday = "1999-1-23 00:00:00" where USER.id=351;
update USER set birthday = "1999-7-0 00:00:00" where USER.id=352;
update USER set birthday = "1999-3-21 00:00:00" where USER.id=353;
update USER set birthday = "1999-4-22 00:00:00" where USER.id=354;
update USER set birthday = "1999-4-0 00:00:00" where USER.id=355;
update USER set birthday = "1999-1-15 00:00:00" where USER.id=356;
update USER set birthday = "1999-4-4 00:00:00" where USER.id=357;
update USER set birthday = "1999-0-0 00:00:00" where USER.id=358;
update USER set birthday = "1999-5-9 00:00:00" where USER.id=359;
update USER set birthday = "1999-2-12 00:00:00" where USER.id=360;
update USER set birthday = "1999-6-7 00:00:00" where USER.id=361;
update USER set birthday = "1999-4-19 00:00:00" where USER.id=362;
update USER set birthday = "1999-8-8 00:00:00" where USER.id=363;
update USER set birthday = "1999-9-12 00:00:00" where USER.id=364;

update USER set birthday = "1998-6-22 00:00:00" where USER.id=365;
update USER set birthday = "1998-9-2 00:00:00" where USER.id=366;
update USER set birthday = "1998-10-26 00:00:00" where USER.id=367;
update USER set birthday = "1998-8-24 00:00:00" where USER.id=368;
update USER set birthday = "1998-8-12 00:00:00" where USER.id=369;
update USER set birthday = "1998-4-21 00:00:00" where USER.id=370;
update USER set birthday = "1998-6-10 00:00:00" where USER.id=371;
update USER set birthday = "1998-1-25 00:00:00" where USER.id=372;
update USER set birthday = "1998-8-9 00:00:00" where USER.id=373;
update USER set birthday = "1998-2-6 00:00:00" where USER.id=374;
update USER set birthday = "1998-1-27 00:00:00" where USER.id=375;
update USER set birthday = "1998-0-24 00:00:00" where USER.id=376;
update USER set birthday = "1998-11-18 00:00:00" where USER.id=377;
update USER set birthday = "1998-8-18 00:00:00" where USER.id=378;
update USER set birthday = "1998-11-3 00:00:00" where USER.id=379;
update USER set birthday = "1998-2-6 00:00:00" where USER.id=380;
update USER set birthday = "1998-5-14 00:00:00" where USER.id=381;
update USER set birthday = "1998-7-27 00:00:00" where USER.id=382;
update USER set birthday = "1998-4-0 00:00:00" where USER.id=383;
update USER set birthday = "1998-7-26 00:00:00" where USER.id=384;
update USER set birthday = "1998-3-20 00:00:00" where USER.id=385;
update USER set birthday = "1998-3-2 00:00:00" where USER.id=386;

update USER set birthday = "1997-0-20 00:00:00" where USER.id=387;
update USER set birthday = "1997-11-6 00:00:00" where USER.id=388;
update USER set birthday = "1997-5-16 00:00:00" where USER.id=389;
update USER set birthday = "1997-8-23 00:00:00" where USER.id=390;
update USER set birthday = "1997-6-12 00:00:00" where USER.id=391;
update USER set birthday = "1997-1-14 00:00:00" where USER.id=392;
update USER set birthday = "1997-5-12 00:00:00" where USER.id=393;
update USER set birthday = "1997-5-6 00:00:00" where USER.id=394;
update USER set birthday = "1997-7-13 00:00:00" where USER.id=395;
update USER set birthday = "1997-9-18 00:00:00" where USER.id=396;
update USER set birthday = "1997-5-15 00:00:00" where USER.id=397;
update USER set birthday = "1997-10-4 00:00:00" where USER.id=398;
update USER set birthday = "1997-10-7 00:00:00" where USER.id=399;
update USER set birthday = "1997-5-20 00:00:00" where USER.id=400;

