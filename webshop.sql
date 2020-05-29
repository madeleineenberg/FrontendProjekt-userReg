-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Värd: localhost:3306
-- Tid vid skapande: 26 maj 2020 kl 19:30
-- Serverversion: 5.7.26
-- PHP-version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `webshop`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `webshop_categories`
--

CREATE TABLE `webshop_categories` (
  `categoryid` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `webshop_categories`
--

INSERT INTO `webshop_categories` (`categoryid`, `category`, `image`) VALUES
(2, 'barnspel', 'barnspel.jpg'),
(3, 'strategispel', 'strategispel.jpg'),
(4, 'partyspel', 'partyspel.jpg'),
(24, 'Familjespel', 'fia.jpg'),
(25, 'Brädspel', 'game.jpg');

-- --------------------------------------------------------

--
-- Tabellstruktur `webshop_customers`
--

CREATE TABLE `webshop_customers` (
  `userid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` varchar(6) NOT NULL,
  `city` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `webshop_customers`
--

INSERT INTO `webshop_customers` (`userid`, `name`, `email`, `phone`, `street`, `zip`, `city`, `password`) VALUES
(57, 'madeleineenbergnackademin', 'hej@test.com', '0731223234', 'gatan 1', 'hej', 'bromma', 'hej'),
(58, 'madeleineenbergnackademin', 'madeleine_enberg@hotmail.com', '0730376166', 'drottningholmsvägen 312', '16731', 'hej', 'hej'),
(59, 'Madeleine Enberg', 'hej@test.com', '0731223234', 'gatan 1', '12345', 'Bromma', 'hej'),
(60, 'madeleineenbergnackademin', 'hej@test.com', '0731223234', 'gatan 1', '12345', 'Norra Ängby', 'hej'),
(61, 'madeleineenbergnackademin', 'hej@test.com', '0731223234', 'gatan 1', '12345', 'Norra ängby', 'hej'),
(62, 'madeleineenbergnackademin', 'hej@test.com', '0731223234', 'gatan 1', '12345', 'bromma by', 'hej'),
(63, 'madeleineenbergnackademin', 'madde@hotmail.com', '0731234567', 'hejvägen1', '12345', 'stockholm', 'hej'),
(64, 'madeleineenbergnackademin', 'bajs@hotmail.com', '0731223234', 'gatan 1', '12345', 'bromma', '541c57960bb997942655d14e3b9607f9'),
(65, 'madde', 'sami_ben_aza@hotmail.com', '0731223234', 'gatan 1', '12345', 'bromma', 'hej'),
(66, 'sami', 'testigen@hotmail.com', '0730376166', 'timotej5', '12345', 'gammelstad', '05b972dcf28374406d13e879724bfe3b'),
(67, 'Madeleine Enberg', 'info@madeleineenberg.com', '0730376166', 'Drottningholmsvägen 312', '16731', 'Bromma', '95c383ac224e259a5f5d08b4dab08cff'),
(68, 'madeleine enberg', 'testing@hotmail.com', '0701234566', 'hejvägn 1', '12345', 'Bromma', '541c57960bb997942655d14e3b9607f9'),
(69, 'Aldo Ben Aza', 'aldo@mail.com', '0701234567', 'Drottningholmsvägen 312', '16731', 'Bromma', 'hej'),
(70, 'aza aldo', 'exempel@mail.com', '0730376166', 'hejvägen 1', '12345', 'Gammelstad', '05b972dcf28374406d13e879724bfe3b'),
(71, 'Madde enberg', 'exempel@test.com', '0730376166', 'hejvägen 1', '12345', 'Bromma', '05b972dcf28374406d13e879724bfe3b');

-- --------------------------------------------------------

--
-- Tabellstruktur `webshop_orderproducts`
--

CREATE TABLE `webshop_orderproducts` (
  `orderproductid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellstruktur `webshop_orders`
--

CREATE TABLE `webshop_orders` (
  `orderid` int(11) NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` varchar(6) NOT NULL,
  `city` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `products` varchar(5000) NOT NULL,
  `freight` varchar(50) NOT NULL,
  `totalprice` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `webshop_orders`
--

INSERT INTO `webshop_orders` (`orderid`, `orderdate`, `name`, `email`, `phone`, `street`, `zip`, `city`, `status`, `products`, `freight`, `totalprice`) VALUES
(65, '2020-04-29 10:15:24', 'hej', 'hannah@mail.se', '0700000000', 'hejvägen 1', '11215', 'solna', 2, '[{\"cartQty\":\"1\",\"title\":\"Risk\",\"price\":\"429\",\"quantity\":\"10\",\"productid\":\"12\"},{\"cartQty\":\"1\",\"title\":\"Terraforming Mars\",\"price\":\"250\",\"quantity\":\"30\",\"productid\":\"13\"}]', '', '679'),
(66, '2020-04-29 20:34:57', 'hannah', 'hannah@mail.se', '0701234567', 'kulvägen 1', '11215', 'solna', 1, '[{\"cartQty\":\"1\",\"title\":\"Twister\",\"price\":\"249\",\"quantity\":\"80\",\"productid\":\"3\"},{\"cartQty\":\"3\",\"title\":\"Labyrint\",\"price\":\"189\",\"quantity\":\"30\",\"productid\":\"2\"},{\"cartQty\":\"1\",\"title\":\"Det stora djungelloppet\",\"price\":\"199\",\"quantity\":\"3\",\"productid\":\"4\"},{\"cartQty\":\"1\",\"title\":\"Speak out\",\"price\":\"249\",\"outletprice\":\"225\",\"quantity\":\"40\",\"productid\":\"14\"}]', '', '1240'),
(67, '2020-04-30 10:52:04', 'hannah', 'hannah@mail.se', '0701345678', 'hejvägen 1', '11215', 'stockholm', 2, '[{\"cartQty\":\"1\",\"title\":\"Ticket to ride\",\"price\":\"345\",\"quantity\":\"8\",\"productid\":\"10\"}]', '', '395'),
(68, '2020-04-30 15:17:03', 'Hannah', 'hannah@mail.se', '0701234567', 'Spelvägen 67', '32390', 'Kalmar', 1, '[{\"cartQty\":\"1\",\"title\":\"Risk\",\"price\":\"429\",\"quantity\":\"10\",\"productid\":\"12\"},{\"cartQty\":\"1\",\"title\":\"Terraforming Mars\",\"price\":\"250\",\"quantity\":\"30\",\"productid\":\"13\"}]', '', '679'),
(69, '2020-04-30 15:22:43', 'Hannah', 'hannah_olsson94@hotmail.com', '0700123123', 'Spelvägen 67', '11212', 'stockholm', 1, '[{\"cartQty\":\"1\",\"title\":\"Absolut överens\",\"price\":\"255\",\"quantity\":\"60\",\"productid\":\"16\"},{\"cartQty\":\"1\",\"title\":\"Det borde man ju veta\",\"price\":\"165\",\"quantity\":\"35\",\"productid\":\"18\"}]', '', '470'),
(71, '2020-04-30 17:09:58', 'Hannah Olsson', 'hannah@mail.se', '0701234567', 'Spelvägen 67', '32390', 'Kalmar', 1, '[{\"cartQty\":\"1\",\"title\":\"Det stora djungelloppet\",\"price\":\"199\",\"quantity\":\"3\",\"productid\":\"4\"},{\"cartQty\":\"1\",\"title\":\"inga produkter\",\"price\":\"4\",\"quantity\":\"1\",\"productid\":\"50\"},{\"cartQty\":2,\"title\":\"Speak out\",\"price\":\"249\",\"outletprice\":\"225\",\"quantity\":\"40\",\"productid\":\"14\"}]', '', '653'),
(72, '2020-04-30 17:35:51', 'hannah', 'hannah_olsson94@hotmail.com', '0701345678', 'hejvägen 1', '11212', 'solna', 1, '[{\"cartQty\":2,\"title\":\"Det borde man ju veta\",\"price\":\"165\",\"quantity\":\"35\",\"productid\":\"18\"}]', '', '380'),
(73, '2020-04-30 19:40:43', 'hannah', 'hannah@mail.se', '0700000000', 'mysvägen 1', '11111', 'solna', 1, '[{\"cartQty\":1,\"title\":\"Ticket to ride\",\"price\":\"345\",\"quantity\":\"8\",\"productid\":\"10\"}]', '', '345'),
(74, '2020-05-04 10:18:41', 'hannah', 'hannah@mail.se', '0701345678', 'kulvägen 1', '11212', 'solna', 1, '[{\"cartQty\":3,\"title\":\"Absolut överens\",\"price\":\"255\",\"quantity\":\"60\",\"productid\":\"16\"}]', '', '765'),
(81, '2020-05-05 17:39:29', 'A test', 'a@a.se', '0701223344', 'Gata 1', '42233', 'Småstad', 1, '[{\"cartQty\":\"1\",\"title\":\"Det borde man ju veta\",\"price\":\"165\",\"quantity\":\"35\",\"productid\":\"18\"},{\"cartQty\":\"1\",\"title\":\"Absolut överens\",\"outletprice\":\"230\",\"price\":\"255\",\"quantity\":\"48\",\"productid\":\"16\"}]', '', '445'),
(84, '2020-05-05 18:55:03', 'A test', 'a@a.se', '0701223344', 'Vägen 1', '32433', 'Småstad', 1, '[{\"cartQty\":\"1\",\"title\":\"Speak out\",\"outletprice\":\"225\",\"price\":\"249\",\"quantity\":\"30\",\"productid\":\"14\"},{\"cartQty\":\"1\",\"title\":\"Absolut överens\",\"outletprice\":\"230\",\"price\":\"255\",\"quantity\":\"45\",\"productid\":\"16\"}]', '', '505'),
(85, '2020-05-05 19:00:02', 'A test', 'a@a.se', '0700223344', 'Gata 1', '42233', 'Småstad', 1, '[{\"cartQty\":\"1\",\"title\":\"Råttfällan\",\"price\":\"129\",\"quantity\":\"49\",\"productid\":\"1\"},{\"cartQty\":\"1\",\"title\":\"Labyrint\",\"price\":\"189\",\"quantity\":\"30\",\"productid\":\"2\"}]', '', '368'),
(92, '2020-05-05 19:37:54', 'A frakt', 'a@a.se', '0746355462', 'Gata 1', '42233', 'Småstad', 1, '[{\"cartQty\":\"1\",\"title\":\"Speak out\",\"outletprice\":\"225\",\"price\":\"249\",\"quantity\":\"28\",\"productid\":\"14\"},{\"cartQty\":\"1\",\"title\":\"Absolut överens\",\"outletprice\":\"230\",\"price\":\"255\",\"quantity\":\"43\",\"productid\":\"16\"}]', '50', '505'),
(93, '2020-05-10 01:02:29', 'Madeleine Enberg', 'madeleine_enberg@hotmail.com', '0730376166', 'drottningholmsvägen 312', '16731', 'bromma', 1, '[{\"cartQty\":\"1\",\"title\":\"Alias\",\"price\":\"225\",\"quantity\":\"20\",\"productid\":\"8\"}]', '0', '225'),
(96, '2020-05-25 13:17:43', 'madde', 'sami_ben_aza@hotmail.com', '0731223234', 'gatan 1', '12345', 'bromma', 2, '[{\"cartQty\":\"1\",\"title\":\"Carcassonne\",\"outletprice\":\"257\",\"price\":\"285\",\"quantity\":\"4\",\"productid\":\"11\"},{\"cartQty\":\"1\",\"title\":\"Risk\",\"price\":\"429\",\"quantity\":\"10\",\"productid\":\"12\"},{\"cartQty\":\"1\",\"title\":\"Ticket to ride\",\"price\":\"345\",\"quantity\":\"7\",\"productid\":\"10\"}]', '0', '1031'),
(97, '2020-05-25 13:19:46', 'madde', 'sami_ben_aza@hotmail.com', '0731223234', 'gatan 1', '12345', 'bromma', 1, '[{\"cartQty\":\"1\",\"title\":\"Twister\",\"price\":\"249\",\"quantity\":\"80\",\"productid\":\"3\"}]', '0', '249'),
(98, '2020-05-25 13:22:44', 'madde', 'sami_ben_aza@hotmail.com', '0731223234', 'gatan 1', '12345', 'bromma', 1, '[{\"cartQty\":\"1\",\"title\":\"Absolut överens\",\"outletprice\":\"230\",\"price\":\"255\",\"quantity\":\"42\",\"productid\":\"16\"}]', '0', '230'),
(99, '2020-05-25 23:32:48', 'sami', 'testigen@hotmail.com', '0730376166', 'timotej5', '12345', 'gammelstad', 1, '[{\"cartQty\":\"1\",\"title\":\"Absolut överens\",\"outletprice\":\"230\",\"price\":\"255\",\"quantity\":\"41\",\"productid\":\"16\"},{\"cartQty\":\"1\",\"title\":\"Speak out\",\"outletprice\":\"225\",\"price\":\"249\",\"quantity\":\"27\",\"productid\":\"14\"}]', '0', '455'),
(100, '2020-05-26 21:03:52', 'Aldo Ben Aza', 'aldo@mail.com', '0701234567', 'Drottningholmsvägen 312', '16731', 'Bromma', 1, '[{\"cartQty\":\"1\",\"title\":\"Labyrint\",\"price\":\"189\",\"quantity\":\"27\",\"productid\":\"2\"},{\"cartQty\":\"1\",\"title\":\"Twister\",\"price\":\"249\",\"quantity\":\"79\",\"productid\":\"3\"}]', '0', '438');

-- --------------------------------------------------------

--
-- Tabellstruktur `webshop_orderscomplete`
--

CREATE TABLE `webshop_orderscomplete` (
  `orderid` int(11) NOT NULL,
  `orderdate` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` varchar(6) NOT NULL,
  `city` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `products` varchar(5000) NOT NULL,
  `freight` varchar(50) NOT NULL,
  `totalprice` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `webshop_orderscomplete`
--

INSERT INTO `webshop_orderscomplete` (`orderid`, `orderdate`, `name`, `email`, `phone`, `street`, `zip`, `city`, `status`, `products`, `freight`, `totalprice`) VALUES
(54, '2020-04-28 16:24:26', 'hannah', 'hannah_olsson94@hotmail.com', '0701234567', 'mysvägen 1', '11215', 'Hässelby', 3, '[{\"cartQty\":\"1\",\"title\":\"Det stora djungelloppet\",\"price\":\"199\",\"quantity\":\"3\",\"productid\":\"4\"}]', '', ''),
(55, '2020-04-28 16:29:51', 'hej', 'Mattias@mail.se', '0700000000', 'hejvägen 1', '11111', 'bromma', 3, '[{\"cartQty\":3,\"title\":\"Labyrint\",\"price\":\"189\",\"quantity\":\"30\",\"productid\":\"2\"},{\"cartQty\":\"1\",\"title\":\"Twister\",\"price\":\"249\",\"quantity\":\"80\",\"productid\":\"3\"}]', '', ''),
(56, '2020-04-28 18:08:56', 'hannah', 'Mattias@mail.se', '0700000000', 'hejvägen 1', '31212', 'Kalmar', 3, '[{\"cartQty\":\"1\",\"title\":\"Råttfällan\",\"price\":\"129\",\"quantity\":\"50\",\"productid\":\"1\"},{\"cartQty\":\"1\",\"title\":\"Labyrint\",\"price\":\"189\",\"quantity\":\"30\",\"productid\":\"2\"},{\"cartQty\":\"1\",\"title\":\"Skippo\",\"price\":\"79\",\"quantity\":\"20\",\"productid\":\"48\"},{\"cartQty\":\"1\",\"title\":\"Labyrint\",\"price\":\"189\",\"quantity\":\"30\",\"productid\":\"2\"}]', '', ''),
(60, '2020-04-29 09:49:45', 'hannah', 'hannah@mail.se', '0701234567', 'hejvägen 1', '11111', 'stockholm', 3, '[{\"cartQty\":\"1\",\"title\":\"Absolut överens\",\"price\":\"255\",\"outletprice\":\"230\",\"quantity\":\"60\",\"productid\":\"16\"},{\"cartQty\":\"1\",\"title\":\"Exploding kittens\",\"price\":\"179\",\"outletprice\":\"162\",\"quantity\":\"15\",\"productid\":\"15\"}]', '', ''),
(70, '2020-04-30 15:34:01', 'hej', 'hannah_olsson94@hotmail.com', '0700123123', 'kulvägen 1', '11212', 'stockholm', 3, '[{\"cartQty\":\"1\",\"title\":\"Terraforming Mars\",\"price\":\"250\",\"quantity\":\"30\",\"productid\":\"13\"},{\"cartQty\":\"1\",\"title\":\"inga produkter\",\"price\":\"4\",\"quantity\":\"1\",\"productid\":\"50\"}]', '', '304'),
(94, '2020-05-25 10:42:10', 'madde', 'sami_ben_aza@hotmail.com', '0731223234', 'gatan 1', '12345', 'bromma', 3, '[{\"cartQty\":\"1\",\"title\":\"Labyrint\",\"price\":\"189\",\"quantity\":\"28\",\"productid\":\"2\"}]', '0', '189'),
(95, '2020-05-25 10:44:21', 'sami', 'testigen@hotmail.com', '0730376166', 'timotej5', '12345', 'gammelstad', 3, '[{\"cartQty\":\"1\",\"title\":\"Cards against humanity\",\"price\":\"329\",\"quantity\":\"9\",\"productid\":\"17\"},{\"cartQty\":\"1\",\"title\":\"Det borde man ju veta\",\"price\":\"165\",\"quantity\":\"33\",\"productid\":\"18\"}]', '0', '494'),
(101, '2020-05-26 21:19:00', 'Madde enberg', 'exempel@test.com', '0730376166', 'hejvägen 1', '12345', 'Bromma', 3, '[{\"cartQty\":\"1\",\"title\":\"Råttfällan\",\"price\":\"129\",\"quantity\":\"47\",\"productid\":\"1\"},{\"cartQty\":\"1\",\"title\":\"Labyrint\",\"price\":\"189\",\"quantity\":\"26\",\"productid\":\"2\"}]', '0', '318');

-- --------------------------------------------------------

--
-- Tabellstruktur `webshop_password_reset`
--

CREATE TABLE `webshop_password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `token` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumpning av Data i tabell `webshop_password_reset`
--

INSERT INTO `webshop_password_reset` (`id`, `email`, `token`) VALUES
(1, 'madeleine_enberg@hotmail.com', 'fe1c9e151c3e8bbf8d64b17033a7ae1b38a5fccf4226dfefd6f7fcc616ba9704827c30eb149e084bb567c418ca9040eab606'),
(2, 'madeleine_enberg@hotmail.com', '0634e953dc5ad11a92a2dd18bd2c223ca4c7c7d8731e8d5589502df12fa8bf304b924fc9128662a290b77d162f2a8a88b929'),
(3, 'madeleine_enberg@hotmail.com', '76c92553d4f135f5bd568ba142142a49b2add564064080ad8e514055f29acfc6a1edd59385ad5c885b24a232377bb7346afb'),
(4, 'madeleine_enberg@hotmail.com', '5971e4ad3b0f83735c41ec7732f5888944263528dbc4ae42d38a38f6968459b30253030604aa38784deff36a03d21dd48556'),
(5, 'madeleine_enberg@hotmail.com', '680b636a87c24b21139453d63ca7b886358c4ba350f94fcfd3ca49f9a8f721bd5e7106f6a8ef308982733c19c22bd19496c7'),
(6, 'sami_ben_aza@hotmail.com', '99df94c7be91ab02058ca546b3046b51e0f81c0e67612078b7c683b644070bc48ccfcb1986fa39c357b2a425a1018cad634c'),
(7, 'sami_ben_aza@hotmail.com', '0073e8e59ed6e76b1d7093b96cecde4d35c39d60d6be295a902fc104cf4398fd0a4c38cb71d961d513cf6208048081f50875'),
(8, 'aldo@mail.com', 'cce0714c35e19d53e3fc625805d41a5e2cce5ab2fbf217cb45cb6bcf6266286c555438459eb21ecaf686e53f50c132925bb0'),
(9, 'aldo@mail.com', '06b5defcca5aabac55f6e85c165bf710d00abd2fa60e557290b96f6acf479f106a684db212b7704a7e9caa6bceae33413b44'),
(10, 'exempel@mail.com', 'ab9dcc73f5012f42510c8052e62ddb96279e7e14cbba991586c85793a772877704b7ff52fd0fd533f3aaf5fd0421e3991a67'),
(11, 'exempel@test.com', '3633758b6a058eb70aaf4a7d909145ff56fbfc56e840994a61bcc537dacf030f1ec6c91af1b11972d047d78f1f0173a15ab0');

-- --------------------------------------------------------

--
-- Tabellstruktur `webshop_products`
--

CREATE TABLE `webshop_products` (
  `productid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL,
  `productimg` varchar(1000) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumpning av Data i tabell `webshop_products`
--

INSERT INTO `webshop_products` (`productid`, `categoryid`, `title`, `description`, `price`, `quantity`, `productimg`, `date`) VALUES
(1, 2, 'Råttfällan', 'Ett fingerfärdigt plockspel för hela familjen! Först spänns spelpjäserna fast i råttfällan, sedan gäller det att plocka upp så många som möjligt utan att fällan slår igen.', '129', 46, 'a:2:{i:0;s:7:\"fia.jpg\";i:1;s:16:\"råttfällan.jpg\";}', '2020-04-23 00:00:00'),
(2, 2, 'Labyrint', 'Nu är det möjligt att svara på Daidalos utmaning på hemmaplan. Labyrintspelet bjuder på fyra utmaningar var din uppgift är att samla livspuckar. Undvik att bli slajmad av Taurus i labyrinten, ta dig över slajmsjön, para ihop korten i minnesspelet och var snabbast i byggutmaningen. Spelaren med flest livspuckar i behåll efter utmaningarna vinner spelet.', '189', 25, 'a:2:{i:0;s:12:\"labyrint.jpg\";i:1;s:13:\"labyrint2.jpg\";}', '2020-04-15 00:00:00'),
(3, 2, 'Twister', 'Din medspelare snurrar på hjulet och du gör det som hjulet visar, t ex sätt höger fot på den blå cirkeln eller vänster fot på den gröna cirkeln. Akta så du inte slår knut på dig själv! Den som lyckas stå upp längst vinner.', '249', 78, 'a:2:{i:0;s:11:\"twister.jpg\";i:1;s:12:\"twister2.jpg\";}', '2020-04-15 00:00:00'),
(4, 2, 'Det stora djungelloppet', 'Djungelns vildaste kapplöpning börjar snart! Slå tre tärningar och flytta antingen din elefant, din tiger eller din apa. Du måste få alla djur över mållinjen först av alla för att vinna den vilda jakten genom djungeln! Ett spel med högt tempo för barn.', '199', 3, 'a:2:{i:0;s:36:\"photo-1567304529193-acc92518efcd.jpg\";i:1;s:23:\"Stora sjungel ropet.jpg\";}', '2020-04-23 00:00:00'),
(5, 24, 'Alfapet', 'Spelglädjen växer med ordförrådet. Det är inte vem som helst som tar hem segern i Alfapet! Efter hand som spelplanen fylls, blir det allt klurigare att bilda nya ord. Det är nu som Alfapetsspelarens uthållighet, ordförråd och kreativitet ställs på prov. Tänk till, spela ut och ta poäng!', '275', 10, 'a:2:{i:0;s:11:\"alfapet.jpg\";i:1;s:9:\"alias.jpg\";}', '2020-03-20 00:00:00'),
(6, 2, 'Blokus', 'Blokus är ett enkelt och snabbspelat familjespel men även ett där strategifantasten får något att bita i. Placera ut dina enfärgade brickor på den trånga spelplanen och försök få ut fler än dina motspelare, så att du slipper minuspoängen när spelplanen inte längre rymmer era brickor!', '185', 0, 'a:2:{i:0;s:10:\"Blokus.jpg\";i:1;s:7:\"fia.jpg\";}', '2020-03-20 00:00:00'),
(7, 24, 'Sequence', 'Sequence är ett rktigt bra familjespel med ganska mycket tur och med lagom mycket strategi utan att bli krångligt. Sequence är ett lagspel för 2 eller 3 lag med 1 till 4 personer i varje lag. Dvs man kan spela 2-12 personer men inte 5, 7 eller 11 personer.', '249', 30, 'a:2:{i:0;s:16:\"råttfällan.jpg\";i:1;s:12:\"sequence.jpg\";}', '2020-03-25 00:00:00'),
(8, 24, 'Alias', 'För smarta pratkvarnar. Alias är ett ordförklaringsspel för vuxna och spelas i tvåmannalag. Spelet går ut på att förklara ord inom vissa gränser. Med hjälp av synonymer, motsatser, antydningar mm ska man förklara så att lagkamraten förstår och gissar så många ord som möjligt.', '225', 19, 'a:2:{i:0;s:9:\"alias.jpg\";i:1;s:10:\"Blokus.jpg\";}', '2020-03-20 00:00:00'),
(9, 3, 'Catan', 'Catan är ett av de mest populära spelen de senaste 10 åren. I Catan bygger spelarna vägar, byar och städer på ön Catan. Genom att bygga på ett smart sätt försöker man få sin bosättning att växa fortare än de andra spelarnas. En viktig del av spelet är byteshandeln mellan spelarna.', '359', 10, 'a:2:{i:0;s:7:\"fia.jpg\";i:1;s:16:\"råttfällan.jpg\";}', '2020-03-20 00:00:00'),
(10, 3, 'Ticket to ride', 'Ticket to Ride: Europe handlar om att resa mellan städer och åka så långa sträckor som möjligt för att generera ett större antal poäng än vad kortare sträckor ger, men samtidigt är det också just de längre sträckorna som är svåra att lyckas genomföra.', '345', 6, 'a:2:{i:0;s:23:\"Stora sjungel ropet.jpg\";i:1;s:21:\"Terraforming Mars.jpg\";}', '2020-03-20 00:00:00'),
(11, 3, 'Carcassonne', 'I Carcassonne bygger spelarna upp små landskap med spelbrickor av öppna fält, vägar, kloster och städer som de alla försöker kontrollera fram till dess att den sista spelbrickan är dragen och placerad på den ständigt växande spelplanen.', '285', 3, 'a:2:{i:0;s:10:\"Blokus.jpg\";i:1;s:15:\"carcassonne.jpg\";}', '2020-02-20 00:00:00'),
(12, 3, 'Risk', 'Det klassiska spelet om världsherravälde har varit det ledande militärstrategispelet sedan 1959! För att dominera världen ska du erövra samtliga 42 territorier. Med nya Risk får du tre versioner av spelet i samma förpackning. En för nya spelare, en för riskveteraner och en för 2 spelare.', '429', 9, 'a:2:{i:0;s:12:\"labyrint.jpg\";i:1;s:24:\"pexels-photo-961334.jpeg\";}', '2020-03-20 00:00:00'),
(13, 3, 'Terraforming Mars', 'Stora korporationer har påbörjat omvandla Mars yta för att kunna skapa en beboelig miljö för mänskligheten att expandera till. Varje spelare är ett sådant företag som genom sina handlingar bidrar till att höja temperaturen på Mars, öka syrgasnivån och bilda stora oceaner.', '250', 30, 'a:2:{i:0;s:21:\"Terraforming Mars.jpg\";i:1;s:22:\"Terraforming Mars2.jpg\";}', '2020-03-20 00:00:00'),
(14, 4, 'Speak out', 'Var beredd att vika dig dubbel av skratt med det här löjliga munstyckespelet! Speak Out samlar vänner och familj i ett gapskratt när spelarna försöker säga olika fraser medan de har på sig ett munstycke som hindrar dem att stänga munnen.', '249', 26, 'a:2:{i:0;s:15:\"speak out 2.jpg\";i:1;s:13:\"speak out.jpg\";}', '2020-02-20 00:00:00'),
(15, 4, 'Exploding kittens', 'For people who are into kittens and explosions and laser beams and sometimes goats.', '179', -4, 'a:2:{i:0;s:26:\"cards against humanity.jpg\";i:1;s:21:\"exploding kittens.jpg\";}', '2020-02-20 00:00:00'),
(16, 4, 'Absolut överens', 'Du och din lagkamrat ska svara på roliga frågor, utan att visa svaren för varandra. Flytta sedan ett steg framåt för varje svar ni är överens om.', '255', 40, 'a:2:{i:0;s:12:\"barnspel.jpg\";i:1;s:10:\"skippo.jpg\";}', '2020-02-20 00:00:00'),
(17, 4, 'Cards against humanity', 'Cards Against Humanity is a party game for horrible people. Each round, one player asks a question from a black card, and everyone else answers with their funniest white card.', '329', 8, 'a:2:{i:0;s:28:\"cards against humanity 2.jpg\";i:1;s:26:\"cards against humanity.jpg\";}', '2020-02-20 00:00:00'),
(18, 4, 'Det borde man ju veta', 'Ett spel om allt det där man faktiskt borde veta.. Det borde man ju veta! är ett medryckande och underhållande frågespel med över 400 frågor om sånt man faktiskt borde veta.', '165', 32, 'a:2:{i:0;s:13:\"labyrint2.jpg\";i:1;s:36:\"photo-1567304529193-acc92518efcd.jpg\";}', '2020-03-20 00:00:00'),
(54, 24, 'Uno', 'Tråkigare än Skippo', '60', 5, 'a:2:{i:0;s:10:\"skippo.jpg\";i:1;s:7:\"uno.jpg\";}', '2020-05-04 11:09:34'),
(55, 25, 'Skippo', 'Roligare än Uno', '333', 20, 'a:2:{i:0;s:36:\"photo-1567304529193-acc92518efcd.jpg\";i:1;s:10:\"skippo.jpg\";}', '2020-05-04 11:19:50'),
(59, 2, 'madde2', 'vad menar du,', '20', 1, 'a:5:{i:0;s:21:\"exploding kittens.jpg\";i:1;s:15:\"familjespel.jpg\";i:2;s:7:\"fia.jpg\";i:3;s:8:\"game.jpg\";i:4;s:17:\"hotairballoon.jpg\";}', '2020-05-09 13:29:55'),
(60, 3, 'uno', 'hejehej !', '20', 1, 'a:1:{i:0;s:0:\"\";}', '2020-05-09 13:30:13'),
(63, 4, 'uno', 'Pellentesque bibendum tempor diam gravida tincidunt. In at urna et urna condimentum finibus. Curabitur a fermentum tortor. Pellentesque ut arcu tempus, suscipit eros et, aliquet arcu. Nullam condimentum turpis nec diam porta tincidunt. Pellentesque facilisis feugiat turpis sit amet tincidunt. Vestibulum consequat augue mi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras id condimentum arcu. Nunc scelerisque nulla metus, nec varius ante volutpat sed. Curabitur rutrum, lectus sit amet lobortis bibendum, tortor ex pellentesque nisi, ac venenatis mauris eros non orci. Morbi porttitor lacus non scelerisque gravida hej hej', '20', 1, 'a:1:{i:0;s:0:\"\";}', '2020-05-09 13:36:43'),
(64, 4, 'madde', '', '40', 4, 'a:2:{i:0;s:11:\"alfapet.jpg\";i:1;s:9:\"alias.jpg\";}', '2020-05-09 14:48:23'),
(65, 25, 'test5bilder', '', '20', 1, 'a:5:{i:0;s:12:\"barnspel.jpg\";i:1;s:10:\"Blokus.jpg\";i:2;s:15:\"carcassonne.jpg\";i:3;s:28:\"cards against humanity 2.jpg\";i:4;s:26:\"cards against humanity.jpg\";}', '2020-05-09 14:50:48');

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `webshop_categories`
--
ALTER TABLE `webshop_categories`
  ADD PRIMARY KEY (`categoryid`);

--
-- Index för tabell `webshop_customers`
--
ALTER TABLE `webshop_customers`
  ADD PRIMARY KEY (`userid`);

--
-- Index för tabell `webshop_orderproducts`
--
ALTER TABLE `webshop_orderproducts`
  ADD PRIMARY KEY (`orderproductid`),
  ADD KEY `productid` (`productid`),
  ADD KEY `orderid` (`orderid`);

--
-- Index för tabell `webshop_orders`
--
ALTER TABLE `webshop_orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Index för tabell `webshop_orderscomplete`
--
ALTER TABLE `webshop_orderscomplete`
  ADD PRIMARY KEY (`orderid`);

--
-- Index för tabell `webshop_password_reset`
--
ALTER TABLE `webshop_password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `webshop_products`
--
ALTER TABLE `webshop_products`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `Referensintegritet` (`categoryid`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `webshop_categories`
--
ALTER TABLE `webshop_categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT för tabell `webshop_customers`
--
ALTER TABLE `webshop_customers`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT för tabell `webshop_orderproducts`
--
ALTER TABLE `webshop_orderproducts`
  MODIFY `orderproductid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT för tabell `webshop_orders`
--
ALTER TABLE `webshop_orders`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT för tabell `webshop_password_reset`
--
ALTER TABLE `webshop_password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT för tabell `webshop_products`
--
ALTER TABLE `webshop_products`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `webshop_orderproducts`
--
ALTER TABLE `webshop_orderproducts`
  ADD CONSTRAINT `webshop_orderproducts_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `webshop_products` (`productid`),
  ADD CONSTRAINT `webshop_orderproducts_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `webshop_orders` (`orderid`);

--
-- Restriktioner för tabell `webshop_products`
--
ALTER TABLE `webshop_products`
  ADD CONSTRAINT `Referensintegritet` FOREIGN KEY (`categoryid`) REFERENCES `webshop_categories` (`categoryid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
