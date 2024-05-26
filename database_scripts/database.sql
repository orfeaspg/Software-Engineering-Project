DROP DATABASE IF EXISTS recovery_road;
CREATE DATABASE recovery_road;
USE recovery_road;

CREATE TABLE `articles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail_path` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `chat_rooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `external_links` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `thumbnail_path` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `timestamps` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `img_path` text NOT NULL,
  `sent_ap` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `contact_forms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `personal_diary_content` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `roles` (
  `role_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `room_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_id` bigint NOT NULL,
  `message_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_room_messages_room` (`room_id`),
  KEY `fk_room_messages_messages` (`message_id`),
  CONSTRAINT `fk_room_messages_messages` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_room_messages_room` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `anonymous` boolean DEFAULT 0 NOT NULL,
  `timestamps` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_roles` (`role_id`),
  CONSTRAINT `fk_user_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `streak_counter` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_streak_counter_user` (`user_id`),
  CONSTRAINT `fk_streak_counter_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `users_diary_contents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `personal_diary_id` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_diary_user` (`user_id`),
  KEY `fk_user_diary_personal` (`personal_diary_id`),
  CONSTRAINT `fk_user_diary_personal` FOREIGN KEY (`personal_diary_id`) REFERENCES `personal_diary_content` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_diary_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `user_chat_rooms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `room_id` bigint NOT NULL,
  `join_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_rooms_user` (`user_id`),
  KEY `fk_user_rooms_rooms` (`room_id`),
  CONSTRAINT `fk_user_rooms_rooms` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_rooms_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE `user_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `message_id` bigint NOT NULL,
  `timestamps` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_messages_user` (`user_id`),
  KEY `fk_user_messages_messages` (`message_id`),
  CONSTRAINT `fk_user_messages_messages` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_user_messages_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


INSERT INTO roles (role_id, name, label) VALUES
(1, 'user', 'User'),
(2, 'admin', 'Administrator'),
(3, 'moderator', 'Moderator'),
(4, 'therapist', 'Therapist'),
(5, 'volunteer', 'Volunteer');

INSERT INTO user (id, username, password, email, role_id, timestamps) VALUES
(1, 'Akis', 'akis1', 'akis@example.com', 2, NOW()),
(2, 'Elena', 'elena1', 'elena@example.com', 2, NOW()),
(3, 'Iro', 'iro1', 'iro@example.com', 2, NOW()),
(4, 'Orfeas', 'orfeas1', 'orfeas@example.com', 2, NOW()),
(5, 'Thomas', 'thomas1', 'thomas@example.com', 2, NOW()),
(6, 'Chris', 'password1', 'chris@example.com', 1, NOW()),
(7, 'Sia', 'password1', 'sia@example.com', 3, NOW()),
(8, 'Bob', 'password1', 'bob@example.com', 4, NOW()),
(9, 'Mary', 'password1', 'mary@example.com', 5, NOW());


INSERT INTO external_links (id, title, description, url, thumbnail_path) VALUES
(1, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 'https://mapy.cz/eros/elementum/pellentesque/quisque.html?congue=aliquam&eget=lacus&semper=morbi&rutrum=quis&nulla=tortor&nunc=id&purus=nulla&phasellus=ultrices&in=aliquet&felis=maecenas&donec=leo&semper=odio&sapien=condimentum&a=id&libero=luctus&nam=nec&dui=molestie&proin=sed&leo=justo&odio=pellentesque&porttitor=viverra&id=pede&consequat=ac&in=diam&consequat=cras&ut=pellentesque&nulla=volutpat&sed=dui&accumsan=maecenas&felis=tristique&ut=est&at=et&dolor=tempus&quis=semper&odio=est&consequat=quam&varius=pharetra&integer=magna&ac=ac&leo=consequat&pellentesque=metus&ultrices=sapien&mattis=ut&odio=nunc&donec=vestibulum&vitae=ante&nisi=ipsum&nam=primis&ultrices=in&libero=faucibus&non=orci&mattis=luctus&pulvinar=et&nulla=ultrices&pede=posuere&ullamcorper=cubilia&augue=curae&a=mauris&suscipit=viverra&nulla=diam&elit=vitae&ac=quam&nulla=suspendisse&sed=potenti&vel=nullam&enim=porttitor&sit=lacus&amet=at&nunc=turpis&viverra=donec&dapibus=posuere&nulla=metus&suscipit=vitae&ligula=ipsum&in=aliquam&lacus=non&curabitur=mauris&at=morbi&ipsum=non&ac=lectus&tellus=aliquam&semper=sit&interdum=amet&mauris=diam&ullamcorper=in&purus=magna&sit=bibendum&amet=imperdiet&nulla=nullam&quisque=orci&arcu=pede&libero=venenatis','/main/images/article1.jpg'),
(2, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://arstechnica.com/accumsan/felis.jsp?justo=ipsum&in=dolor&blandit=sit&ultrices=amet&enim=consectetuer&lorem=adipiscing&ipsum=elit&dolor=proin&sit=interdum&amet=mauris&consectetuer=non&adipiscing=ligula&elit=pellentesque&proin=ultrices&interdum=phasellus&mauris=id&non=sapien&ligula=in&pellentesque=sapien&ultrices=iaculis&phasellus=congue&id=vivamus&sapien=metus&in=arcu&sapien=adipiscing&iaculis=molestie&congue=hendrerit&vivamus=at&metus=vulputate&arcu=vitae&adipiscing=nisl&molestie=aenean&hendrerit=lectus&at=pellentesque&vulputate=eget&vitae=nunc&nisl=donec&aenean=quis&lectus=orci&pellentesque=eget&eget=orci&nunc=vehicula&donec=condimentum&quis=curabitur&orci=in&eget=libero&orci=ut&vehicula=massa&condimentum=volutpat&curabitur=convallis', '/main/images/article2.jpg'),
(3, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://reuters.com/suspendisse/potenti/nullam/porttitor.jsp?ante=tincidunt&ipsum=eget&primis=tempus&in=vel', '/main/images/article1.jpg'),
(4, 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'https://tmall.com/mauris/sit/amet/eros/suspendisse/accumsan/tortor.xml?dis=aliquet&parturient=maecenas&montes=leo&nascetur=odio&ridiculus=condimentum&mus=id&etiam=luctus&vel=nec&augue=molestie&vestibulum=sed&rutrum=justo&rutrum=pellentesque&neque=viverra&aenean=pede&auctor=ac&gravida=diam&sem=cras&praesent=pellentesque&id=volutpat&massa=dui&id=maecenas&nisl=tristique&venenatis=est&lacinia=et&aenean=tempus&sit=semper&amet=est&justo=quam&morbi=pharetra&ut=magna&odio=ac&cras=consequat&mi=metus&pede=sapien&malesuada=ut&in=nunc&imperdiet=vestibulum&et=ante&commodo=ipsum&vulputate=primis&justo=in&in=faucibus&blandit=orci&ultrices=luctus&enim=et&lorem=ultrices&ipsum=posuere&dolor=cubilia&sit=curae&amet=mauris&consectetuer=viverra&adipiscing=diam&elit=vitae&proin=quam&interdum=suspendisse&mauris=potenti&non=nullam&ligula=porttitor&pellentesque=lacus&ultrices=at&phasellus=turpis&id=donec&sapien=posuere&in=metus&sapien=vitae&iaculis=ipsum&congue=aliquam&vivamus=non&metus=mauris&arcu=morbi&adipiscing=non&molestie=lectus&hendrerit=aliquam&at=sit&vulputate=amet&vitae=diam&nisl=in&aenean=magna&lectus=bibendum', '/main/images/article1.jpg'),
(5, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'https://spiegel.de/vestibulum/ac/est/lacinia/nisi/venenatis.jpg?est=eget&phasellus=elit&sit=sodales&amet=scelerisque&erat=mauris&nulla=sit&tempus=amet&vivamus=eros&in=suspendisse&felis=accumsan&eu=tortor&sapien=quis&cursus=turpis&vestibulum=sed&proin=ante&eu=vivamus&mi=tortor&nulla=duis&ac=mattis&enim=egestas&in=metus&tempor=aenean&turpis=fermentum&nec=donec&euismod=ut&scelerisque=mauris&quam=eget&turpis=massa&adipiscing=tempor&lorem=convallis&vitae=nulla&mattis=neque&nibh=libero&ligula=convallis&nec=eget&sem=eleifend&duis=luctus&aliquam=ultricies&convallis=eu&nunc=nibh&proin=quisque&at=id&turpis=justo&a=sit&pede=amet&posuere=sapien&nonummy=dignissim&integer=vestibulum&non=vestibulum&velit=ante&donec=ipsum&diam=primis', '/main/images/article1.jpg'),
(6, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'http://multiply.com/condimentum/curabitur/in/libero/ut/massa.aspx?in=integer&blandit=ac&ultrices=neque&enim=duis&lorem=bibendum&ipsum=morbi&dolor=non&sit=quam&amet=nec&consectetuer=dui&adipiscing=luctus&elit=rutrum&proin=nulla&interdum=tellus&mauris=in&non=sagittis&ligula=dui&pellentesque=vel&ultrices=nisl&phasellus=duis&id=ac&sapien=nibh&in=fusce&sapien=lacus&iaculis=purus&congue=aliquet&vivamus=at&metus=feugiat&arcu=non&adipiscing=pretium&molestie=quis&hendrerit=lectus&at=suspendisse&vulputate=potenti&vitae=in&nisl=eleifend&aenean=quam&lectus=a&pellentesque=odio&eget=in&nunc=hac&donec=habitasse&quis=platea&orci=dictumst&eget=maecenas&orci=ut&vehicula=massa&condimentum=quis&curabitur=augue&in=luctus&libero=tincidunt&ut=nulla&massa=mollis&volutpat=molestie&convallis=lorem&morbi=quisque&odio=ut&odio=erat&elementum=curabitur&eu=gravida&interdum=nisi&eu=at&tincidunt=nibh&in=in&leo=hac&maecenas=habitasse&pulvinar=platea&lobortis=dictumst&est=aliquam&phasellus=augue&sit=quam&amet=sollicitudin&erat=vitae&nulla=consectetuer&tempus=eget&vivamus=rutrum&in=at&felis=lorem&eu=integer&sapien=tincidunt&cursus=ante&vestibulum=vel&proin=ipsum&eu=praesent&mi=blandit&nulla=lacinia&ac=erat&enim=vestibulum&in=sed&tempor=magna', '/main/images/article1.jpg'),
(7, 'Morbi a ipsum. Integer a nibh. In quis justo.', 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 'http://nhs.uk/donec/vitae.jsp?vestibulum=molestie&eget=lorem&vulputate=quisque&ut=ut&ultrices=erat&vel=curabitur&augue=gravida&vestibulum=nisi&ante=at&ipsum=nibh&primis=in&in=hac&faucibus=habitasse&orci=platea&luctus=dictumst&et=aliquam&ultrices=augue&posuere=quam&cubilia=sollicitudin&curae=vitae&donec=consectetuer&pharetra=eget&magna=rutrum&vestibulum=at&aliquet=lorem&ultrices=integer&erat=tincidunt', '/main/images/article1.jpg'),
(8, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'Quisque id justo sit amet sapien dignissim vestibulum.', 'https://reverbnation.com/sapien/quis/libero/nullam.jpg?odio=potenti&cras=in&mi=eleifend&pede=quam&malesuada=a&in=odio&imperdiet=in&et=hac&commodo=habitasse&vulputate=platea&justo=dictumst&in=maecenas&blandit=ut&ultrices=massa&enim=quis&lorem=augue&ipsum=luctus&dolor=tincidunt&sit=nulla&amet=mollis&consectetuer=molestie&adipiscing=lorem&elit=quisque&proin=ut&interdum=erat&mauris=curabitur&non=gravida&ligula=nisi&pellentesque=at&ultrices=nibh&phasellus=in&id=hac&sapien=habitasse&in=platea&sapien=dictumst&iaculis=aliquam&congue=augue&vivamus=quam&metus=sollicitudin&arcu=vitae&adipiscing=consectetuer&molestie=eget&hendrerit=rutrum&at=at&vulputate=lorem&vitae=integer&nisl=tincidunt&aenean=ante&lectus=vel&pellentesque=ipsum&eget=praesent&nunc=blandit&donec=lacinia&quis=erat&orci=vestibulum&eget=sed&orci=magna&vehicula=at&condimentum=nunc&curabitur=commodo&in=placerat&libero=praesent&ut=blandit&massa=nam&volutpat=nulla&convallis=integer&morbi=pede&odio=justo&odio=lacinia&elementum=eget&eu=tincidunt&interdum=eget&eu=tempus&tincidunt=vel&in=pede&leo=morbi&maecenas=porttitor&pulvinar=lorem&lobortis=id&est=ligula&phasellus=suspendisse&sit=ornare&amet=consequat&erat=lectus&nulla=in&tempus=est&vivamus=risus&in=auctor&felis=sed&eu=tristique&sapien=in&cursus=tempus&vestibulum=sit&proin=amet&eu=sem&mi=fusce&nulla=consequat&ac=nulla&enim=nisl', '/main/images/article1.jpg'),
(9, 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'http://blogtalkradio.com/quis/orci/nullam.jsp?justo=sem&eu=sed&massa=sagittis&donec=nam&dapibus=congue&duis=risus&at=semper&velit=porta&eu=volutpat&est=quam&congue=pede&elementum=lobortis&in=ligula&hac=sit&habitasse=amet&platea=eleifend&dictumst=pede&morbi=libero&vestibulum=quis&velit=orci&id=nullam&pretium=molestie&iaculis=nibh&diam=in&erat=lectus&fermentum=pellentesque&justo=at&nec=nulla&condimentum=suspendisse&neque=potenti&sapien=cras&placerat=in&ante=purus&nulla=eu&justo=magna&aliquam=vulputate&quis=luctus&turpis=cum&eget=sociis&elit=natoque&sodales=penatibus&scelerisque=et&mauris=magnis&sit=dis&amet=parturient&eros=montes&suspendisse=nascetur&accumsan=ridiculus&tortor=mus&quis=vivamus&turpis=vestibulum&sed=sagittis&ante=sapien&vivamus=cum&tortor=sociis&duis=natoque&mattis=penatibus', '/main/images/article1.jpg'),
(10, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'https://google.ca/justo/sollicitudin.aspx?nec=vulputate&nisi=vitae&volutpat=nisl&eleifend=aenean&donec=lectus&ut=pellentesque&dolor=eget&morbi=nunc&vel=donec&lectus=quis&in=orci&quam=eget&fringilla=orci&rhoncus=vehicula&mauris=condimentum&enim=curabitur&leo=in&rhoncus=libero&sed=ut&vestibulum=massa&sit=volutpat&amet=convallis&cursus=morbi&id=odio&turpis=odio&integer=elementum&aliquet=eu&massa=interdum&id=eu&lobortis=tincidunt&convallis=in&tortor=leo&risus=maecenas&dapibus=pulvinar&augue=lobortis&vel=est&accumsan=phasellus&tellus=sit&nisi=amet&eu=erat&orci=nulla&mauris=tempus&lacinia=vivamus&sapien=in&quis=felis&libero=eu&nullam=sapien&sit=cursus&amet=vestibulum&turpis=proin&elementum=eu&ligula=mi&vehicula=nulla&consequat=ac&morbi=enim&a=in&ipsum=tempor&integer=turpis&a=nec&nibh=euismod&in=scelerisque&quis=quam&justo=turpis&maecenas=adipiscing&rhoncus=lorem&aliquam=vitae&lacus=mattis&morbi=nibh&quis=ligula&tortor=nec&id=sem&nulla=duis&ultrices=aliquam&aliquet=convallis&maecenas=nunc&leo=proin&odio=at&condimentum=turpis&id=a&luctus=pede&nec=posuere&molestie=nonummy&sed=integer&justo=non&pellentesque=velit&viverra=donec&pede=diam&ac=neque&diam=vestibulum&cras=eget&pellentesque=vulputate&volutpat=ut&dui=ultrices&maecenas=vel', '/main/images/article1.jpg');


INSERT INTO articles (id, title, description, thumbnail_path) VALUES
(1, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '/main/images/feed-1.jpg'),
(2, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', '/main/images/feed-2.jpg'),
(3, 'Aenean lectus. Pellentesque eget nunc.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', '/main/images/feed-3.jpg'),
(4, 'Vivamus tortor. Duis mattis egestas metus.', 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', '/main/images/feed-4.jpg'),
(5, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 'Suspendisse potenti. In eleifend quam a odio.', '/main/images/feed-5.jpg'),
(6, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '/main/images/feed-6.jpg'),
(7, 'In congue. Etiam justo. Etiam pretium iaculis justo.', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '/main/images/feed-7.jpg'),
(8, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '/main/images/feed-1.jpg'),
(9, 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '/main/images/feed-2.jpg'),
(10, 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', '/main/images/feed-3.jpg');