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

INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (1,"director@gmail.com","Odette","Clemons","director","2014-02-08 05:08:11",1),(2,"headteacher@gmail.com","Lila","Patel","headteacher","2014-03-11 13:11:07",2),(3,"egestas.Fusce.aliquet@vitae.net","Amethyst","Valentine","mauris.","2014-01-20 05:41:11",3),(4,"ac.mi.eleifend@Nullaeu.com","Gail","Santiago","augue","2013-12-19 11:49:05",1),(5,"quis@interdumfeugiat.co.uk","Scarlet","Dickerson","et","2014-08-16 01:27:20",3),(6,"sollicitudin@Cras.net","Derek","Cummings","Proin","2014-02-06 11:08:05",2),(7,"a.facilisis@molestie.ca","Natalie","Montoya","Integer","2013-12-29 06:04:11",3),(8,"malesuada.fringilla@orci.edu","Declan","Joyner","urna.","2014-03-09 22:04:50",3),(9,"Fusce@hendreritconsectetuercursus.co.uk","Daniel","Bryan","mus.","2014-09-22 22:43:17",3),(10,"teacher@gmail.com","Hyatt","Wilkerson","teacher","2013-11-25 04:47:05",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (11,"convallis@mattis.org","Dakota","Bradley","erat,","2014-07-07 00:25:40",3),(12,"felis.orci.adipiscing@ornare.ca","Flynn","Gibson","lacinia","2014-03-30 17:14:21",3),(13,"elementum.at.egestas@ornarelibero.co.uk","Giselle","Sherman","dui","2014-09-29 22:37:33",2),(14,"pharetra.felis@sitamet.org","Audra","Warren","mi","2013-12-17 06:48:15",3),(15,"metus.In@necleo.co.uk","Ciaran","Contreras","aliquet","2014-04-01 05:44:08",2),(16,"et.euismod.et@tristique.net","Celeste","Mann","sollicitudin","2014-07-14 11:08:45",2),(17,"nisi.Mauris@Maurisquis.org","Ross","Dickerson","eget","2014-09-30 02:13:56",2),(18,"bibendum.fermentum.metus@DonecestNunc.edu","Bruce","Heath","a,","2013-11-19 13:38:07",2),(19,"purus@eu.com","Camden","Lee","enim.","2014-02-17 08:24:07",3),(20,"Curabitur.dictum.Phasellus@non.com","Gloria","Atkins","ut","2014-06-18 01:48:09",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (21,"sed.orci.lobortis@acmattisvelit.ca","Calvin","Burns","sem","2014-05-13 12:40:46",3),(22,"purus.gravida.sagittis@est.co.uk","Lillian","Harris","sem","2014-04-10 19:39:50",2),(23,"dictum.Proin.eget@pedeet.co.uk","Rebekah","Gutierrez","posuere","2013-12-10 21:54:22",3),(24,"adipiscing.lobortis.risus@ad.co.uk","Nasim","Ford","non","2014-07-26 04:23:28",1),(25,"aliquet@Vivamussit.net","Benjamin","Shields","adipiscing","2014-09-26 20:32:55",3),(26,"purus@auguescelerisque.org","Geraldine","Bennett","elit.","2014-05-10 14:02:20",1),(27,"Aliquam.nisl@liberomauris.ca","Meredith","Coffey","dictum","2014-04-10 12:38:31",2),(28,"neque@orciinconsequat.ca","Nayda","Lott","vitae,","2014-09-14 22:05:51",3),(29,"a.malesuada@varius.net","Adele","Fry","venenatis","2014-07-27 22:23:31",1),(30,"Nunc@arcuVestibulumante.edu","Chancellor","Palmer","ullamcorper.","2014-05-05 15:18:34",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (31,"turpis.egestas.Aliquam@nisl.edu","Tatum","Collins","magna.","2014-01-12 11:24:07",3),(32,"odio.a.purus@ridiculusmusAenean.edu","Griffith","Fuentes","enim","2014-02-27 17:16:21",1),(33,"purus.ac.tellus@ante.co.uk","Elliott","Harris","ullamcorper","2014-06-24 12:48:51",2),(34,"ligula.tortor.dictum@luctusetultrices.com","Igor","Sanchez","feugiat","2014-09-30 15:30:46",1),(35,"ridiculus@enim.ca","Quon","Campos","adipiscing,","2014-03-02 20:31:24",3),(36,"blandit.viverra@iaculis.net","Keane","Dennis","eget","2014-02-06 08:20:24",3),(37,"Suspendisse.non@faucibusorci.org","Alma","Calhoun","malesuada","2014-04-13 14:03:10",1),(38,"In.scelerisque@blanditenim.edu","Danielle","Mitchell","non","2014-10-06 05:32:34",1),(39,"Donec@a.org","Bell","Cross","Nunc","2014-07-25 14:08:58",1),(40,"Phasellus.libero@volutpatNulladignissim.ca","Cadman","Burt","eget,","2014-08-08 09:44:32",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (41,"gravida@quisturpisvitae.ca","Quentin","Cross","Duis","2014-09-19 08:54:22",1),(42,"rhoncus.id.mollis@acfeugiat.net","Kuame","Harrington","sit","2014-08-07 09:14:56",2),(43,"elit.pellentesque@semper.edu","Madeson","Holder","Curabitur","2014-03-09 22:35:27",3),(44,"interdum.ligula@eulacus.com","Cameron","Holder","massa","2014-10-01 08:03:04",2),(45,"Aenean.euismod.mauris@musAeneaneget.com","Xenos","Bruce","ut,","2013-12-04 00:35:28",2),(46,"lectus.Nullam.suscipit@Duis.net","Nelle","Glass","malesuada","2013-12-30 02:55:15",3),(47,"ut.sem@lobortistellusjusto.ca","Bert","Contreras","mollis","2014-02-20 08:56:49",3),(48,"Morbi.quis.urna@Aeneanegestas.edu","Cain","Neal","eget","2014-01-30 15:29:51",1),(49,"vitae@ligulaconsectetuerrhoncus.edu","Ashton","Gilliam","sed","2014-08-22 15:01:43",2),(50,"Maecenas@egetmollislectus.ca","Denton","Ware","Nullam","2014-04-24 03:13:16",1);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (51,"Phasellus.elit.pede@faucibusutnulla.org","Celeste","Dillon","auctor","2014-06-15 06:20:35",2),(52,"risus.Donec@tincidunt.net","Eden","Wade","velit","2014-05-03 12:09:08",3),(53,"fringilla.ornare@auctornonfeugiat.com","Ronan","Lynn","augue","2014-01-25 08:32:24",1),(54,"ornare@Curabitur.ca","Ivy","Hickman","Vestibulum","2014-10-10 14:24:01",1),(55,"Lorem@anteipsum.net","Kimberly","Shaw","libero.","2014-02-26 02:42:39",2),(56,"sit.amet@metusurna.org","Avram","Bowen","lorem,","2014-04-22 03:03:21",1),(57,"mauris.Integer.sem@arcuSedeu.com","Uriel","Lindsay","pede.","2014-10-12 21:24:04",3),(58,"Sed@Quisqueornaretortor.edu","Ivana","Hall","non","2014-05-11 16:45:30",1),(59,"amet@est.co.uk","Xyla","Salinas","pede.","2013-12-18 09:45:35",1),(60,"fringilla.ornare.placerat@musAeneaneget.org","Bethany","Rosales","enim.","2014-03-29 15:37:01",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (61,"nulla@idantedictum.net","Idola","Hoffman","sem","2014-09-30 04:47:58",3),(62,"Integer@Aeneansed.edu","Malcolm","Zimmerman","cursus","2014-02-15 11:23:54",2),(63,"enim.consequat@eleifend.co.uk","Chaim","Nolan","Vestibulum","2014-10-29 15:39:57",1),(64,"in.consectetuer@sollicitudinorci.net","Hilel","Kirk","ante","2014-09-27 12:16:18",1),(65,"egestas.Aliquam@arcu.edu","Kyra","Rios","volutpat","2014-03-03 22:07:05",3),(66,"turpis.non@aliquamiaculislacus.org","Unity","Petty","ante","2013-12-25 19:17:36",2),(67,"Cras.vulputate.velit@ipsum.co.uk","Quyn","Bush","felis.","2014-02-11 21:47:48",2),(68,"lobortis.nisi@Proinmi.ca","Judith","Conner","facilisis","2013-11-18 07:30:54",1),(69,"tortor.Nunc@sed.edu","Charlotte","Spencer","elit.","2014-03-14 00:51:02",3),(70,"consequat.purus.Maecenas@augue.co.uk","Dylan","Chase","facilisis,","2014-08-27 12:15:21",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (71,"hendrerit@sitamet.ca","Keelie","York","viverra.","2014-03-26 10:33:28",2),(72,"mauris@massalobortisultrices.net","Isaac","Peters","blandit","2014-09-21 23:05:25",3),(73,"Duis.at@nasceturridiculus.net","Marsden","Lyons","ligula.","2014-08-16 03:07:06",3),(74,"dolor.Quisque@ut.edu","Dexter","Leblanc","quam","2014-06-06 20:09:02",2),(75,"malesuada.ut.sem@urnajusto.edu","Emily","Freeman","dolor.","2014-03-08 10:22:02",2),(76,"elementum.lorem@estMauris.co.uk","Forrest","Livingston","Nulla","2014-04-17 08:36:49",1),(77,"elementum.at@non.net","Stephanie","Roberts","tellus","2014-09-02 12:54:10",1),(78,"Nulla@vitae.net","Avram","Hull","elit","2013-12-07 13:51:47",1),(79,"volutpat@maurisutmi.com","Michelle","Ewing","ante","2014-02-06 09:26:55",3),(80,"parent@gmail.com","Jolie","Richmond","parent","2014-03-20 23:55:02",3);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (81,"mollis.lectus@imperdiet.com","Lucy","Battle","iaculis","2014-03-27 02:01:48",2),(82,"ac.turpis.egestas@velpede.ca","Tasha","Goodman","Nulla","2014-05-17 04:36:03",2),(83,"euismod.in@nectempusscelerisque.com","Gavin","Sweeney","mollis","2014-03-29 13:10:10",3),(84,"ut.quam@facilisisnon.edu","Ezekiel","Mckay","mauris","2013-12-13 15:38:47",3),(85,"aliquam@et.com","Uriah","George","venenatis","2014-05-26 03:17:15",1),(86,"feugiat.placerat@dolorFuscemi.net","Alec","Oliver","elementum","2014-04-11 16:21:52",2),(87,"turpis.egestas.Aliquam@Donec.co.uk","Logan","Conrad","turpis","2014-06-15 17:47:02",3),(88,"amet.consectetuer@Aeneaneuismodmauris.ca","Chaney","Mccray","risus","2013-11-12 17:33:06",1),(89,"magna.Sed@nequesed.edu","Ivan","Murray","sit","2014-09-30 10:54:52",1),(90,"Proin.mi.Aliquam@sollicitudina.org","Octavia","Cash","metus","2014-04-01 03:47:51",2);
INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (91,"Donec.non.justo@elitpellentesque.edu","Wayne","Alvarado","dolor","2014-04-30 22:25:27",1),(92,"non.enim.Mauris@risusDuis.com","Kay","Finch","faucibus","2014-03-04 15:32:45",2),(93,"faucibus@MaurisnullaInteger.co.uk","Sacha","Cain","arcu.","2014-07-29 07:44:40",3),(94,"Curabitur.ut.odio@etultricesposuere.ca","Shoshana","Drake","tristique","2014-01-31 06:31:43",3),(95,"mauris@atvelit.com","Lesley","Reeves","sollicitudin","2014-09-07 11:48:31",1),(96,"pellentesque.a@Nullafacilisis.com","Deanna","Shepherd","lacus.","2013-11-09 08:04:44",3),(97,"erat@erat.edu","Dolan","Rosales","lorem","2013-11-03 12:02:30",1),(98,"mi@sit.ca","Aristotle","Carpenter","hendrerit.","2014-02-17 19:00:05",1),(99,"ridiculus.mus.Donec@loremfringilla.net","Lillith","Leblanc","tincidunt","2014-08-25 10:01:37",1),(100,"mus.Proin.vel@interdum.net","Mannix","Valencia","arcu.","2013-11-13 01:32:26",2);

INSERT INTO `USER` (`id`,`email`,`firstName`,`lastName`,`password`,`registration`,`sex`) VALUES (101,"amet.lorem.semper@aliquet.com","Jolene","Santiago","eros","2014-07-24 09:37:28",2),(102,"et@sedliberoProin.ca","Felix","Summers","dignissim","2014-01-10 15:27:50",2),(103,"turpis.In.condimentum@vitaeodio.co.uk","Marah","Parks","molestie","2014-06-09 02:21:14",2),(104,"eleifend.non.dapibus@viverraMaecenasiaculis.edu","Lance","Hurley","et","2013-12-07 00:39:46",1),(105,"student@gmail.com","Linus","Torvalds","student","2014-02-04 17:02:34",2),(106,"placerat@convallis.net","Inga","Valentine","elit","2014-08-20 04:20:40",1),(107,"aliquam.eros.turpis@penatibus.ca","Igor","Perkins","Vivamus","2013-12-30 03:00:30",3),(108,"Cras@lorem.ca","Quamar","Lyons","neque","2014-09-06 04:25:40",1),(109,"Phasellus.dolor.elit@Quisquenonummyipsum.net","Kermit","Conway","rutrum.","2014-01-03 12:45:06",2),(110,"nec.tempus@nonantebibendum.net","Bertha","Guerra","enim","2014-08-31 23:11:07",3);
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

INSERT INTO `COURSE` (`id`,`additional`,`coeficient`,`courseName`,`groupNumber`,`price`) VALUES (1,0,1,"Algebra",5,0),(2,0,1,"Algebra",6,0),(3,0,1,"Algebra",7,0),(4,0,1,"Algebra",8,0),(5,0,1,"Algebra",9,0),(6,0,1,"Math analys",10,0),(7,0,1,"Math analys",11,0),(8,0,1,"Math analys",9,0),(9,0,1,"Ukrainian",5,0),(10,0,1,"Ukrainian",6,0),(11,0,1,"Ukrainian",7,0),(12,0,1,"Ukrainian",8,0),(13,0,1,"Ukrainian",9,0),(14,0,1,"Ukrainian",10,0),(15,0,1,"Ukrainian",11,0),(16,0,1,"English",5,0),(17,0,1,"English",6,0),(18,0,1,"English",7,0),(19,0,1,"English",8,0),(20,0,1,"English",9,0),(21,0,1,"English",10,0),(22,0,1,"English",11,0),(23,0,1,"Biology",5,0),(24,0,1,"Biology",6,0),(25,0,1,"Biology",7,0),(26,0,1,"Biology",8,0),(27,0,1,"Biology",9,0),(28,0,1,"Biology",10,0),(29,0,1,"Biology",11,0),(30,0,1,"Chemistry",5,0),(31,0,1,"Chemistry",6,0),(32,0,1,"Chemistry",7,0),(33,0,1,"Chemistry",8,0),(34,0,1,"Chemistry",9,0),(35,0,1,"Chemistry",10,0),(36,0,1,"Chemistry",11,0),(37,0,1,"Physics",5,0),(38,0,1,"Physics",6,0),(39,0,1,"Physics",7,0),(40,0,1,"Physics",8,0),(41,0,1,"Physics",9,0),(42,0,1,"Physics",10,0),(43,0,1,"Physics",11,0),(44,0,1,"History",5,0),(45,0,1,"History",6,0),(46,0,1,"History",7,0),(47,0,1,"History",8,0),(48,0,1,"History",9,0),(49,0,1,"History",10,0),(50,0,1,"History",11,0),(51,0,1,"Ukrainian literature",5,0),(52,0,1,"Ukrainian literature",6,0),(53,0,1,"Ukrainian literature",7,0),(54,0,1,"Ukrainian literature",8,0),(55,0,1,"Ukrainian literature",9,0),(56,0,1,"Ukrainian literature",10,0),(57,0,1,"Ukrainian literature",11,0),(58,0,1,"Foreign literature",5,0),(59,0,1,"Foreign literature",6,0),(60,0,1,"Foreign literature",7,0),(61,0,1,"Foreign literature",8,0),(62,0,1,"Foreign literature",9,0),(63,0,1,"Foreign literature",10,0),(64,0,1,"Foreign literature",11,0),(65,0,1,"Geography",5,0),(66,0,1,"Geography",6,0),(67,0,1,"Geography",7,0),(68,0,1,"Geography",8,0),(69,0,1,"Geography",9,0),(70,0,1,"Geography",10,0),(71,0,1,"Geography",11,0),(72,1,3,"Quantum Physics",6,1000),(73,1,3,"Quantum Physics",7,1000),(74,1,3,"Quantum Physics",8,1000),(75,1,2,"Music lessons",6,500),(76,1,2,"Music lessons",7,500),(77,1,2,"Music lessons",8,500);

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
INSERT INTO `GROUPS` (`id`,`additional`,`endDate`,`letter`,`number`,`startDate`,`teacherId`) VALUES (15,1,"2014-12-23 00:00:00","Z",5,"2014-09-01 00:00:00",6),(16,1,"2014-12-23 00:00:00","Z",5,"2014-09-01 00:00:00",13);

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

INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (1,'2014-09-28',4931,1);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (2,'2014-09-28',4943,2);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (3,'2014-09-28',3388,3);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (4,'2014-09-28',3556,4);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (5,'2014-09-28',4780,5);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (6,'2014-09-28',3729,6);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (7,'2014-09-28',3457,7);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (8,'2014-09-28',3105,8);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (9,'2014-09-28',4212,9);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (10,'2014-09-28',4822,10);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (11,'2014-09-28',4338,11);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (12,'2014-09-28',3851,12);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (13,'2014-09-28',3526,13);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (14,'2014-09-28',3426,14);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (15,'2014-09-28',3266,15);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (16,'2014-09-28',3125,16);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (17,'2014-09-28',3432,17);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (18,'2014-09-28',3903,18);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (19,'2014-09-28',3340,19);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (20,'2014-09-28',3841,20);

INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (21,'2014-10-28',4680,1);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (22,'2014-10-28',4933,2);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (23,'2014-10-28',3402,3);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (24,'2014-10-28',3368,4);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (25,'2014-10-28',3700,5);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (26,'2014-10-28',3296,6);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (27,'2014-10-28',3469,7);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (28,'2014-10-28',4132,8);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (29,'2014-10-28',4400,9);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (30,'2014-10-28',4872,10);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (31,'2014-10-28',3834,11);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (32,'2014-10-28',3488,12);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (33,'2014-10-28',4393,13);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (34,'2014-10-28',4903,14);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (35,'2014-10-28',3040,15);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (36,'2014-10-28',3224,16);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (37,'2014-10-28',3844,17);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (38,'2014-10-28',3672,18);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (39,'2014-10-28',3475,19);
INSERT INTO `SALARY` (`id`,`issueDate`,`sum`,`teacherId`) values (40,'2014-10-28',4611,20);

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

INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('1', '1', '2014-09-01 00:00:00', '10', '21', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('2', '1', '2014-09-01 00:00:00', '8', '21', '2');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('3', '1', '2014-09-01 00:00:00', '6', '21', '3');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('4', '1', '2014-09-01 00:00:00', '8', '21', '7');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('5', '1', '2014-09-01 00:00:00', '12', '21', '8');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('6', '1', '2014-09-01 00:00:00', '3', '21', '10');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('7', '1', '2014-09-01 00:00:00', '4', '21', '11');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('8', '1', '2014-09-01 00:00:00', '5', '21', '15');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('9', '1', '2014-09-01 00:00:00', '7', '21', '19');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('10', '1', '2014-09-01 00:00:00', '10', '21', '22');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('11', '1', '2014-09-01 00:00:00', '11', '22', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('12', '1', '2014-09-01 00:00:00', '5', '22', '4');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('13', '1', '2014-09-01 00:00:00', '6', '22', '5');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('14', '1', '2014-09-01 00:00:00', '9', '22', '7');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('15', '1', '2014-09-01 00:00:00', '10', '22', '8');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('16', '1', '2014-09-01 00:00:00', '11', '22', '11');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('17', '1', '2014-09-01 00:00:00', '4', '22', '13');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('18', '1', '2014-09-01 00:00:00', '2', '22', '14');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('19', '1', '2014-09-01 00:00:00', '12', '22', '18');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('20', '1', '2014-09-01 00:00:00', '3', '22', '21');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('21', '1', '2014-09-01 00:00:00', '6', '23', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('22', '1', '2014-09-01 00:00:00', '8', '23', '5');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('23', '1', '2014-09-01 00:00:00', '3', '23', '7');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('24', '1', '2014-09-01 00:00:00', '5', '23', '8');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('25', '1', '2014-09-01 00:00:00', '9', '23', '9');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('26', '1', '2014-09-01 00:00:00', '11', '23', '10');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('27', '1', '2014-09-01 00:00:00', '10', '23', '13');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('28', '1', '2014-09-01 00:00:00', '11', '23', '14');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('29', '1', '2014-09-01 00:00:00', '6', '23', '20');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('30', '1', '2014-09-01 00:00:00', '8', '23', '22');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('31', '1', '2014-09-01 00:00:00', '3', '24', '2');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('32', '1', '2014-09-01 00:00:00', '11', '24', '5');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('33', '1', '2014-09-01 00:00:00', '9', '24', '8');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('34', '1', '2014-09-01 00:00:00', '6', '24', '9');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('35', '1', '2014-09-01 00:00:00', '7', '24', '11');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('36', '1', '2014-09-01 00:00:00', '4', '24', '12');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('37', '1', '2014-09-01 00:00:00', '9', '24', '16');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('38', '1', '2014-09-01 00:00:00', '10', '24', '18');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('39', '1', '2014-09-01 00:00:00', '10', '24', '19');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('40', '1', '2014-09-01 00:00:00', '11', '24', '21');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('41', '1', '2014-09-01 00:00:00', '8', '1', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('42', '1', '2014-09-01 00:00:00', '2', '1', '158');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('43', '1', '2014-09-01 00:00:00', '5', '1', '160');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('44', '1', '2014-09-01 00:00:00', '6', '1', '161');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('45', '1', '2014-09-01 00:00:00', '2', '1', '162');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('46', '1', '2014-09-01 00:00:00', '10', '1', '166');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('47', '1', '2014-09-01 00:00:00', '9', '1', '167');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('48', '1', '2014-09-01 00:00:00', '3', '1', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('49', '1', '2014-09-01 00:00:00', '8', '1', '171');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('50', '1', '2014-09-01 00:00:00', '7', '1', '176');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('51', '1', '2014-09-01 00:00:00', '4', '2', '156');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('52', '1', '2014-09-01 00:00:00', '5', '2', '157');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('53', '1', '2014-09-01 00:00:00', '10', '2', '158');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('54', '1', '2014-09-01 00:00:00', '11', '2', '161');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('55', '1', '2014-09-01 00:00:00', '2', '2', '163');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('56', '1', '2014-09-01 00:00:00', '6', '2', '164');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('57', '1', '2014-09-01 00:00:00', '7', '2', '168');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('58', '1', '2014-09-01 00:00:00', '9', '2', '171');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('59', '1', '2014-09-01 00:00:00', '5', '2', '173');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('60', '1', '2014-09-01 00:00:00', '10', '2', '174');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('61', '1', '2014-09-01 00:00:00', '11', '3', '158');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('62', '1', '2014-09-01 00:00:00', '12', '3', '159');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('63', '1', '2014-09-01 00:00:00', '10', '3', '162');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('64', '1', '2014-09-01 00:00:00', '9', '3', '164');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('65', '1', '2014-09-01 00:00:00', '6', '3', '166');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('66', '1', '2014-09-01 00:00:00', '8', '3', '167');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('67', '1', '2014-09-01 00:00:00', '11', '3', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('68', '1', '2014-09-01 00:00:00', '12', '3', '171');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('69', '1', '2014-09-01 00:00:00', '9', '3', '172');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('70', '1', '2014-09-01 00:00:00', '1', '3', '173');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('71', '1', '2014-09-01 00:00:00', '5', '4', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('72', '1', '2014-09-01 00:00:00', '3', '4', '156');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('73', '1', '2014-09-01 00:00:00', '9', '4', '159');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('74', '1', '2014-09-01 00:00:00', '1', '4', '166');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('75', '1', '2014-09-01 00:00:00', '6', '4', '168');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('76', '1', '2014-09-01 00:00:00', '7', '4', '169');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('77', '1', '2014-09-01 00:00:00', '8', '4', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('78', '1', '2014-09-01 00:00:00', '3', '4', '171');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('79', '1', '2014-09-01 00:00:00', '4', '4', '175');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('80', '1', '2014-09-01 00:00:00', '9', '4', '176');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('81', '1', '2014-09-01 00:00:00', '10', '61', '23');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('82', '1', '2014-09-01 00:00:00', '12', '61', '27');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('83', '1', '2014-09-01 00:00:00', '11', '61', '28');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('84', '1', '2014-09-01 00:00:00', '10', '61', '35');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('85', '1', '2014-09-01 00:00:00', '9', '61', '40');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('86', '1', '2014-09-01 00:00:00', '7', '62', '28');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('87', '1', '2014-09-01 00:00:00', '6', '62', '30');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('88', '1', '2014-09-01 00:00:00', '5', '62', '37');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('89', '1', '2014-09-01 00:00:00', '4', '62', '39');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('90', '1', '2014-09-01 00:00:00', '10', '62', '44');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('91', '1', '2014-09-01 00:00:00', '11', '63', '25');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('92', '1', '2014-09-01 00:00:00', '2', '63', '29');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('93', '1', '2014-09-01 00:00:00', '3', '63', '33');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('94', '1', '2014-09-01 00:00:00', '7', '63', '37');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('95', '1', '2014-09-01 00:00:00', '9', '63', '42');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('96', '1', '2014-09-01 00:00:00', '10', '64', '25');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('97', '1', '2014-09-01 00:00:00', '11', '64', '26');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('98', '1', '2014-09-01 00:00:00', '2', '64', '28');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('99', '1', '2014-09-01 00:00:00', '3', '64', '37');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('100', '1', '2014-09-01 00:00:00', '8', '64', '43');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('101', '1', '2014-09-01 00:00:00', '6', '41', '177');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('102', '1', '2014-09-01 00:00:00', '4', '41', '179');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('103', '1', '2014-09-01 00:00:00', '10', '41', '185');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('104', '1', '2014-09-01 00:00:00', '11', '41', '190');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('105', '1', '2014-09-01 00:00:00', '12', '41', '196');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('106', '1', '2014-09-01 00:00:00', '10', '42', '179');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('107', '1', '2014-09-01 00:00:00', '9', '42', '183');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('108', '1', '2014-09-01 00:00:00', '8', '42', '192');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('109', '1', '2014-09-01 00:00:00', '7', '42', '197');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('110', '1', '2014-09-01 00:00:00', '6', '43', '185');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('111', '1', '2014-09-01 00:00:00', '9', '43', '186');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('112', '1', '2014-09-01 00:00:00', '7', '43', '191');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('113', '1', '2014-09-01 00:00:00', '9', '44', '188');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('114', '1', '2014-09-01 00:00:00', '8', '44', '195');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('115', '1', '2014-09-01 00:00:00', '5', '44', '198');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('116', '1', '2014-09-02 00:00:00', '7', '25', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('117', '1', '2014-09-02 00:00:00', '10', '25', '5');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('118', '1', '2014-09-02 00:00:00', '11', '25', '8');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('119', '1', '2014-09-02 00:00:00', '9', '26', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('120', '1', '2014-09-02 00:00:00', '7', '26', '7');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('121', '1', '2014-09-02 00:00:00', '8', '26', '22');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('122', '1', '2014-09-02 00:00:00', '5', '27', '3');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('123', '1', '2014-09-02 00:00:00', '6', '27', '6');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('124', '1', '2014-09-02 00:00:00', '8', '27', '21');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('125', '1', '2014-09-02 00:00:00', '2', '28', '4');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('126', '1', '2014-09-02 00:00:00', '9', '28', '16');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('127', '1', '2014-09-02 00:00:00', '9', '28', '18');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('128', '1', '2014-09-02 00:00:00', '10', '5', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('129', '1', '2014-09-02 00:00:00', '8', '5', '165');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('130', '1', '2014-09-02 00:00:00', '7', '5', '176');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('131', '1', '2014-09-02 00:00:00', '5', '6', '160');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('132', '1', '2014-09-02 00:00:00', '4', '6', '164');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('133', '1', '2014-09-02 00:00:00', '2', '6', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('134', '1', '2014-09-02 00:00:00', '9', '7', '168');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('135', '1', '2014-09-02 00:00:00', '10', '7', '174');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('136', '1', '2014-09-02 00:00:00', '11', '7', '176');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('137', '1', '2014-09-02 00:00:00', '12', '8', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('138', '1', '2014-09-02 00:00:00', '10', '8', '160');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('139', '1', '2014-09-02 00:00:00', '10', '8', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('140', '1', '2014-09-02 00:00:00', '8', '65', '23');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('141', '1', '2014-09-02 00:00:00', '7', '65', '30');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('142', '1', '2014-09-02 00:00:00', '8', '66', '25');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('143', '1', '2014-09-02 00:00:00', '9', '66', '44');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('144', '1', '2014-09-02 00:00:00', '8', '67', '27');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('145', '1', '2014-09-02 00:00:00', '6', '67', '42');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('146', '1', '2014-09-02 00:00:00', '6', '68', '33');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('147', '1', '2014-09-02 00:00:00', '9', '68', '39');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('148', '1', '2014-09-03 00:00:00', '10', '29', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('149', '1', '2014-09-03 00:00:00', '11', '29', '17');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('150', '1', '2014-09-03 00:00:00', '12', '30', '6');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('151', '1', '2014-09-03 00:00:00', '9', '30', '22');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('152', '1', '2014-09-03 00:00:00', '8', '31', '10');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('153', '1', '2014-09-03 00:00:00', '6', '31', '19');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('154', '1', '2014-09-03 00:00:00', '7', '32', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('155', '1', '2014-09-03 00:00:00', '9', '32', '16');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('156', '1', '2014-09-03 00:00:00', '2', '9', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('157', '1', '2014-09-03 00:00:00', '6', '9', '160');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('158', '1', '2014-09-03 00:00:00', '5', '10', '163');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('159', '1', '2014-09-03 00:00:00', '7', '10', '175');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('160', '1', '2014-09-03 00:00:00', '8', '11', '159');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('161', '1', '2014-09-03 00:00:00', '8', '11', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('162', '1', '2014-09-03 00:00:00', '8', '12', '158');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('163', '1', '2014-09-03 00:00:00', '9', '12', '165');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('164', '1', '2014-09-03 00:00:00', '10', '69', '23');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('165', '1', '2014-09-03 00:00:00', '5', '69', '39');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('166', '1', '2014-09-03 00:00:00', '6', '70', '25');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('167', '1', '2014-09-03 00:00:00', '7', '70', '40');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('168', '1', '2014-09-03 00:00:00', '2', '71', '27');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('169', '1', '2014-09-03 00:00:00', '10', '71', '38');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('170', '1', '2014-09-03 00:00:00', '10', '72', '35');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('171', '1', '2014-09-03 00:00:00', '10', '72', '44');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('172', '1', '2014-09-03 00:00:00', '11', '49', '177');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('173', '1', '2014-09-03 00:00:00', '11', '49', '185');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('174', '1', '2014-09-03 00:00:00', '11', '50', '188');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('175', '1', '2014-09-03 00:00:00', '6', '50', '195');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('176', '1', '2014-09-03 00:00:00', '11', '51', '179');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('177', '1', '2014-09-03 00:00:00', '11', '51', '194');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('178', '1', '2014-09-03 00:00:00', '7', '52', '180');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('179', '1', '2014-09-03 00:00:00', '7', '52', '198');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('180', '1', '2014-09-04 00:00:00', '7', '33', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('181', '1', '2014-09-04 00:00:00', '7', '33', '21');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('182', '1', '2014-09-04 00:00:00', '7', '34', '15');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('183', '1', '2014-09-04 00:00:00', '9', '34', '19');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('184', '1', '2014-09-04 00:00:00', '9', '35', '2');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('185', '1', '2014-09-04 00:00:00', '9', '35', '22');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('186', '1', '2014-09-04 00:00:00', '9', '36', '6');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('187', '1', '2014-09-04 00:00:00', '9', '36', '12');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('188', '1', '2014-09-04 00:00:00', '10', '13', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('189', '1', '2014-09-04 00:00:00', '5', '13', '176');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('190', '1', '2014-09-04 00:00:00', '5', '14', '160');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('191', '1', '2014-09-04 00:00:00', '9', '14', '169');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('192', '1', '2014-09-04 00:00:00', '9', '15', '163');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('193', '1', '2014-09-04 00:00:00', '9', '15', '175');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('194', '1', '2014-09-04 00:00:00', '5', '16', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('195', '1', '2014-09-04 00:00:00', '9', '16', '158');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('196', '1', '2014-09-04 00:00:00', '8', '73', '23');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('197', '1', '2014-09-04 00:00:00', '8', '73', '44');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('198', '1', '2014-09-04 00:00:00', '8', '74', '28');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('199', '1', '2014-09-04 00:00:00', '7', '74', '37');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('200', '1', '2014-09-04 00:00:00', '8', '75', '25');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('201', '1', '2014-09-04 00:00:00', '9', '75', '41');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('202', '1', '2014-09-04 00:00:00', '7', '76', '32');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('203', '1', '2014-09-04 00:00:00', '5', '76', '36');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('204', '1', '2014-09-04 00:00:00', '8', '53', '179');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('205', '1', '2014-09-04 00:00:00', '9', '53', '190');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('206', '1', '2014-09-04 00:00:00', '10', '54', '177');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('207', '1', '2014-09-04 00:00:00', '11', '54', '196');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('208', '1', '2014-09-04 00:00:00', '7', '55', '186');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('209', '1', '2014-09-04 00:00:00', '3', '55', '189');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('210', '1', '2014-09-04 00:00:00', '2', '56', '180');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('212', '1', '2014-09-04 00:00:00', '12', '56', '198');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('213', '1', '2014-09-05 00:00:00', '9', '37', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('214', '1', '2014-09-05 00:00:00', '8', '37', '15');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('215', '1', '2014-09-05 00:00:00', '6', '38', '6');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('216', '1', '2014-09-05 00:00:00', '6', '38', '22');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('217', '1', '2014-09-05 00:00:00', '9', '39', '3');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('218', '1', '2014-09-05 00:00:00', '9', '39', '10');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('219', '1', '2014-09-05 00:00:00', '9', '40', '2');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('220', '1', '2014-09-05 00:00:00', '10', '40', '12');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('221', '1', '2014-09-05 00:00:00', '11', '17', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('222', '1', '2014-09-05 00:00:00', '5', '17', '163');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('223', '1', '2014-09-05 00:00:00', '8', '18', '160');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('224', '1', '2014-09-05 00:00:00', '7', '18', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('225', '1', '2014-09-05 00:00:00', '4', '19', '165');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('226', '1', '2014-09-05 00:00:00', '9', '19', '176');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('227', '1', '2014-09-05 00:00:00', '6', '20', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('228', '1', '2014-09-05 00:00:00', '9', '20', '158');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('229', '1', '2014-09-05 00:00:00', '3', '77', '26');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('230', '1', '2014-09-05 00:00:00', '9', '77', '29');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('231', '1', '2014-09-05 00:00:00', '10', '78', '30');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('232', '1', '2014-09-05 00:00:00', '8', '78', '44');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('233', '1', '2014-09-05 00:00:00', '8', '79', '23');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('234', '1', '2014-09-05 00:00:00', '8', '79', '37');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('235', '1', '2014-09-05 00:00:00', '6', '80', '27');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('236', '1', '2014-09-05 00:00:00', '6', '80', '39');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('237', '1', '2014-09-05 00:00:00', '9', '57', '180');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('238', '1', '2014-09-05 00:00:00', '10', '57', '185');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('239', '1', '2014-09-05 00:00:00', '10', '58', '177');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('240', '1', '2014-09-05 00:00:00', '2', '58', '190');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('241', '1', '2014-09-05 00:00:00', '3', '59', '188');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('242', '1', '2014-09-05 00:00:00', '6', '59', '196');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('243', '1', '2014-09-05 00:00:00', '8', '60', '183');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('244', '1', '2014-09-05 00:00:00', '6', '60', '195');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('245', '1', '2014-09-08 00:00:00', '7', '121', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('246', '1', '2014-09-08 00:00:00', '7', '121', '14');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('247', '1', '2014-09-08 00:00:00', '8', '122', '3');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('248', '1', '2014-09-08 00:00:00', '9', '122', '14');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('249', '1', '2014-09-08 00:00:00', '5', '123', '10');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('250', '1', '2014-09-08 00:00:00', '6', '123', '11');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('251', '1', '2014-09-08 00:00:00', '9', '124', '6');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('252', '1', '2014-09-08 00:00:00', '9', '124', '22');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('253', '1', '2014-09-08 00:00:00', '10', '101', '157');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('254', '1', '2014-09-08 00:00:00', '11', '101', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('255', '1', '2014-09-08 00:00:00', '4', '102', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('256', '1', '2014-09-08 00:00:00', '6', '102', '174');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('257', '1', '2014-09-08 00:00:00', '10', '103', '162');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('258', '1', '2014-09-08 00:00:00', '9', '103', '169');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('259', '1', '2014-09-08 00:00:00', '7', '104', '156');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('260', '1', '2014-09-08 00:00:00', '8', '104', '176');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('261', '1', '2014-09-08 00:00:00', '6', '162', '25');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('262', '1', '2014-09-08 00:00:00', '4', '162', '33');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('263', '1', '2014-09-08 00:00:00', '2', '163', '23');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('264', '1', '2014-09-08 00:00:00', '10', '163', '40');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('265', '1', '2014-09-08 00:00:00', '11', '164', '30');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('266', '1', '2014-09-08 00:00:00', '12', '164', '44');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('267', '1', '2014-09-08 00:00:00', '12', '141', '180');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('268', '1', '2014-09-08 00:00:00', '7', '141', '190');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('269', '1', '2014-09-08 00:00:00', '8', '141', '195');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('270', '1', '2014-09-08 00:00:00', '9', '142', '178');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('271', '1', '2014-09-08 00:00:00', '10', '142', '185');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('272', '1', '2014-09-08 00:00:00', '2', '142', '196');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('273', '1', '2014-09-08 00:00:00', '7', '143', '177');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('274', '1', '2014-09-08 00:00:00', '8', '143', '195');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('275', '1', '2014-09-08 00:00:00', '9', '144', '184');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('276', '1', '2014-09-08 00:00:00', '7', '144', '190');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('278', '1', '2014-09-09 00:00:00', '8', '125', '4');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('279', '1', '2014-09-09 00:00:00', '9', '125', '10');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('280', '1', '2014-09-09 00:00:00', '10', '126', '8');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('290', '1', '2014-09-09 00:00:00', '2', '126', '15');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('291', '1', '2014-09-09 00:00:00', '3', '127', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('292', '1', '2014-09-09 00:00:00', '5', '127', '20');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('293', '1', '2014-09-09 00:00:00', '7', '128', '6');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('294', '1', '2014-09-09 00:00:00', '9', '128', '17');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('295', '1', '2014-09-09 00:00:00', '10', '105', '160');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('296', '1', '2014-09-09 00:00:00', '7', '105', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('297', '1', '2014-09-09 00:00:00', '8', '106', '158');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('298', '1', '2014-09-09 00:00:00', '10', '106', '173');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('299', '1', '2014-09-09 00:00:00', '2', '107', '167');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('300', '1', '2014-09-09 00:00:00', '12', '107', '174');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('301', '1', '2014-09-09 00:00:00', '10', '108', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('302', '1', '2014-09-09 00:00:00', '11', '108', '168');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('303', '1', '2014-09-09 00:00:00', '9', '166', '26');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('304', '1', '2014-09-09 00:00:00', '6', '166', '30');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('305', '1', '2014-09-09 00:00:00', '8', '166', '35');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('306', '1', '2014-09-09 00:00:00', '1', '167', '23');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('307', '1', '2014-09-09 00:00:00', '2', '167', '29');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('308', '1', '2014-09-09 00:00:00', '9', '167', '44');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('309', '1', '2014-09-09 00:00:00', '10', '168', '29');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('310', '1', '2014-09-09 00:00:00', '7', '168', '33');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('311', '1', '2014-09-09 00:00:00', '8', '145', '178');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('312', '1', '2014-09-09 00:00:00', '9', '145', '180');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('313', '1', '2014-09-09 00:00:00', '4', '146', '179');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('314', '1', '2014-09-09 00:00:00', '5', '146', '189');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('315', '1', '2014-09-09 00:00:00', '7', '147', '185');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('316', '1', '2014-09-09 00:00:00', '9', '147', '190');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('317', '1', '2014-09-09 00:00:00', '10', '148', '186');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('318', '1', '2014-09-09 00:00:00', '11', '148', '198');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('319', '1', '2014-09-10 00:00:00', '10', '129', '3');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('320', '1', '2014-09-10 00:00:00', '10', '129', '7');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('321', '1', '2014-09-10 00:00:00', '11', '130', '1');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('322', '1', '2014-09-10 00:00:00', '12', '130', '20');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('323', '1', '2014-09-10 00:00:00', '8', '131', '7');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('324', '1', '2014-09-10 00:00:00', '8', '131', '10');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('325', '1', '2014-09-10 00:00:00', '9', '132', '11');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('326', '1', '2014-09-10 00:00:00', '7', '132', '15');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('327', '1', '2014-09-10 00:00:00', '5', '109', '159');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('328', '1', '2014-09-10 00:00:00', '2', '109', '167');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('329', '1', '2014-09-10 00:00:00', '3', '110', '160');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('330', '1', '2014-09-10 00:00:00', '6', '110', '166');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('331', '1', '2014-09-10 00:00:00', '9', '111', '155');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('332', '1', '2014-09-10 00:00:00', '9', '111', '170');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('333', '1', '2014-09-10 00:00:00', '7', '112', '158');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('334', '1', '2014-09-10 00:00:00', '7', '112', '159');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('335', '1', '2014-09-10 00:00:00', '5', '170', '25');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('336', '1', '2014-09-10 00:00:00', '5', '170', '40');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('337', '1', '2014-09-10 00:00:00', '8', '171', '28');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('338', '1', '2014-09-10 00:00:00', '9', '171', '30');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('339', '1', '2014-09-10 00:00:00', '10', '172', '35');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('340', '1', '2014-09-10 00:00:00', '10', '172', '39');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('341', '1', '2014-09-10 00:00:00', '12', '149', '177');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('342', '1', '2014-09-10 00:00:00', '5', '149', '185');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('343', '1', '2014-09-10 00:00:00', '4', '149', '190');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('344', '1', '2014-09-10 00:00:00', '4', '150', '179');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('346', '1', '2014-09-10 00:00:00', '9', '150', '184');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('345', '1', '2014-09-10 00:00:00', '7', '150', '189');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('347', '1', '2014-09-10 00:00:00', '6', '151', '178');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('348', '1', '2014-09-10 00:00:00', '1', '151', '191');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('349', '1', '2014-09-10 00:00:00', '8', '152', '180');
INSERT INTO `JOURNAL` (`id`, `coefficient`, `date`, `mark`, `scheduleId`, `studentId`) VALUES ('350', '1', '2014-09-10 00:00:00', '9', '152', '186');

INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (351,1,"2014-09-11",5,133,12),(352,1,"2014-09-11",3,134,18),(353,1,"2014-09-11",11,134,19),(354,1,"2014-09-11",11,135,21),(355,1,"2014-09-11",11,134,10),(356,1,"2014-09-11",3,134,9),(357,1,"2014-09-11",8,136,12),(358,1,"2014-09-11",2,133,14),(359,1,"2014-09-11",6,135,19),(360,1,"2014-09-11",10,135,20);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (361,1,"2014-09-11",9,134,18),(362,1,"2014-09-11",11,133,7),(363,1,"2014-09-11",12,136,20),(364,1,"2014-09-11",5,133,13),(365,1,"2014-09-11",9,135,16),(366,1,"2014-09-11",8,134,22),(367,1,"2014-09-11",2,134,13),(368,1,"2014-09-11",3,136,12),(369,1,"2014-09-11",9,133,16),(370,1,"2014-09-11",9,136,12);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (371,1,"2014-09-11",2,135,13),(372,1,"2014-09-11",7,136,16),(373,1,"2014-09-11",3,136,8),(374,1,"2014-09-11",9,133,16),(375,1,"2014-09-11",11,133,7),(376,1,"2014-09-11",4,135,22),(377,1,"2014-09-11",9,136,15),(378,1,"2014-09-11",4,136,15),(379,1,"2014-09-11",2,133,2),(380,1,"2014-09-11",1,135,19);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (381,1,"2014-09-11",4,136,19),(382,1,"2014-09-11",3,134,4),(383,1,"2014-09-11",1,133,2),(384,1,"2014-09-11",12,135,8),(385,1,"2014-09-11",2,134,11),(386,1,"2014-09-11",3,136,7),(387,1,"2014-09-11",3,136,9),(388,1,"2014-09-11",3,135,21),(389,1,"2014-09-11",11,133,16),(390,1,"2014-09-11",8,135,10);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (391,1,"2014-09-11",10,133,1),(392,1,"2014-09-11",2,134,6),(393,1,"2014-09-11",5,133,2),(394,1,"2014-09-11",1,136,3),(395,1,"2014-09-11",8,135,6),(396,1,"2014-09-11",10,135,14),(397,1,"2014-09-11",12,134,15),(398,1,"2014-09-11",5,136,12),(399,1,"2014-09-11",7,133,13),(400,1,"2014-09-11",11,134,2);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (401,1,"2014-09-11",10,133,2),(402,1,"2014-09-11",1,136,17),(403,1,"2014-09-11",11,133,2),(404,1,"2014-09-11",9,134,14),(405,1,"2014-09-11",4,135,19),(406,1,"2014-09-11",1,135,2),(407,1,"2014-09-11",1,136,4),(408,1,"2014-09-11",3,134,11),(409,1,"2014-09-11",8,136,17),(410,1,"2014-09-11",5,136,18);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (411,1,"2014-09-11",11,133,8),(412,1,"2014-09-11",10,134,21),(413,1,"2014-09-11",6,136,2),(414,1,"2014-09-11",8,135,2),(415,1,"2014-09-11",2,134,14),(416,1,"2014-09-11",8,134,7),(417,1,"2014-09-11",2,134,6),(418,1,"2014-09-11",9,133,7),(419,1,"2014-09-11",6,134,19),(420,1,"2014-09-11",4,134,19);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (421,1,"2014-09-11",4,133,18),(422,1,"2014-09-11",3,135,8),(423,1,"2014-09-11",11,136,12),(424,1,"2014-09-11",10,134,3),(425,1,"2014-09-11",11,135,3),(426,1,"2014-09-11",5,135,7),(427,1,"2014-09-11",9,136,1),(428,1,"2014-09-11",10,133,5),(429,1,"2014-09-11",5,133,22),(430,1,"2014-09-11",3,136,13);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (431,1,"2014-09-11",10,136,15),(432,1,"2014-09-11",8,133,15),(433,1,"2014-09-11",5,133,12),(434,1,"2014-09-11",8,133,4),(435,1,"2014-09-11",6,135,18),(436,1,"2014-09-11",4,135,17),(437,1,"2014-09-11",7,135,17),(438,1,"2014-09-11",11,133,20),(439,1,"2014-09-11",1,133,14),(440,1,"2014-09-11",12,135,18);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (441,1,"2014-09-11",6,134,12),(442,1,"2014-09-11",11,133,14),(443,1,"2014-09-11",1,136,16),(444,1,"2014-09-11",9,133,15),(445,1,"2014-09-11",12,133,18),(446,1,"2014-09-11",11,133,20),(447,1,"2014-09-11",4,135,16),(448,1,"2014-09-11",8,134,19),(449,1,"2014-09-11",12,134,1),(450,1,"2014-09-11",7,133,9);

INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (451,1,"2014-09-11",5,115,168),(452,1,"2014-09-11",8,113,175),(453,1,"2014-09-11",5,113,167),(454,1,"2014-09-11",10,114,162),(455,1,"2014-09-11",7,115,165),(456,1,"2014-09-11",2,116,169),(457,1,"2014-09-11",3,113,169),(458,1,"2014-09-11",11,116,167),(459,1,"2014-09-11",8,115,166),(460,1,"2014-09-11",8,113,170);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (461,1,"2014-09-11",2,116,168),(462,1,"2014-09-11",5,116,174),(463,1,"2014-09-11",3,115,176),(464,1,"2014-09-11",5,113,174),(465,1,"2014-09-11",6,115,170),(466,1,"2014-09-11",2,114,159),(467,1,"2014-09-11",2,116,160),(468,1,"2014-09-11",7,114,169),(469,1,"2014-09-11",6,116,175),(470,1,"2014-09-11",3,113,162);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (471,1,"2014-09-11",11,114,162),(472,1,"2014-09-11",8,115,161),(473,1,"2014-09-11",6,114,163),(474,1,"2014-09-11",9,115,165),(475,1,"2014-09-11",12,113,160),(476,1,"2014-09-11",3,116,165),(477,1,"2014-09-11",11,113,169),(478,1,"2014-09-11",6,116,166),(479,1,"2014-09-11",4,116,172),(480,1,"2014-09-11",6,113,165);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (481,1,"2014-09-11",12,114,171),(482,1,"2014-09-11",1,113,159),(483,1,"2014-09-11",10,114,165),(484,1,"2014-09-11",2,116,162),(485,1,"2014-09-11",8,114,172),(486,1,"2014-09-11",2,116,176),(487,1,"2014-09-11",7,115,174),(488,1,"2014-09-11",8,115,171),(489,1,"2014-09-11",3,116,156),(490,1,"2014-09-11",5,114,157);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (491,1,"2014-09-11",3,116,174),(492,1,"2014-09-11",3,113,173),(493,1,"2014-09-11",9,116,161),(494,1,"2014-09-11",9,115,174),(495,1,"2014-09-11",6,115,165),(496,1,"2014-09-11",1,113,159),(497,1,"2014-09-11",4,115,163),(498,1,"2014-09-11",1,114,160),(499,1,"2014-09-11",4,116,171),(500,1,"2014-09-11",7,116,164);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (501,1,"2014-09-11",11,113,166),(502,1,"2014-09-11",4,115,174),(503,1,"2014-09-11",1,116,169),(504,1,"2014-09-11",6,113,166),(505,1,"2014-09-11",4,116,172),(506,1,"2014-09-11",10,116,159),(507,1,"2014-09-11",3,116,174),(508,1,"2014-09-11",7,113,165),(509,1,"2014-09-11",7,116,162),(510,1,"2014-09-11",11,116,159);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (511,1,"2014-09-11",2,116,174),(512,1,"2014-09-11",5,115,157),(513,1,"2014-09-11",5,114,168),(514,1,"2014-09-11",8,115,167),(515,1,"2014-09-11",4,115,174),(516,1,"2014-09-11",8,113,161),(517,1,"2014-09-11",8,113,167),(518,1,"2014-09-11",11,113,161),(519,1,"2014-09-11",5,113,166),(520,1,"2014-09-11",1,113,173);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (521,1,"2014-09-11",6,115,172),(522,1,"2014-09-11",11,115,160),(523,1,"2014-09-11",5,115,158),(524,1,"2014-09-11",3,116,176),(525,1,"2014-09-11",3,115,171),(526,1,"2014-09-11",12,115,171),(527,1,"2014-09-11",10,113,161),(528,1,"2014-09-11",12,115,167),(529,1,"2014-09-11",4,116,160),(530,1,"2014-09-11",2,115,167);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (531,1,"2014-09-11",12,113,175),(532,1,"2014-09-11",4,113,163),(533,1,"2014-09-11",11,116,165),(534,1,"2014-09-11",11,116,176),(535,1,"2014-09-11",3,113,168),(536,1,"2014-09-11",3,115,155),(537,1,"2014-09-11",10,116,175),(538,1,"2014-09-11",2,116,174),(539,1,"2014-09-11",7,113,166),(540,1,"2014-09-11",4,116,163);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (541,1,"2014-09-11",6,116,158),(542,1,"2014-09-11",4,116,169),(543,1,"2014-09-11",2,113,158),(544,1,"2014-09-11",5,113,171),(545,1,"2014-09-11",6,116,161),(546,1,"2014-09-11",8,115,175),(547,1,"2014-09-11",9,114,162),(548,1,"2014-09-11",1,115,163),(549,1,"2014-09-11",6,115,162),(550,1,"2014-09-11",8,113,168);

INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (551,1,"2014-09-11",9,176,40),(552,1,"2014-09-11",7,174,29),(553,1,"2014-09-11",8,176,26),(554,1,"2014-09-11",1,175,33),(555,1,"2014-09-11",12,176,38),(556,1,"2014-09-11",11,176,32),(557,1,"2014-09-11",6,175,38),(558,1,"2014-09-11",1,174,34),(559,1,"2014-09-11",3,176,27),(560,1,"2014-09-11",8,174,23);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (561,1,"2014-09-11",10,175,33),(562,1,"2014-09-11",4,175,33),(563,1,"2014-09-11",8,176,28),(564,1,"2014-09-11",12,175,29),(565,1,"2014-09-11",12,174,30),(566,1,"2014-09-11",6,175,41),(567,1,"2014-09-11",5,176,27),(568,1,"2014-09-11",3,176,36),(569,1,"2014-09-11",8,174,31),(570,1,"2014-09-11",2,175,43);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (571,1,"2014-09-11",11,176,44),(572,1,"2014-09-11",10,176,42),(573,1,"2014-09-11",10,174,32),(574,1,"2014-09-11",10,174,32),(575,1,"2014-09-11",1,174,39),(576,1,"2014-09-11",7,176,37),(577,1,"2014-09-11",7,174,34),(578,1,"2014-09-11",8,174,23),(579,1,"2014-09-11",6,175,41),(580,1,"2014-09-11",11,176,43);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (581,1,"2014-09-11",7,175,35),(582,1,"2014-09-11",8,176,44),(583,1,"2014-09-11",9,175,44),(584,1,"2014-09-11",6,174,38),(585,1,"2014-09-11",4,174,31),(586,1,"2014-09-11",7,175,24),(587,1,"2014-09-11",10,175,42),(588,1,"2014-09-11",9,175,43),(589,1,"2014-09-11",8,175,36),(590,1,"2014-09-11",1,176,25);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (591,1,"2014-09-11",8,176,40),(592,1,"2014-09-11",1,175,41),(593,1,"2014-09-11",2,175,26),(594,1,"2014-09-11",11,174,27),(595,1,"2014-09-11",2,174,23),(596,1,"2014-09-11",5,174,29),(597,1,"2014-09-11",12,175,30),(598,1,"2014-09-11",11,175,43),(599,1,"2014-09-11",2,176,42),(600,1,"2014-09-11",2,175,30);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (601,1,"2014-09-11",8,175,41),(602,1,"2014-09-11",7,174,31),(603,1,"2014-09-11",1,176,40),(604,1,"2014-09-11",5,175,38),(605,1,"2014-09-11",12,175,35),(606,1,"2014-09-11",7,174,29),(607,1,"2014-09-11",6,174,25),(608,1,"2014-09-11",6,174,38),(609,1,"2014-09-11",8,176,37),(610,1,"2014-09-11",8,175,24);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (611,1,"2014-09-11",9,176,33),(612,1,"2014-09-11",5,176,27),(613,1,"2014-09-11",10,174,37),(614,1,"2014-09-11",8,176,39),(615,1,"2014-09-11",11,175,25),(616,1,"2014-09-11",12,176,38),(617,1,"2014-09-11",11,174,28),(618,1,"2014-09-11",12,174,31),(619,1,"2014-09-11",7,174,40),(620,1,"2014-09-11",9,174,32);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (621,1,"2014-09-11",12,175,23),(622,1,"2014-09-11",10,176,42),(623,1,"2014-09-11",1,175,44),(624,1,"2014-09-11",6,176,25),(625,1,"2014-09-11",10,176,27),(626,1,"2014-09-11",4,176,30),(627,1,"2014-09-11",10,174,41),(628,1,"2014-09-11",1,175,43),(629,1,"2014-09-11",12,174,43),(630,1,"2014-09-11",1,174,34);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (631,1,"2014-09-11",10,175,37),(632,1,"2014-09-11",1,174,25),(633,1,"2014-09-11",11,174,28),(634,1,"2014-09-11",3,175,34),(635,1,"2014-09-11",12,176,44),(636,1,"2014-09-11",5,175,40),(637,1,"2014-09-11",3,175,26),(638,1,"2014-09-11",2,174,31),(639,1,"2014-09-11",4,176,23),(640,1,"2014-09-11",9,174,24);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (641,1,"2014-09-11",2,175,31),(642,1,"2014-09-11",9,176,36),(643,1,"2014-09-11",5,176,41),(644,1,"2014-09-11",8,176,27),(645,1,"2014-09-11",1,176,38),(646,1,"2014-09-11",6,175,34),(647,1,"2014-09-11",5,174,39),(648,1,"2014-09-11",4,175,24),(649,1,"2014-09-11",9,174,28),(650,1,"2014-09-11",1,174,33);

INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (651,1,"2014-09-11",9,155,183),(652,1,"2014-09-11",9,155,191),(653,1,"2014-09-11",3,155,194),(654,1,"2014-09-11",11,155,182),(655,1,"2014-09-11",8,156,188),(656,1,"2014-09-11",12,155,188),(657,1,"2014-09-11",9,154,188),(658,1,"2014-09-11",2,153,177),(659,1,"2014-09-11",5,156,193),(660,1,"2014-09-11",7,156,188);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (661,1,"2014-09-11",10,156,183),(662,1,"2014-09-11",4,153,182),(663,1,"2014-09-11",4,154,188),(664,1,"2014-09-11",3,154,182),(665,1,"2014-09-11",5,153,190),(666,1,"2014-09-11",12,155,179),(667,1,"2014-09-11",12,156,184),(668,1,"2014-09-11",6,154,186),(669,1,"2014-09-11",12,154,188),(670,1,"2014-09-11",9,156,178);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (671,1,"2014-09-11",6,154,177),(672,1,"2014-09-11",4,153,181),(673,1,"2014-09-11",8,154,191),(674,1,"2014-09-11",5,154,185),(675,1,"2014-09-11",1,155,189),(676,1,"2014-09-11",12,155,193),(677,1,"2014-09-11",1,155,192),(678,1,"2014-09-11",5,156,194),(679,1,"2014-09-11",8,153,177),(680,1,"2014-09-11",10,156,178);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (681,1,"2014-09-11",4,154,186),(682,1,"2014-09-11",9,153,182),(683,1,"2014-09-11",5,153,195),(684,1,"2014-09-11",12,156,183),(685,1,"2014-09-11",2,154,183),(686,1,"2014-09-11",4,154,191),(687,1,"2014-09-11",9,153,198),(688,1,"2014-09-11",10,154,179),(689,1,"2014-09-11",4,154,196),(690,1,"2014-09-11",3,153,189);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (691,1,"2014-09-11",12,155,187),(692,1,"2014-09-11",9,156,197),(693,1,"2014-09-11",3,153,178),(694,1,"2014-09-11",2,156,188),(695,1,"2014-09-11",3,154,177),(696,1,"2014-09-11",1,153,194),(697,1,"2014-09-11",4,156,190),(698,1,"2014-09-11",11,154,181),(699,1,"2014-09-11",9,154,181),(700,1,"2014-09-11",4,154,189);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (701,1,"2014-09-11",1,156,180),(702,1,"2014-09-11",5,153,183),(703,1,"2014-09-11",5,153,178),(704,1,"2014-09-11",5,155,180),(705,1,"2014-09-11",8,154,192),(706,1,"2014-09-11",9,154,197),(707,1,"2014-09-11",9,155,196),(708,1,"2014-09-11",6,153,191),(709,1,"2014-09-11",5,154,182),(710,1,"2014-09-11",11,153,197);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (711,1,"2014-09-11",2,155,198),(712,1,"2014-09-11",12,153,179),(713,1,"2014-09-11",11,154,183),(714,1,"2014-09-11",10,154,189),(715,1,"2014-09-11",12,155,179),(716,1,"2014-09-11",7,155,194),(717,1,"2014-09-11",6,153,191),(718,1,"2014-09-11",11,155,198),(719,1,"2014-09-11",1,155,179),(720,1,"2014-09-11",5,155,197);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (721,1,"2014-09-11",2,153,183),(722,1,"2014-09-11",10,155,185),(723,1,"2014-09-11",4,153,181),(724,1,"2014-09-11",8,154,178),(725,1,"2014-09-11",11,156,181),(726,1,"2014-09-11",9,156,197),(727,1,"2014-09-11",11,153,177),(728,1,"2014-09-11",11,154,180),(729,1,"2014-09-11",9,155,191),(730,1,"2014-09-11",5,153,194);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (731,1,"2014-09-11",11,155,177),(732,1,"2014-09-11",12,154,181),(733,1,"2014-09-11",8,153,192),(734,1,"2014-09-11",7,154,191),(735,1,"2014-09-11",12,156,187),(736,1,"2014-09-11",3,156,197),(737,1,"2014-09-11",10,155,192),(738,1,"2014-09-11",5,154,183),(739,1,"2014-09-11",1,154,192),(740,1,"2014-09-11",6,154,177);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (741,1,"2014-09-11",1,155,187),(742,1,"2014-09-11",9,155,190),(743,1,"2014-09-11",4,156,186),(744,1,"2014-09-11",10,154,183),(745,1,"2014-09-11",3,153,178),(746,1,"2014-09-11",6,155,193),(747,1,"2014-09-11",9,155,191),(748,1,"2014-09-11",10,153,180),(749,1,"2014-09-11",12,155,189),(750,1,"2014-09-11",4,155,179);



INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (751,1,"2014-09-12",8,139,7),(752,1,"2014-09-12",4,139,21),(753,1,"2014-09-12",12,139,11),(754,1,"2014-09-12",7,138,20),(755,1,"2014-09-12",5,139,1),(756,1,"2014-09-12",9,139,1),(757,1,"2014-09-12",1,140,16),(758,1,"2014-09-12",6,138,22),(759,1,"2014-09-12",12,137,18),(760,1,"2014-09-12",7,140,8);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (761,1,"2014-09-12",5,137,12),(762,1,"2014-09-12",12,140,21),(763,1,"2014-09-12",2,140,9),(764,1,"2014-09-12",3,137,6),(765,1,"2014-09-12",2,139,22),(766,1,"2014-09-12",9,137,2),(767,1,"2014-09-12",7,140,17),(768,1,"2014-09-12",6,140,13),(769,1,"2014-09-12",4,137,18),(770,1,"2014-09-12",5,139,17);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (771,1,"2014-09-12",12,137,21),(772,1,"2014-09-12",1,138,7),(773,1,"2014-09-12",8,138,19),(774,1,"2014-09-12",6,140,6),(775,1,"2014-09-12",8,137,6),(776,1,"2014-09-12",1,139,5),(777,1,"2014-09-12",6,139,15),(778,1,"2014-09-12",12,138,18),(779,1,"2014-09-12",12,137,19),(780,1,"2014-09-12",1,139,3);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (781,1,"2014-09-12",7,139,22),(782,1,"2014-09-12",9,138,7),(783,1,"2014-09-12",5,140,12),(784,1,"2014-09-12",12,138,19),(785,1,"2014-09-12",4,140,15),(786,1,"2014-09-12",1,139,15),(787,1,"2014-09-12",5,138,16),(788,1,"2014-09-12",12,140,1),(789,1,"2014-09-12",2,140,12),(790,1,"2014-09-12",4,140,7);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (791,1,"2014-09-12",4,137,10),(792,1,"2014-09-12",2,138,9),(793,1,"2014-09-12",5,138,19),(794,1,"2014-09-12",5,138,7),(795,1,"2014-09-12",9,138,16),(796,1,"2014-09-12",7,139,4),(797,1,"2014-09-12",9,140,21),(798,1,"2014-09-12",11,138,8),(799,1,"2014-09-12",4,139,22),(800,1,"2014-09-12",12,139,3);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (801,1,"2014-09-12",10,140,7),(802,1,"2014-09-12",7,140,16),(803,1,"2014-09-12",4,137,13),(804,1,"2014-09-12",8,137,9),(805,1,"2014-09-12",7,140,21),(806,1,"2014-09-12",1,140,12),(807,1,"2014-09-12",6,137,11),(808,1,"2014-09-12",8,140,13),(809,1,"2014-09-12",3,137,13),(810,1,"2014-09-12",12,138,1);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (811,1,"2014-09-12",12,138,10),(812,1,"2014-09-12",5,138,8),(813,1,"2014-09-12",9,137,14),(814,1,"2014-09-12",3,137,14),(815,1,"2014-09-12",7,138,22),(816,1,"2014-09-12",3,138,4),(817,1,"2014-09-12",5,140,22),(818,1,"2014-09-12",7,137,16),(819,1,"2014-09-12",11,137,3),(820,1,"2014-09-12",7,140,6);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (821,1,"2014-09-12",6,138,18),(822,1,"2014-09-12",3,138,22),(823,1,"2014-09-12",12,139,18),(824,1,"2014-09-12",2,137,7),(825,1,"2014-09-12",10,138,5),(826,1,"2014-09-12",8,139,2),(827,1,"2014-09-12",11,139,18),(828,1,"2014-09-12",4,137,15),(829,1,"2014-09-12",4,137,13),(830,1,"2014-09-12",3,139,21);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (831,1,"2014-09-12",10,138,14),(832,1,"2014-09-12",11,138,7),(833,1,"2014-09-12",4,139,3),(834,1,"2014-09-12",7,140,22),(835,1,"2014-09-12",9,139,11),(836,1,"2014-09-12",10,137,12),(837,1,"2014-09-12",8,139,8),(838,1,"2014-09-12",3,139,8),(839,1,"2014-09-12",12,139,1),(840,1,"2014-09-12",9,140,17);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (841,1,"2014-09-12",8,139,4),(842,1,"2014-09-12",12,139,6),(843,1,"2014-09-12",9,138,19),(844,1,"2014-09-12",3,137,12),(845,1,"2014-09-12",1,138,18),(846,1,"2014-09-12",11,139,17),(847,1,"2014-09-12",8,139,22),(848,1,"2014-09-12",3,140,19),(849,1,"2014-09-12",3,138,19),(850,1,"2014-09-12",9,138,6);

INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (851,1,"2014-09-12",12,119,167),(852,1,"2014-09-12",5,120,167),(853,1,"2014-09-12",5,117,167),(854,1,"2014-09-12",11,117,175),(855,1,"2014-09-12",5,117,167),(856,1,"2014-09-12",12,118,170),(857,1,"2014-09-12",2,119,163),(858,1,"2014-09-12",1,120,164),(859,1,"2014-09-12",12,119,155),(860,1,"2014-09-12",10,120,174);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (861,1,"2014-09-12",5,119,176),(862,1,"2014-09-12",1,119,155),(863,1,"2014-09-12",7,120,170),(864,1,"2014-09-12",5,119,158),(865,1,"2014-09-12",3,117,167),(866,1,"2014-09-12",5,117,170),(867,1,"2014-09-12",1,118,160),(868,1,"2014-09-12",1,117,166),(869,1,"2014-09-12",1,118,169),(870,1,"2014-09-12",7,117,168);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (871,1,"2014-09-12",3,120,176),(872,1,"2014-09-12",10,119,172),(873,1,"2014-09-12",3,117,166),(874,1,"2014-09-12",1,117,164),(875,1,"2014-09-12",9,120,172),(876,1,"2014-09-12",1,120,167),(877,1,"2014-09-12",12,117,175),(878,1,"2014-09-12",11,118,175),(879,1,"2014-09-12",8,119,160),(880,1,"2014-09-12",3,119,173);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (881,1,"2014-09-12",6,119,169),(882,1,"2014-09-12",12,118,172),(883,1,"2014-09-12",4,117,162),(884,1,"2014-09-12",7,119,160),(885,1,"2014-09-12",10,120,170),(886,1,"2014-09-12",3,120,158),(887,1,"2014-09-12",5,117,170),(888,1,"2014-09-12",4,120,175),(889,1,"2014-09-12",11,119,156),(890,1,"2014-09-12",7,119,169);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (891,1,"2014-09-12",4,119,165),(892,1,"2014-09-12",4,117,168),(893,1,"2014-09-12",4,119,155),(894,1,"2014-09-12",7,120,165),(895,1,"2014-09-12",6,120,155),(896,1,"2014-09-12",12,120,173),(897,1,"2014-09-12",9,119,160),(898,1,"2014-09-12",5,117,155),(899,1,"2014-09-12",5,117,156),(900,1,"2014-09-12",12,120,176);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (901,1,"2014-09-12",3,120,169),(902,1,"2014-09-12",11,119,170),(903,1,"2014-09-12",1,119,172),(904,1,"2014-09-12",8,117,164),(905,1,"2014-09-12",4,119,164),(906,1,"2014-09-12",1,118,165),(907,1,"2014-09-12",12,118,167),(908,1,"2014-09-12",12,117,166),(909,1,"2014-09-12",3,119,172),(910,1,"2014-09-12",2,119,163);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (911,1,"2014-09-12",11,118,160),(912,1,"2014-09-12",9,120,155),(913,1,"2014-09-12",12,119,165),(914,1,"2014-09-12",3,120,175),(915,1,"2014-09-12",6,117,157),(916,1,"2014-09-12",11,117,169),(917,1,"2014-09-12",11,117,159),(918,1,"2014-09-12",11,117,167),(919,1,"2014-09-12",7,117,169),(920,1,"2014-09-12",6,119,164);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (921,1,"2014-09-12",9,117,164),(922,1,"2014-09-12",8,117,156),(923,1,"2014-09-12",5,120,172),(924,1,"2014-09-12",9,117,167),(925,1,"2014-09-12",11,117,159),(926,1,"2014-09-12",7,117,164),(927,1,"2014-09-12",1,117,162),(928,1,"2014-09-12",6,117,175),(929,1,"2014-09-12",2,120,174),(930,1,"2014-09-12",6,119,171);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (931,1,"2014-09-12",9,119,155),(932,1,"2014-09-12",5,120,175),(933,1,"2014-09-12",2,120,164),(934,1,"2014-09-12",7,120,159),(935,1,"2014-09-12",10,118,173),(936,1,"2014-09-12",2,120,162),(937,1,"2014-09-12",6,119,159),(938,1,"2014-09-12",1,117,171),(939,1,"2014-09-12",10,120,168),(940,1,"2014-09-12",8,119,159);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (941,1,"2014-09-12",7,119,156),(942,1,"2014-09-12",5,117,173),(943,1,"2014-09-12",1,119,169),(944,1,"2014-09-12",1,119,170),(945,1,"2014-09-12",8,119,156),(946,1,"2014-09-12",2,118,173),(947,1,"2014-09-12",7,119,176),(948,1,"2014-09-12",4,119,162),(949,1,"2014-09-12",4,117,169),(950,1,"2014-09-12",5,120,157);

INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (951,1,"2014-09-12",2,179,35),(952,1,"2014-09-12",10,179,40),(953,1,"2014-09-12",10,179,33),(954,1,"2014-09-12",9,178,35),(955,1,"2014-09-12",9,178,26),(956,1,"2014-09-12",10,180,34),(957,1,"2014-09-12",5,179,33),(958,1,"2014-09-12",6,178,43),(959,1,"2014-09-12",5,179,39),(960,1,"2014-09-12",3,179,36);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (961,1,"2014-09-12",1,179,32),(962,1,"2014-09-12",10,179,26),(963,1,"2014-09-12",10,178,44),(964,1,"2014-09-12",8,178,28),(965,1,"2014-09-12",2,179,27),(966,1,"2014-09-12",4,179,41),(967,1,"2014-09-12",12,180,43),(968,1,"2014-09-12",5,179,36),(969,1,"2014-09-12",12,178,26),(970,1,"2014-09-12",2,179,33);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (971,1,"2014-09-12",5,179,41),(972,1,"2014-09-12",7,178,41),(973,1,"2014-09-12",6,180,40),(974,1,"2014-09-12",8,179,37),(975,1,"2014-09-12",8,178,24),(976,1,"2014-09-12",3,179,39),(977,1,"2014-09-12",12,179,39),(978,1,"2014-09-12",9,178,37),(979,1,"2014-09-12",10,178,32),(980,1,"2014-09-12",8,179,34);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (981,1,"2014-09-12",2,179,24),(982,1,"2014-09-12",10,178,40),(983,1,"2014-09-12",2,179,35),(984,1,"2014-09-12",2,178,32),(985,1,"2014-09-12",8,179,34),(986,1,"2014-09-12",8,178,25),(987,1,"2014-09-12",7,178,27),(988,1,"2014-09-12",7,179,37),(989,1,"2014-09-12",12,178,31),(990,1,"2014-09-12",7,179,43);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (991,1,"2014-09-12",11,180,30),(992,1,"2014-09-12",7,178,26),(993,1,"2014-09-12",5,178,31),(994,1,"2014-09-12",10,180,31),(995,1,"2014-09-12",10,180,37),(996,1,"2014-09-12",2,180,34),(997,1,"2014-09-12",3,178,34),(998,1,"2014-09-12",2,178,28),(999,1,"2014-09-12",9,180,40),(1000,1,"2014-09-12",4,179,29);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1001,1,"2014-09-12",5,179,29),(1002,1,"2014-09-12",11,180,35),(1003,1,"2014-09-12",3,179,35),(1004,1,"2014-09-12",6,179,30),(1005,1,"2014-09-12",4,180,42),(1006,1,"2014-09-12",7,179,36),(1007,1,"2014-09-12",12,178,37),(1008,1,"2014-09-12",7,180,34),(1009,1,"2014-09-12",3,180,35),(1010,1,"2014-09-12",9,179,40);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1011,1,"2014-09-12",11,179,34),(1012,1,"2014-09-12",10,180,34),(1013,1,"2014-09-12",12,179,23),(1014,1,"2014-09-12",5,178,35),(1015,1,"2014-09-12",2,180,39),(1016,1,"2014-09-12",11,180,27),(1017,1,"2014-09-12",2,178,28),(1018,1,"2014-09-12",5,179,35),(1019,1,"2014-09-12",8,179,37),(1020,1,"2014-09-12",1,180,29);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1021,1,"2014-09-12",1,178,30),(1022,1,"2014-09-12",9,178,38),(1023,1,"2014-09-12",4,179,44),(1024,1,"2014-09-12",6,179,44),(1025,1,"2014-09-12",11,180,32),(1026,1,"2014-09-12",8,180,40),(1027,1,"2014-09-12",3,180,25),(1028,1,"2014-09-12",7,179,32),(1029,1,"2014-09-12",11,178,25),(1030,1,"2014-09-12",8,179,36);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1031,1,"2014-09-12",10,178,29),(1032,1,"2014-09-12",5,179,43),(1033,1,"2014-09-12",12,179,42),(1034,1,"2014-09-12",8,178,38),(1035,1,"2014-09-12",4,180,37),(1036,1,"2014-09-12",10,180,32),(1037,1,"2014-09-12",6,180,25),(1038,1,"2014-09-12",3,180,42),(1039,1,"2014-09-12",10,180,39),(1040,1,"2014-09-12",4,179,23);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1041,1,"2014-09-12",5,179,43),(1042,1,"2014-09-12",9,180,34),(1043,1,"2014-09-12",7,180,40),(1044,1,"2014-09-12",3,178,40),(1045,1,"2014-09-12",9,178,39),(1046,1,"2014-09-12",7,180,33),(1047,1,"2014-09-12",12,180,25),(1048,1,"2014-09-12",9,179,27),(1049,1,"2014-09-12",7,178,44),(1050,1,"2014-09-12",2,178,28);

INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1051,1,"2014-09-12",1,158,178),(1052,1,"2014-09-12",3,157,194),(1053,1,"2014-09-12",11,157,183),(1054,1,"2014-09-12",2,158,178),(1055,1,"2014-09-12",9,157,189),(1056,1,"2014-09-12",3,158,191),(1057,1,"2014-09-12",11,160,193),(1058,1,"2014-09-12",1,157,182),(1059,1,"2014-09-12",11,157,182),(1060,1,"2014-09-12",12,157,195);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1061,1,"2014-09-12",8,158,191),(1062,1,"2014-09-12",7,159,183),(1063,1,"2014-09-12",11,157,189),(1064,1,"2014-09-12",6,159,191),(1065,1,"2014-09-12",12,159,181),(1066,1,"2014-09-12",5,157,194),(1067,1,"2014-09-12",8,159,181),(1068,1,"2014-09-12",7,159,198),(1069,1,"2014-09-12",10,160,195),(1070,1,"2014-09-12",11,160,184);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1071,1,"2014-09-12",2,160,191),(1072,1,"2014-09-12",6,157,196),(1073,1,"2014-09-12",6,157,185),(1074,1,"2014-09-12",6,160,182),(1075,1,"2014-09-12",9,159,192),(1076,1,"2014-09-12",3,159,192),(1077,1,"2014-09-12",11,157,195),(1078,1,"2014-09-12",5,158,187),(1079,1,"2014-09-12",4,159,188),(1080,1,"2014-09-12",2,160,177);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1081,1,"2014-09-12",3,157,195),(1082,1,"2014-09-12",8,160,177),(1083,1,"2014-09-12",7,157,188),(1084,1,"2014-09-12",2,157,188),(1085,1,"2014-09-12",8,158,190),(1086,1,"2014-09-12",8,158,187),(1087,1,"2014-09-12",9,157,197),(1088,1,"2014-09-12",2,158,183),(1089,1,"2014-09-12",11,159,195),(1090,1,"2014-09-12",9,159,187);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1091,1,"2014-09-12",2,157,183),(1092,1,"2014-09-12",8,157,196),(1093,1,"2014-09-12",1,159,177),(1094,1,"2014-09-12",6,157,194),(1095,1,"2014-09-12",3,158,198),(1096,1,"2014-09-12",7,159,196),(1097,1,"2014-09-12",2,160,191),(1098,1,"2014-09-12",4,160,180),(1099,1,"2014-09-12",12,160,182),(1100,1,"2014-09-12",7,158,181);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1101,1,"2014-09-12",12,159,185),(1102,1,"2014-09-12",9,159,182),(1103,1,"2014-09-12",11,157,183),(1104,1,"2014-09-12",4,158,181),(1105,1,"2014-09-12",8,157,180),(1106,1,"2014-09-12",5,159,187),(1107,1,"2014-09-12",10,158,191),(1108,1,"2014-09-12",11,159,179),(1109,1,"2014-09-12",3,157,195),(1110,1,"2014-09-12",8,159,181);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1111,1,"2014-09-12",8,159,191),(1112,1,"2014-09-12",4,157,187),(1113,1,"2014-09-12",6,157,181),(1114,1,"2014-09-12",7,159,189),(1115,1,"2014-09-12",11,157,188),(1116,1,"2014-09-12",4,160,192),(1117,1,"2014-09-12",5,157,191),(1118,1,"2014-09-12",3,160,189),(1119,1,"2014-09-12",2,160,177),(1120,1,"2014-09-12",4,157,188);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1121,1,"2014-09-12",5,159,184),(1122,1,"2014-09-12",5,158,189),(1123,1,"2014-09-12",7,159,196),(1124,1,"2014-09-12",7,160,189),(1125,1,"2014-09-12",2,159,177),(1126,1,"2014-09-12",10,158,184),(1127,1,"2014-09-12",3,158,190),(1128,1,"2014-09-12",2,159,178),(1129,1,"2014-09-12",9,160,195),(1130,1,"2014-09-12",6,160,185);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1131,1,"2014-09-12",7,158,189),(1132,1,"2014-09-12",11,160,186),(1133,1,"2014-09-12",7,157,197),(1134,1,"2014-09-12",12,158,182),(1135,1,"2014-09-12",6,159,184),(1136,1,"2014-09-12",8,157,179),(1137,1,"2014-09-12",2,158,184),(1138,1,"2014-09-12",2,159,178),(1139,1,"2014-09-12",2,159,191),(1140,1,"2014-09-12",5,160,182);
INSERT INTO `JOURNAL` (`id`,`coefficient`,`date`,`mark`,`scheduleId`,`studentId`) VALUES (1141,1,"2014-09-12",6,157,179),(1142,1,"2014-09-12",10,159,195),(1143,1,"2014-09-12",8,159,180),(1144,1,"2014-09-12",3,157,197),(1145,1,"2014-09-12",6,160,197),(1146,1,"2014-09-12",8,157,192),(1147,1,"2014-09-12",12,158,198),(1148,1,"2014-09-12",5,159,184),(1149,1,"2014-09-12",11,158,194),(1150,1,"2014-09-12",10,159,194);
INSERT INTO `NEWS` VALUES (1,'The start of school is the most exciting time of the year for students!\n\nThey want to meet their teachers, catch up with their friends, and begin exploring a whole new world of knowledge. As exciting as these first weeks of school are, your children can\'t do this on their own. They need your help to get readynow and every day. You need to read aloud to young children to reinforce the importance of literacy. You have to be ready to help them when they\'re stuck on homework. You should make sure they have a nutritious lunch every day. You need to build relationships with their teachers so you\'re all working together to provide your children the best learning experience possible. Helping your children with school is one of your most important jobs as a parent. That\'s why the U.S. Department of Education, National PTA, and Parenting have teamed up to bring you Countdown to School Success. This booklet takes you step-by-step through the typical school-year calendar, explaining how you can help your children at home, support them in the classroom, and assist their teachers as they address each of your children\'s unique abilities. We hope your whole family enjoys following this road map to the exciting year ahead.',1,'Educational success'),(2,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',0,'It competiton'),(3,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',0,'Mathematical competiton'),(4,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',0,'Chemistry competition'),(5,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',1,'Something'),(6,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',1,'Interesting'),(7,'This integration is done simply by including the DataTables Bootstrap files (CSS and JS) which will set the defaults needed for DataTables to be initialised as normal, as shown in this examples.',0,'Winners of competition');


DELETE FROM `JOURNAL` 
WHERE
    `id` = '477';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '480';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '504';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '517';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '518';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '519';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '527';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '531';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '539';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '471';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '474';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '494';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '495';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '502';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '515';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '525';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '528';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '530';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '548';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '488';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '491';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '507';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '509';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '510';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '511';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '534';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '537';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '538';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '542';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '853';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '865';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '868';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '877';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '887';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '892';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '904';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '908';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '919';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '921';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '922';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '926';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '927';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '928';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '949';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '918';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '911';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '946';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '862';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '890';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '893';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '897';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '909';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '910';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '913';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '920';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '937';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '941';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '943';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '944';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '945';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '947';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '876';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '885';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '900';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '912';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '914';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '369';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '375';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '379';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '389';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '393';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '399';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '401';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '403';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '421';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '439';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '442';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '444';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '433';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '446';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '361';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '385';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '417';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '419';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '420';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '448';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '380';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '388';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '405';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '406';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '422';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '436';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '368';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '370';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '378';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '398';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '409';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '377';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '423';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '443';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '769';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '809';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '814';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '764';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '761';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '803';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '844';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '828';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '782';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '784';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '793';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '794';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '812';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '815';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '773';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '778';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '822';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '832';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '772';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '756';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '780';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '799';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '823';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '833';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '835';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '796';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '838';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '839';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '765';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '770';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '768';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '802';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '805';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '806';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '774';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '783';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '797';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '801';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '834';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '679';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '682';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '658';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '723';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '703';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '657';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '669';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '695';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '698';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '686';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '700';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '673';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '685';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '705';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '671';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '713';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '653';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '715';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '652';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '666';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '718';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '719';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '741';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '749';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '747';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '676';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '660';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '684';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '694';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '726';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '736';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1059';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1066';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1077';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1083';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1091';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1092';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1094';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1103';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1115';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1120';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1141';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1144';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1087';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1054';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1061';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1086';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1104';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1107';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1127';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1131';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1137';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1147';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1067';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1076';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1110';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1111';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1123';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1125';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1138';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1139';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1135';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1142';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1148';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1106';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1082';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1097';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1099';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1119';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1124';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1130';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1140';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '574';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '577';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '578';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '585';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '595';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '602';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '606';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '608';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '618';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '620';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '596';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '633';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '638';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '647';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '649';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '561';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '562';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '579';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '588';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '592';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '598';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '601';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '605';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '610';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '623';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '628';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '600';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '604';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '637';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '646';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '567';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '582';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '591';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '599';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '603';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '609';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '612';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '616';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '622';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '624';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '625';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '635';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '644';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '645';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '969';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '984';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '992';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '993';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '998';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1007';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1014';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1017';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1029';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1034';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1044';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1049';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1050';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '957';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '968';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '970';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '971';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '976';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '977';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '985';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1001';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1003';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '983';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '988';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1004';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1006';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1010';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1011';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1018';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1019';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1024';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1041';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '965';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1040';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1028';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '999';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1008';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1012';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1026';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1035';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1036';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1038';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1039';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1042';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1043';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1047';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '996';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1037';
DELETE FROM `JOURNAL` 
WHERE
    `id` = '1009';