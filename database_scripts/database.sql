DROP DATABASE IF EXISTS recovery_road;
CREATE DATABASE recovery_road;
USE recovery_road;

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `website_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `thumbnail_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `articles`
--

INSERT INTO `articles` (`id`, `title`, `website_name`, `description`, `url`, `thumbnail_path`) VALUES
(1, 'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Integer non velit. ', NULL, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', NULL, '/main/images/feed-1.jpg'),
(2, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', NULL, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', NULL, '/main/images/feed-2.jpg'),
(3, 'Aenean lectus. Pellentesque eget nunc.', NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', NULL, '/main/images/feed-3.jpg'),
(4, 'Vivamus tortor. Duis mattis egestas metus.', NULL, 'Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', NULL, '/main/images/feed-4.jpg'),
(5, 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', NULL, 'Suspendisse potenti. In eleifend quam a odio.', NULL, '/main/images/feed-5.jpg'),
(6, 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', NULL, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', NULL, '/main/images/feed-6.jpg'),
(7, 'In congue. Etiam justo. Etiam pretium iaculis justo.', NULL, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', NULL, '/main/images/feed-7.jpg'),
(8, 'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', NULL, 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, '/main/images/feed-1.jpg'),
(9, 'In hac habitasse platea dictumst. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', NULL, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', NULL, '/main/images/feed-2.jpg'),
(10, 'Duis consequat dui nec nisi volutpat eleifend. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', NULL, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', NULL, '/main/images/feed-3.jpg');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `chat_rooms`
--

CREATE TABLE `chat_rooms` (
  `id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `chat_rooms`
--

INSERT INTO `chat_rooms` (`id`, `title`, `description`) VALUES
(1, 'Bad Day on the Block', 'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'),
(2, 'Fantastic Flesh: The Art of Make-Up EFX', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna.'),
(3, 'Flock, The', 'Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.'),
(4, 'På sista versen', 'Nulla mollis molestie lorem.'),
(5, 'Diary of a Wimpy Kid: Rodrick Rules', 'Phasellus in felis. Donec semper sapien a libero.'),
(6, 'Absolon', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo.'),
(7, 'Hard Ticket to Hawaii', 'Proin interdum mauris non ligula pellentesque ultrices.'),
(8, 'Crocodile', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.'),
(9, 'Kiss, The', 'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.'),
(10, 'Piranha', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `contact_forms`
--

CREATE TABLE `contact_forms` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `external_links`
--

CREATE TABLE `external_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `description` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `thumbnail_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `external_links`
--

INSERT INTO `external_links` (`id`, `title`, `description`, `url`, `thumbnail_path`) VALUES
(1, 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.', 'https://mapy.cz/eros/elementum/pellentesque/quisque.html?congue=aliquam&eget=lacus&semper=morbi&rutrum=quis&nulla=tortor&nunc=id&purus=nulla&phasellus=ultrices&in=aliquet&felis=maecenas&donec=leo&semper=odio&sapien=condimentum&a=id&libero=luctus&nam=nec&dui=molestie&proin=sed&leo=justo&odio=pellentesque&porttitor=viverra&id=pede&consequat=ac&in=diam&consequat=cras&ut=pellentesque&nulla=volutpat&sed=dui&accumsan=maecenas&felis=tristique&ut=est&at=et&dolor=tempus&quis=semper&odio=est&consequat=quam&varius=pharetra&integer=magna&ac=ac&leo=consequat&pellentesque=metus&ultrices=sapien&mattis=ut&odio=nunc&donec=vestibulum&vitae=ante&nisi=ipsum&nam=primis&ultrices=in&libero=faucibus&non=orci&mattis=luctus&pulvinar=et&nulla=ultrices&pede=posuere&ullamcorper=cubilia&augue=curae&a=mauris&suscipit=viverra&nulla=diam&elit=vitae&ac=quam&nulla=suspendisse&sed=potenti&vel=nullam&enim=porttitor&sit=lacus&amet=at&nunc=turpis&viverra=donec&dapibus=posuere&nulla=metus&suscipit=vitae&ligula=ipsum&in=aliquam&lacus=non&curabitur=mauris&at=morbi&ipsum=non&ac=lectus&tellus=aliquam&semper=sit&interdum=amet&mauris=diam&ullamcorper=in&purus=magna&sit=bibendum&amet=imperdiet&nulla=nullam&quisque=orci&arcu=pede&libero=venenatis', '/main/images/article1.jpg'),
(2, 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.', 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 'http://arstechnica.com/accumsan/felis.jsp?justo=ipsum&in=dolor&blandit=sit&ultrices=amet&enim=consectetuer&lorem=adipiscing&ipsum=elit&dolor=proin&sit=interdum&amet=mauris&consectetuer=non&adipiscing=ligula&elit=pellentesque&proin=ultrices&interdum=phasellus&mauris=id&non=sapien&ligula=in&pellentesque=sapien&ultrices=iaculis&phasellus=congue&id=vivamus&sapien=metus&in=arcu&sapien=adipiscing&iaculis=molestie&congue=hendrerit&vivamus=at&metus=vulputate&arcu=vitae&adipiscing=nisl&molestie=aenean&hendrerit=lectus&at=pellentesque&vulputate=eget&vitae=nunc&nisl=donec&aenean=quis&lectus=orci&pellentesque=eget&eget=orci&nunc=vehicula&donec=condimentum&quis=curabitur&orci=in&eget=libero&orci=ut&vehicula=massa&condimentum=volutpat&curabitur=convallis', '/main/images/article2.jpg'),
(3, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 'http://reuters.com/suspendisse/potenti/nullam/porttitor.jsp?ante=tincidunt&ipsum=eget&primis=tempus&in=vel', '/main/images/article1.jpg'),
(4, 'Donec posuere metus vitae ipsum. Aliquam non mauris.', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', 'https://tmall.com/mauris/sit/amet/eros/suspendisse/accumsan/tortor.xml?dis=aliquet&parturient=maecenas&montes=leo&nascetur=odio&ridiculus=condimentum&mus=id&etiam=luctus&vel=nec&augue=molestie&vestibulum=sed&rutrum=justo&rutrum=pellentesque&neque=viverra&aenean=pede&auctor=ac&gravida=diam&sem=cras&praesent=pellentesque&id=volutpat&massa=dui&id=maecenas&nisl=tristique&venenatis=est&lacinia=et&aenean=tempus&sit=semper&amet=est&justo=quam&morbi=pharetra&ut=magna&odio=ac&cras=consequat&mi=metus&pede=sapien&malesuada=ut&in=nunc&imperdiet=vestibulum&et=ante&commodo=ipsum&vulputate=primis&justo=in&in=faucibus&blandit=orci&ultrices=luctus&enim=et&lorem=ultrices&ipsum=posuere&dolor=cubilia&sit=curae&amet=mauris&consectetuer=viverra&adipiscing=diam&elit=vitae&proin=quam&interdum=suspendisse&mauris=potenti&non=nullam&ligula=porttitor&pellentesque=lacus&ultrices=at&phasellus=turpis&id=donec&sapien=posuere&in=metus&sapien=vitae&iaculis=ipsum&congue=aliquam&vivamus=non&metus=mauris&arcu=morbi&adipiscing=non&molestie=lectus&hendrerit=aliquam&at=sit&vulputate=amet&vitae=diam&nisl=in&aenean=magna&lectus=bibendum', '/main/images/article1.jpg'),
(5, 'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', 'https://spiegel.de/vestibulum/ac/est/lacinia/nisi/venenatis.jpg?est=eget&phasellus=elit&sit=sodales&amet=scelerisque&erat=mauris&nulla=sit&tempus=amet&vivamus=eros&in=suspendisse&felis=accumsan&eu=tortor&sapien=quis&cursus=turpis&vestibulum=sed&proin=ante&eu=vivamus&mi=tortor&nulla=duis&ac=mattis&enim=egestas&in=metus&tempor=aenean&turpis=fermentum&nec=donec&euismod=ut&scelerisque=mauris&quam=eget&turpis=massa&adipiscing=tempor&lorem=convallis&vitae=nulla&mattis=neque&nibh=libero&ligula=convallis&nec=eget&sem=eleifend&duis=luctus&aliquam=ultricies&convallis=eu&nunc=nibh&proin=quisque&at=id&turpis=justo&a=sit&pede=amet&posuere=sapien&nonummy=dignissim&integer=vestibulum&non=vestibulum&velit=ante&donec=ipsum&diam=primis', '/main/images/article1.jpg'),
(6, 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'http://multiply.com/condimentum/curabitur/in/libero/ut/massa.aspx?in=integer&blandit=ac&ultrices=neque&enim=duis&lorem=bibendum&ipsum=morbi&dolor=non&sit=quam&amet=nec&consectetuer=dui&adipiscing=luctus&elit=rutrum&proin=nulla&interdum=tellus&mauris=in&non=sagittis&ligula=dui&pellentesque=vel&ultrices=nisl&phasellus=duis&id=ac&sapien=nibh&in=fusce&sapien=lacus&iaculis=purus&congue=aliquet&vivamus=at&metus=feugiat&arcu=non&adipiscing=pretium&molestie=quis&hendrerit=lectus&at=suspendisse&vulputate=potenti&vitae=in&nisl=eleifend&aenean=quam&lectus=a&pellentesque=odio&eget=in&nunc=hac&donec=habitasse&quis=platea&orci=dictumst&eget=maecenas&orci=ut&vehicula=massa&condimentum=quis&curabitur=augue&in=luctus&libero=tincidunt&ut=nulla&massa=mollis&volutpat=molestie&convallis=lorem&morbi=quisque&odio=ut&odio=erat&elementum=curabitur&eu=gravida&interdum=nisi&eu=at&tincidunt=nibh&in=in&leo=hac&maecenas=habitasse&pulvinar=platea&lobortis=dictumst&est=aliquam&phasellus=augue&sit=quam&amet=sollicitudin&erat=vitae&nulla=consectetuer&tempus=eget&vivamus=rutrum&in=at&felis=lorem&eu=integer&sapien=tincidunt&cursus=ante&vestibulum=vel&proin=ipsum&eu=praesent&mi=blandit&nulla=lacinia&ac=erat&enim=vestibulum&in=sed&tempor=magna', '/main/images/article1.jpg'),
(7, 'Morbi a ipsum. Integer a nibh. In quis justo.', 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', 'http://nhs.uk/donec/vitae.jsp?vestibulum=molestie&eget=lorem&vulputate=quisque&ut=ut&ultrices=erat&vel=curabitur&augue=gravida&vestibulum=nisi&ante=at&ipsum=nibh&primis=in&in=hac&faucibus=habitasse&orci=platea&luctus=dictumst&et=aliquam&ultrices=augue&posuere=quam&cubilia=sollicitudin&curae=vitae&donec=consectetuer&pharetra=eget&magna=rutrum&vestibulum=at&aliquet=lorem&ultrices=integer&erat=tincidunt', '/main/images/article1.jpg'),
(8, 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'Quisque id justo sit amet sapien dignissim vestibulum.', 'https://reverbnation.com/sapien/quis/libero/nullam.jpg?odio=potenti&cras=in&mi=eleifend&pede=quam&malesuada=a&in=odio&imperdiet=in&et=hac&commodo=habitasse&vulputate=platea&justo=dictumst&in=maecenas&blandit=ut&ultrices=massa&enim=quis&lorem=augue&ipsum=luctus&dolor=tincidunt&sit=nulla&amet=mollis&consectetuer=molestie&adipiscing=lorem&elit=quisque&proin=ut&interdum=erat&mauris=curabitur&non=gravida&ligula=nisi&pellentesque=at&ultrices=nibh&phasellus=in&id=hac&sapien=habitasse&in=platea&sapien=dictumst&iaculis=aliquam&congue=augue&vivamus=quam&metus=sollicitudin&arcu=vitae&adipiscing=consectetuer&molestie=eget&hendrerit=rutrum&at=at&vulputate=lorem&vitae=integer&nisl=tincidunt&aenean=ante&lectus=vel&pellentesque=ipsum&eget=praesent&nunc=blandit&donec=lacinia&quis=erat&orci=vestibulum&eget=sed&orci=magna&vehicula=at&condimentum=nunc&curabitur=commodo&in=placerat&libero=praesent&ut=blandit&massa=nam&volutpat=nulla&convallis=integer&morbi=pede&odio=justo&odio=lacinia&elementum=eget&eu=tincidunt&interdum=eget&eu=tempus&tincidunt=vel&in=pede&leo=morbi&maecenas=porttitor&pulvinar=lorem&lobortis=id&est=ligula&phasellus=suspendisse&sit=ornare&amet=consequat&erat=lectus&nulla=in&tempus=est&vivamus=risus&in=auctor&felis=sed&eu=tristique&sapien=in&cursus=tempus&vestibulum=sit&proin=amet&eu=sem&mi=fusce&nulla=consequat&ac=nulla&enim=nisl', '/main/images/article1.jpg'),
(9, 'Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.', 'http://blogtalkradio.com/quis/orci/nullam.jsp?justo=sem&eu=sed&massa=sagittis&donec=nam&dapibus=congue&duis=risus&at=semper&velit=porta&eu=volutpat&est=quam&congue=pede&elementum=lobortis&in=ligula&hac=sit&habitasse=amet&platea=eleifend&dictumst=pede&morbi=libero&vestibulum=quis&velit=orci&id=nullam&pretium=molestie&iaculis=nibh&diam=in&erat=lectus&fermentum=pellentesque&justo=at&nec=nulla&condimentum=suspendisse&neque=potenti&sapien=cras&placerat=in&ante=purus&nulla=eu&justo=magna&aliquam=vulputate&quis=luctus&turpis=cum&eget=sociis&elit=natoque&sodales=penatibus&scelerisque=et&mauris=magnis&sit=dis&amet=parturient&eros=montes&suspendisse=nascetur&accumsan=ridiculus&tortor=mus&quis=vivamus&turpis=vestibulum&sed=sagittis&ante=sapien&vivamus=cum&tortor=sociis&duis=natoque&mattis=penatibus', '/main/images/article1.jpg'),
(10, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', 'Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'https://google.ca/justo/sollicitudin.aspx?nec=vulputate&nisi=vitae&volutpat=nisl&eleifend=aenean&donec=lectus&ut=pellentesque&dolor=eget&morbi=nunc&vel=donec&lectus=quis&in=orci&quam=eget&fringilla=orci&rhoncus=vehicula&mauris=condimentum&enim=curabitur&leo=in&rhoncus=libero&sed=ut&vestibulum=massa&sit=volutpat&amet=convallis&cursus=morbi&id=odio&turpis=odio&integer=elementum&aliquet=eu&massa=interdum&id=eu&lobortis=tincidunt&convallis=in&tortor=leo&risus=maecenas&dapibus=pulvinar&augue=lobortis&vel=est&accumsan=phasellus&tellus=sit&nisi=amet&eu=erat&orci=nulla&mauris=tempus&lacinia=vivamus&sapien=in&quis=felis&libero=eu&nullam=sapien&sit=cursus&amet=vestibulum&turpis=proin&elementum=eu&ligula=mi&vehicula=nulla&consequat=ac&morbi=enim&a=in&ipsum=tempor&integer=turpis&a=nec&nibh=euismod&in=scelerisque&quis=quam&justo=turpis&maecenas=adipiscing&rhoncus=lorem&aliquam=vitae&lacus=mattis&morbi=nibh&quis=ligula&tortor=nec&id=sem&nulla=duis&ultrices=aliquam&aliquet=convallis&maecenas=nunc&leo=proin&odio=at&condimentum=turpis&id=a&luctus=pede&nec=posuere&molestie=nonummy&sed=integer&justo=non&pellentesque=velit&viverra=donec&pede=diam&ac=neque&diam=vestibulum&cras=eget&pellentesque=vulputate&volutpat=ut&dui=ultrices&maecenas=vel', '/main/images/article1.jpg');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `content` text NOT NULL,
  `timestamps` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `img_path` text NOT NULL,
  `sent_ap` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `personal_diary_content`
--

CREATE TABLE `personal_diary_content` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `personal_diary_content`
--

INSERT INTO `personal_diary_content` (`id`, `user_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie.', 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', '2024-05-28 21:07:40', NULL),
(2, 2, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', '2024-05-28 21:07:40', NULL),
(3, 3, 'Nunc rhoncus dui vel sem. Sed sagittis.', 'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', '2024-05-28 21:07:40', NULL),
(4, 4, 'Nulla mollis molestie lorem.', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', '2024-05-28 21:07:40', NULL),
(5, 5, 'Quisque ut erat.', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', '2024-05-28 21:07:40', NULL),
(6, 6, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.', '2024-05-28 21:07:40', NULL),
(7, 7, 'Vestibulum sed magna at nunc commodo placerat.', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', '2024-05-28 21:07:40', NULL),
(8, 8, 'In congue.', 'Aenean sit amet justo.', '2024-05-28 21:07:40', NULL),
(9, 9, 'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2024-05-28 21:07:40', NULL),
(10, 2, 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2024-05-28 21:07:40', NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `description`, `thumbnail_path`) VALUES
(1, 1, 'Pellentesque ultrices mattis odio. Donec vitae nisi.', '/main/images/feed-7.jpg'),
(2, 2, 'Quisque id justo sit amet sapien dignissim vestibulum. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', NULL),
(3, 3, 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. ', '/main/images/feed-5.jpg'),
(4, 4, 'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris lacinia sapien quis libero.', NULL),
(5, 5, 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', NULL),
(6, 6, 'Nullam porttitor lacus at turpis.', '/main/images/feed-2.jpg'),
(7, 7, 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', '/main/images/feed-1.jpg'),
(8, 8, 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '/main/images/feed-7.jpg'),
(9, 9, 'Cras in purus eu magna vulputate luctus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', '/main/images/feed-6.jpg'),
(10, 1, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '/main/images/feed-5.jpg');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `roles`
--

INSERT INTO `roles` (`role_id`, `name`, `label`) VALUES
(1, 'user', 'User'),
(2, 'admin', 'Administrator'),
(3, 'moderator', 'Moderator'),
(4, 'therapist', 'Therapist'),
(5, 'volunteer', 'Volunteer');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `room_messages`
--

CREATE TABLE `room_messages` (
  `id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `streaks`
--

CREATE TABLE `streaks` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `streaks`
--

INSERT INTO `streaks` (`id`, `name`, `user_id`, `start_date`, `end_date`) VALUES
(1, 'Gleichner-Walter', 1, '2024-03-22 21:07:40', NULL),
(2, 'Frami Inc', 2, '2024-02-21 21:07:40', NULL),
(3, 'Quitzon Group', 3,'2024-01-10 21:07:40', NULL),
(4, 'Cole LLC', 4, '2024-03-24 21:07:40', NULL),
(5, 'Nader, McClure and Buckridge', 5, '2024-05-28 21:07:40', NULL),
(6, 'Koss-Kling', 6, '2024-05-28 21:07:40', NULL),
(7, 'Rempel-Will', 7, '2024-05-28 21:07:40', NULL),
(8, 'Parisian, Rowe and Nolan', 8, '2024-05-28 21:07:40', NULL),
(9, 'Hartmann-Goldner', 9, '2024-05-28 21:07:40', NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `timestamps` datetime DEFAULT NULL,
  `profile_picture` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `surname`, `password`, `email`, `role_id`, `anonymous`, `timestamps`, `profile_picture`) VALUES
(1, 'akis', 'Akis', 'Papapanagiotou', 'akis1', 'akis@example.com', 2, 0, '2024-05-28 21:07:40', '/main/images/profile-11.jpg'),
(2, 'elena', 'Elena', 'Thanopoulou', 'elena1', 'elena@example.com', 2, 0, '2024-05-28 21:07:40', '/main/images/profile-12.jpg'),
(3, 'iro', 'Iro', 'Kamarinou', 'iro1', 'iro@example.com', 2, 0, '2024-05-28 21:07:40', '/main/images/profile-13.jpg'),
(4, 'orfeas', 'Orfeas', 'Pourgourides', 'orfeas1', 'orfeas@example.com', 2, 0, '2024-05-28 21:07:40', '/main/images/profile-15.jpg'),
(5, 'thomas', 'Thomas', 'Nikolaou', 'thomas1', 'thomas@example.com', 2, 0, '2024-05-28 21:07:40', '/main/images/profile-16.jpg'),
(6, 'chris', 'Chris', 'Papas', 'password1', 'chris@example.com', 1, 0, '2024-05-28 21:07:40', '/main/images/profile-17.jpg'),
(7, 'sia', 'Sia', 'Panou', 'password1', 'sia@example.com', 3, 0, '2024-05-28 21:07:40', '/main/images/profile-18.jpg'),
(8, 'bob', 'Bob', 'Seen', 'password1', 'bob@example.com', 4, 0, '2024-05-28 21:07:40', '/main/images/profile-19.jpg'),
(9, 'mary', 'Maria', 'Menounou', 'password1', 'mary@example.com', 5, 0, '2024-05-28 21:07:40', '/main/images/profile-20.jpg');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user_chat_rooms`
--

CREATE TABLE `user_chat_rooms` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `join_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `user_messages`
--

CREATE TABLE `user_messages` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `message_id` bigint(20) NOT NULL,
  `timestamps` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `websites`
--

CREATE TABLE `websites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `thumbnail_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Άδειασμα δεδομένων του πίνακα `websites`
--

INSERT INTO `websites` (`id`, `name`, `description`, `thumbnail_path`) VALUES
(1, 'Voyatouch', 'Cras pellentesque volutpat dui. ', '/main/images/profile-11.jpg'),
(2, 'Fixflex', 'Donec posuere metus vitae ipsum.', '/main/images/profile-2.jpg'),
(3, 'Lotstring', 'Quisque ut erat. Curabitur gravida nisi.', '/main/images/profile-3.jpg'),
(4, 'Voltsillam', 'Donec posuere metus vitae ipsum.  ', '/main/images/profile-4.jpg'),
(5, 'Greenlam', 'Vivamus vestibulum sagittis sapien.', '/main/images/profile-5.jpg'),
(6, 'Alpha', 'Integer ac neque. Duis bibendum.', '/main/images/profile-6.jpg'),
(7, 'Konklab', 'Donec vitae nisi. nc viverra dapibus.', '/main/images/profile-7.jpg'),
(8, 'Cardify', 'Suspendisse potenti.', '/main/images/profile-8.jpg'),
(9, 'Biodex', 'Integer ac leo.', '/main/images/profile-9.jpg'),
(10, 'Lotlux', 'Morbi porttitor lorem id ligula.', '/main/images/profile-10.jpg');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `contact_forms`
--
ALTER TABLE `contact_forms`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `external_links`
--
ALTER TABLE `external_links`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `personal_diary_content`
--
ALTER TABLE `personal_diary_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_diary_user` (`user_id`);

--
-- Ευρετήρια για πίνακα `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Ευρετήρια για πίνακα `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Ευρετήρια για πίνακα `room_messages`
--
ALTER TABLE `room_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_room_messages_room` (`room_id`),
  ADD KEY `fk_room_messages_messages` (`message_id`);

--
-- Ευρετήρια για πίνακα `streaks`
--
ALTER TABLE `streaks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_streak_counter_user` (`user_id`);

--
-- Ευρετήρια για πίνακα `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_roles` (`role_id`);

--
-- Ευρετήρια για πίνακα `user_chat_rooms`
--
ALTER TABLE `user_chat_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_rooms_user` (`user_id`),
  ADD KEY `fk_user_rooms_rooms` (`room_id`);

--
-- Ευρετήρια για πίνακα `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_messages_user` (`user_id`),
  ADD KEY `fk_user_messages_messages` (`message_id`);

--
-- Ευρετήρια για πίνακα `websites`
--
ALTER TABLE `websites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT για πίνακα `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT για πίνακα `contact_forms`
--
ALTER TABLE `contact_forms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `external_links`
--
ALTER TABLE `external_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT για πίνακα `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `personal_diary_content`
--
ALTER TABLE `personal_diary_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT για πίνακα `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT για πίνακα `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT για πίνακα `room_messages`
--
ALTER TABLE `room_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `streaks`
--
ALTER TABLE `streaks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT για πίνακα `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT για πίνακα `user_chat_rooms`
--
ALTER TABLE `user_chat_rooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `user_messages`
--
ALTER TABLE `user_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT για πίνακα `websites`
--
ALTER TABLE `websites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Περιορισμοί για άχρηστους πίνακες
--

--
-- Περιορισμοί για πίνακα `personal_diary_content`
--
ALTER TABLE `personal_diary_content`
  ADD CONSTRAINT `fk_user_diary_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `room_messages`
--
ALTER TABLE `room_messages`
  ADD CONSTRAINT `fk_room_messages_messages` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_room_messages_room` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `streaks`
--
ALTER TABLE `streaks`
  ADD CONSTRAINT `fk_streak_counter_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `user_chat_rooms`
--
ALTER TABLE `user_chat_rooms`
  ADD CONSTRAINT `fk_user_rooms_rooms` FOREIGN KEY (`room_id`) REFERENCES `chat_rooms` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_rooms_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Περιορισμοί για πίνακα `user_messages`
--
ALTER TABLE `user_messages`
  ADD CONSTRAINT `fk_user_messages_messages` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_messages_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE;
COMMIT;