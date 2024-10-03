-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              11.4.0-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win64
-- HeidiSQL Versione:            12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `proworkdb`;

-- Dump della struttura del database proworkdb
CREATE DATABASE IF NOT EXISTS `proworkdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_swedish_ci */;
USE `proworkdb`;

-- Dump della struttura di tabella proworkdb.azienda
CREATE TABLE IF NOT EXISTS `azienda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `settore` varchar(200) NOT NULL,
  `localita` varchar(200) NOT NULL,
  `descrizione` varchar(500) NOT NULL,
  `valutazione` double NOT NULL,
  `immagine` varchar(300) NOT NULL,
  `indirizzo` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Dump dei dati della tabella proworkdb.azienda: ~15 rows (circa)
INSERT IGNORE INTO `azienda` (`id`, `nome`, `settore`, `localita`, `descrizione`, `valutazione`, `immagine`, `indirizzo`, `link`) VALUES
	(1, 'Innova Group', 'Cartotecnico', 'Erbè', 'Innova Group, situata a Erbè (VR), è un\'azienda leader nel packaging e nella cartotecnica. Offre soluzioni innovative e sostenibili, grazie a tecnologie avanzate e alla digitalizzazione dei processi, con un forte focus sull\'innovazione in ottica Industry 4.0.', 3.9, 'innova_group.png', 'Via della Libertà 6 – 37060 Erbè (VR)', 'https://www.innovagroup.it/'),
	(2, 'MOA Sport', 'Moda', 'Castel d\'Ario', 'MOA Sport è un\'azienda italiana specializzata nella produzione di abbigliamento tecnico per il ciclismo, con il marchio Nalini. Fondata nel 1970, l\'azienda è conosciuta per la sua attenzione all\'innovazione, alla qualità dei materiali e al design. Nalini è un punto di riferimento per i ciclisti professionisti e amatori in tutto il mondo. MOA Sport unisce tradizione artigianale e tecnologia avanzata per offrire capi altamente performanti.', 0, 'moa.png', 'Strada Roppi, 48, 46033 Castel d\'Ario MN', 'https://www.nalini.com/'),
	(3, 'Fondazione EduLife', 'Istruzione', 'Verona', 'La Fondazione EduLife è un\'organizzazione no-profit che si dedica alla promozione dell\'educazione e della formazione dei giovani, con l\'obiettivo di sviluppare competenze utili per affrontare le sfide del futuro. La Fondazione si concentra su percorsi di crescita personale e professionale, sostenendo progetti innovativi che favoriscono il dialogo e la collaborazione tra giovani, imprese e istituzioni.', 0, 'fondazione_edulife.png', 'Lungadige Galtarossa, 21, 37133 Verona VR', 'https://www.fondazioneedulife.org/'),
	(4, 'Calzedonia', 'Abbigliamento', 'Dossobuono', 'Calzedonia Group è un\'azienda italiana fondata nel 1986 a Dossobuono di Villafranca, Verona, specializzata nella produzione e distribuzione di calze, collant, intimo e costumi da bagno. Il gruppo possiede vari marchi come Calzedonia, Intimissimi, Tezenis e Falconeri. Grazie alla sua rete di negozi in franchising e diretti, è presente in tutto il mondo, offrendo prodotti di qualità e alla moda.', 0, 'calzedonia.png', 'Via Monte Baldo 20. 37062 Dossobuono di Villafranca (VR)', 'https://www.oniverse.it/'),
	(5, 'Bauli', 'Alimentazione', 'Castel d\'Azzano', 'Bauli S.p.A., con sede a Castel d\'Azzano (VR), è una storica azienda italiana specializzata nella produzione di prodotti dolciari da forno, fondata nel 1922 da Ruggero Bauli. È rinomata per il suo iconico Pandoro, Panettone e una vasta gamma di prodotti stagionali e per la colazione, che uniscono tradizione e innovazione. La missione dell\'azienda è offrire prodotti di alta qualità, puntando su ingredienti genuini e processi artigianali.', 0, 'bauli.png', 'Via G. Verdi, 31, 37060 Castel d\'Azzano VR', 'https://www.bauli.it/it'),
	(6, 'Fincantieri', 'Ingegneria', 'Valeggio sul Mincio', 'Fincantieri è uno dei più grandi gruppi cantieristici al mondo, leader nella progettazione e costruzione di navi da crociera, militari e offshore. La sede di Verona si occupa principalmente di progetti tecnici e innovativi per il settore navale. Con una forte attenzione alla sostenibilità, Fincantieri è impegnata in soluzioni che riducono l\'impatto ambientale delle sue navi.', 0, 'fincantieri.png', 'Piazza Cittadella, 3, 37122 Verona VR', 'https://www.fincantieri.com/it/'),
	(7, 'Veronesi', 'Alimentazione', 'San Martino Buon Albergo', 'Il Gruppo Veronesi è leader nel settore agroalimentare italiano e comprende marchi noti come AIA, Negroni e Veronesi Mangimi. Fondato nel 1958, si distingue per la produzione integrata che copre tutte le fasi della filiera, dall\'allevamento alla distribuzione di carni bianche e salumi, nonché mangimi per l\'alimentazione animale. La sostenibilità e l\'innovazione sono i suoi pilastri, con un impegno costante verso la qualità e la sicurezza alimentare.', 0, 'veronesi.png', 'Via Valpantena 18/G. Quinto di Valpantena 37142 Verona ', 'https://www.gruppoveronesi.it/'),
	(8, 'Zambon group', 'Farmaceutico', 'Verona', 'Zambon è un\'azienda farmaceutica globale con sede a Verona, parte di Zambon Group, che si occupa di innovazione nel campo della salute e del benessere. Fondata nel 1906, Zambon sviluppa e produce soluzioni terapeutiche in aree chiave come malattie respiratorie, dolore e disturbi neurologici. Grazie all\'impegno nella ricerca e sviluppo, Zambon mira a migliorare la qualità della vita dei pazienti attraverso innovazioni e soluzioni personalizzate.', 0, 'zambon_group.png', 'Via della Chimica, 9, 37136 Verona VR, Italia', 'https://www.zambon.com/en'),
	(9, 'P-Lab', 'IT', 'Verona', 'P-Lab è una software house con sede a Verona, specializzata nello sviluppo di soluzioni software personalizzate. Offriamo consulenza e implementazione di applicazioni innovative per ottimizzare i processi aziendali. Il nostro team utilizza tecnologie all\'avanguardia e metodologie agili per soddisfare le esigenze specifiche dei clienti.', 0, 'p-lab.png', 'viale 37135, Viale del Lavoro, 33, 37135 Verona VR', 'https://www.p-lab.it/'),
	(10, 'Gruppo Cattolica Assicurazioni', 'Assicurazioni', 'Verona', 'Cattolica Assicurazioni, fondata nel 1896 e con sede a Verona, è una delle principali compagnie assicurative italiane. Offre prodotti assicurativi come polizze vita, previdenziali e danni, con un forte focus sulla sostenibilità e innovazione. La compagnia si distingue per la qualità dei servizi e un approccio orientato al cliente.', 0, 'cattolica_assicurazioni.png', 'Via Calatafimi, 5, 37126 Verona VR', 'https://www.cattolica.it/'),
	(11, 'Isopan', 'Edilizia', 'Trevenzuolo', 'Isopan Trevenzuolo è un’azienda specializzata nella produzione di pannelli sandwich per l\'edilizia e l\'industria. Con un\'attenzione particolare alla qualità e all\'innovazione, offre soluzioni efficienti per l\'isolamento termico e acustico. La loro gamma di prodotti è ideale per costruzioni sostenibili e a basse emissioni.', 0, 'isopan.png', 'Via Giona, 5, 37060 Trevenzuolo VR', 'https://isopan.it/'),
	(12, 'Zalando', 'Moda', 'Nogarole Rocca', 'Zalando è un\'importante piattaforma di moda e lifestyle che offre una vasta gamma di prodotti, tra cui abbigliamento, calzature e accessori. Il centro logistico di Nogarole Rocca, situato in una posizione strategica, gestisce efficientemente le operazioni di distribuzione e spedizione per l\'Italia e l\'Europa, garantendo un servizio rapido e di qualità.', 0, 'zalando.png', 'Via de Gasperi, 15, 37060 Nogarole Rocca VR', 'https://www.zalando.it/'),
	(13, 'AIA', 'Alimentare', 'San Martino Buon Albergo', 'AIA San Martino Buon Albergo è un\'azienda leader nel settore agroalimentare, specializzata nella produzione e distribuzione di carni fresche e trasformati. Con un forte impegno per la qualità e la sostenibilità, AIA offre prodotti di alta gamma, garantendo tracciabilità e sicurezza alimentare.', 0, 'aia.png', 'Piazzale Apollinare Veronesi, 1, CAP 37036 - San Martino Buon Albergo Verona - Italia', 'https://www.aiafood.com/'),
	(14, 'Mondadori', 'Editoria', 'Verona', 'Mondadori Verona è una delle principali case editrici italiane, specializzata in una vasta gamma di pubblicazioni, dai romanzi alla saggistica, dai libri per bambini a quelli di cucina. Con un forte impegno verso la qualità e l\'innovazione, Mondadori è un punto di riferimento per lettori e autori.', 0, 'mondadori.png', 'Corso Sant\'Anastasia, 7, 37121 Verona VR', 'https://www.mondadori.it/'),
	(15, 'Pastificio Rana', 'Alimentare', 'San Giovanni Lupatoto', 'Rana, situata a San Giovanni Lupatoto, è un\'azienda leader nella produzione di pasta fresca e prodotti gastronomici. Fondata nel 1960, combina tradizione e innovazione, offrendo una vasta gamma di ravioli, gnocchi e sughi. La qualità degli ingredienti e la passione per la cucina italiana sono al centro della sua missione.', 0, 'pastificio_rana.png', 'Via Antonio Pacinotti, 25, 37057 San Giovanni Lupatoto VR', 'https://www.giovannirana.it/');

-- Dump della struttura di tabella proworkdb.dipendente
CREATE TABLE IF NOT EXISTS `dipendente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `ruolo` varchar(200) DEFAULT NULL,
  `eta` int(10) unsigned NOT NULL,
  `anni_servizio` enum('Meno di un anno','Da 1 a 4 anni','Da 5 a 10 anni','Da più di 10 anni') DEFAULT NULL,
  `genere` enum('M','F','Preferisco non specificarlo') DEFAULT NULL,
  `azienda_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_azienda` (`azienda_id`),
  CONSTRAINT `fk_azienda` FOREIGN KEY (`azienda_id`) REFERENCES `azienda` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Dump dei dati della tabella proworkdb.dipendente: ~46 rows (circa)
INSERT IGNORE INTO `dipendente` (`id`, `username`, `password`, `ruolo`, `eta`, `anni_servizio`, `genere`, `azienda_id`) VALUES
	(1, 'martaroech', '$2b$12$iGggJPupcjZASxeLfSGsFeiX3AVbgemtPjj1uZoAyw62EQFmRFxGS', 'Programmatore', 21, 'Meno di un anno', 'M', 3),
	(2, 'Maureen', '$2b$12$nwHmRx9XJt5jHxo11U2YkekSoUlN6FEDfdbfL/Dy52md1sWKP30Qu', 'Responsabile Risorse Umane', 22, 'Da 1 a 4 anni', 'F', 1),
	(3, 'Mattia', '$2b$12$GfMH6VxeEW67ZB5vxaffDuBQlmdBh7VdfqRPac2/8IbcJbPGRjx2e', 'Interlocutore di ChatGPT', 24, 'Da 5 a 10 anni', 'M', 2),
	(4, 'Alessandro', '$2b$12$sG3onbZCsQw81KQPhtZ3vuJ.cYNxYDGWYXmRinrBiUVVePIT3CoMa', 'Project Manager', 21, 'Meno di un anno', 'M', 1),
	(5, 'admin', '$2b$12$v5VfpNhhvEsVdo7yvQhJleeQHpT3BYyKR8x8iGXP9r5NyWECNhbcG', 'DIVINITA\'', 1404, 'Da più di 10 anni', 'Preferisco non specificarlo', 4),
	(6, 'MarcoRossi', '$2b$12$i0rIoe1ysivhISmloO6VROElflAWz48Z9xr3QJeWLf2uD9AtjK.1i', 'Manager', 30, 'Da 1 a 4 anni', 'M', 11),
	(7, 'GiuliaBianchi', '$2b$12$VSHrra7UCXPd.zSW7JuZ/OYNnSC6JyB1wR0MA5BS2BAVbNKat7MFW', 'Sviluppatore', 25, 'Meno di un anno', 'F', 14),
	(8, 'LucaVerdi', '$2b$12$XfJxSk6w122raT5TvOD6o.M6piHXkH15mwVfh5OPSRW5Br5ca8QEK', 'Analista', 35, 'Da 5 a 10 anni', 'M', 7),
	(9, 'SofiaEsposito', '$2b$12$8gqXumQOptcY8//yMsoouesXb3FPcToUUUphYuVand8j8dQaSEMSS', 'Designer', 28, 'Da più di 10 anni', 'F', 6),
	(10, 'AlessandroRomano', '$2b$12$LDb/KNDJF/6QnhxFmNeI3.zIp1e21.SKcXVYQNDugu2s9uE50rCXG', 'Project Manager', 40, 'Da 1 a 4 anni', 'M', 10),
	(11, 'ChiaraFontana', '$2b$12$jg7v.SkUbjKWlXSFpVqK3OT1S5Idlx9g80Eivd4a8UIukyunQllIO', 'Risorse Umane', 32, 'Da 5 a 10 anni', 'F', 2),
	(12, 'FrancescoGallo', '$2b$12$n2TwNAF9R.yH6KgkRpDtEuEoQL6SqifubB.1Gt9rTiiyguDGeFJS.', 'Specialista Marketing', 29, 'Meno di un anno', 'M', 7),
	(13, 'MartinaGreco', '$2b$12$IUjyBnsz7IsTkjUsB.scCORPMQHyvvhF0TI6Wv.cdkBPvNUHqcILa', 'Data Scientist', 27, 'Da più di 10 anni', 'F', 14),
	(14, 'MatteoRinaldi', '$2b$12$GHYLPBj5pocWD6MGRcil.erCzThpCDX2muaguJ6MmQGwhx60fCSgm', 'Ingegnere Software', 26, 'Da 1 a 4 anni', 'M', 5),
	(15, 'SaraConti', '$2b$12$11q5HdqVUTRlLyenjFTFR.u3PzUlnqr371ucJ0KFsibEG5Oj.mdYi', 'Responsabile Vendite', 31, 'Da 5 a 10 anni', 'F', 14),
	(16, 'RobertoDeLuca', '$2b$12$75r75uHoznjbIoE4BUnxbeC.ZqWT5rtfDSawDHvBtalwJFQXH3z26', 'Product Owner', 38, 'Da più di 10 anni', 'M', 7),
	(17, 'GiovanniRicci', '$2b$12$0m/PI4baw5268WJNovkD4.gs51QxJZhgyce5nYIMAzC/ETUyMVx9e', 'Sviluppatore Web', 34, 'Meno di un anno', 'M', 10),
	(18, 'AnnaMarino', '$2b$12$edukZ9DJzg9lWB/YUHOCTOqN5wgBQPawp0cUxPXe78uuuhrQA9Bpe', 'Copywriter', 24, 'Da 1 a 4 anni', 'F', 12),
	(19, 'SimoneCosta', '$2b$12$OgSN4vIvk.IxgdTTzTxT.uTnPqAccIUDvj93HeHj03djvRRNctmJm', 'Assistenza Clienti', 22, 'Da 5 a 10 anni', 'M', 15),
	(20, 'ElenaVilla', '$2b$12$3HdQ28l5Pqd0YckZwr3RveBRtyk8szb9MRGpzfdFwG3B4OXKcgwou', 'Analista Finanziario', 37, 'Da più di 10 anni', 'F', 6),
	(21, 'StefanoCaruso', '$2b$12$m7OxzBazKBJdoJ11iQW/MuAXelcYC3bfXxJTtHsGuz84h7t0DRtgG', 'Business Analyst', 36, 'Meno di un anno', 'M', 2),
	(22, 'FrancescaMarini', '$2b$12$PTnc1cdutwSgwazDLS7cHumtGlE07ciA1hsssSyfXWCg25Ug3Y./W', 'Responsabile Operativo', 33, 'Da 1 a 4 anni', 'F', 5),
	(24, 'ChiaraRicci', '$2b$12$1tVA0I5ngfZA3/B8UN1wG.FjgZjqnxWyTpcy0UP0yb.6H1KUNg5.y', 'Social Media Manager', 29, 'Da più di 10 anni', 'F', 15),
	(25, 'LorenzoFabbri', '$2b$12$NUNItgZehbK4r6BTP2x5pehdA4B8uNrCACPVATMTg4uTpo0eCTLWK', 'SEO Specialist', 26, 'Meno di un anno', 'M', 6),
	(26, 'AliceGatti', '$2b$12$2gYsowQVS7ik8rPvBV1ngeAueiA8.vX1CEokWbeVxeZRJu2Rc2M7q', 'Graphic Designer', 28, 'Da 1 a 4 anni', 'F', 4),
	(27, 'NicolaRiva', '$2b$12$SfJeLfMzke84/BEE5gfYf.HvioQNvI7YyOolGSDZueRaIj2Y1SUiW', 'Data Analyst', 35, 'Da 5 a 10 anni', 'M', 12),
	(28, 'LauraBelli', '$2b$12$kAURJRio3eFQ9gbzMIK2WefPTXGHZFVtDO2hjoY14ckjfOiW6lcgC', 'Product Manager', 32, 'Da più di 10 anni', 'F', 4),
	(29, 'DarioLongo', '$2b$12$vCt6nhfyXH3iLoCX5oieeuQ0vZdEVW2KlZe5X9dzj4i/dlNK8UTkS', 'Operaio', 21, 'Meno di un anno', 'M', 9),
	(30, 'SaraDeSantis', '$2b$12$XTt/KGimUVVx4uxclbzTwO0W8MXBWD9IKvCDyl5qCtJFAn14ZTHHe', 'Designer UX', 27, 'Da 1 a 4 anni', 'F', 13),
	(31, 'AndreaColombo', '$2b$12$7qFaSlx.qef97kulnk7wOepoo3E5J3nj5QKGuTeRtxQh.xU7hqnda', 'Ricercatore', 39, 'Da 5 a 10 anni', 'M', 8),
	(32, 'ValentinaSala', '$2b$12$xkHTpvgn/yooRPhyFIyzTOMtWaUXf5dNYTAQ2qfuZ8BJEFR1.DQc.', 'Web Designer', 29, 'Da più di 10 anni', 'F', 15),
	(33, 'VincenzoGallo', '$2b$12$EPqhJtdOcZeXyN5sB9QoKOZy3cgB/5KJFx0..kHvUh1rn2JfFI5Ke', 'Coordinatore Eventi', 34, 'Meno di un anno', 'M', 5),
	(34, 'MartinaFerri', '$2b$12$Fl3TtB7hyh81MRQvPFXv1u6oxAD9Pjl9twQF74u55W6tk5Sbs025.', 'Scrittore Tecnico', 25, 'Da 1 a 4 anni', 'F', 11),
	(35, 'StefanoPugliese', '$2b$12$pH7BQludplGz5KkDCIOZ5OVvXHWocw2wSM6v4gwTLaqmFR6yZyfCq', 'Amministratore Database', 36, 'Da 5 a 10 anni', 'M', 8),
	(36, 'CristinaVitale', '$2b$12$/Mnlmf.4CXs77X/E6dPcheP.A9MpucGeE4jXIKe8HcjhuB48cvgRy', 'Ingegnere di Rete', 29, 'Da più di 10 anni', 'F', 13),
	(38, 'GiorgiaBarone', '$2b$12$jZu8H1CTouC7XZTpyNZfqedPRzqEHHd/2Dq9pSH/aT9E1/frp1BOm', 'Responsabile Account', 24, 'Da 1 a 4 anni', 'F', 12),
	(39, 'RaffaeleMancini', '$2b$12$A/IreqMDGFdDePZ61og/EObBB5Au..wWHI/eXaYCsGoZzLQJTaD02', 'Responsabile Logistica', 30, 'Da 5 a 10 anni', 'M', 13),
	(40, 'TeresaFiori', '$2b$12$f8fD3Ma9Sx7BMryiDVO6TuzK.T3BWKxhXm/coxd99nLrOUN0nqvS.', 'Sviluppo Business', 26, 'Da più di 10 anni', 'F', 9),
	(41, 'FrancescoGrassi', '$2b$12$w0lBQuxkmA24BZxjftYwu.5Po1DsHmnpdCapTHUdaPGLm1VmwTFJO', 'Specialista Sicurezza', 37, 'Meno di un anno', 'M', 8),
	(42, 'BarbaraDeAngelis', '$2b$12$heU5QMCxchStTrBjGDtvoe7tc8MCLoaBBj3vOkwa/kJQjM9t5khAO', 'Amministratore di Sistema', 29, 'Da 1 a 4 anni', 'F', 3),
	(44, 'SerenaCorsi', '$2b$12$oKHvZv8ILjjLfnEPy6T8k.HES/3wWwtjeGXGNF4Y6s402864d6IfC', 'Specialista Formazione', 28, 'Da più di 10 anni', 'F', 3),
	(45, 'SaraBianchi', '$2b$12$esYWE7oLpPUyzmYHw1LI0u3r32O4gw3oy8Ahw92gZ11V2z6tdwgyG', 'Operaio', 30, 'Da 1 a 4 anni', 'F', 1),
	(46, 'GiulioBrescianini', '$2b$12$Gh1t5zsIwmT.Jct1eW7eZe7ibi24sbbUjll6MJxVwybajgQ/TuQGG', 'Segretario', 48, 'Da 5 a 10 anni', 'M', 10),
	(47, 'GiadaScalvini', '$2b$12$QG0dU8OYwJMGi3BqhWy8VOjoyhV3iNkSsSUc5/ZorZ/zhX5hnzg0S', 'Contabile', 41, 'Da 5 a 10 anni', 'F', 11),
	(48, 'GiorgioChiellini', '$2b$12$BSjDwqmUqqj5c4ketYMEnueO2IbwVn82mjfye7tL0eG6stsv7XDyW', 'Operaio', 39, 'Da più di 10 anni', 'M', 9),
	(49, 'GiuliaCesarini', '$2b$12$gFf7klcMaHbaSHYSv2T5rOebOKDYmLg8BN49BRcDL/DzrEmv958UO', 'Segretario', 56, 'Da 5 a 10 anni', 'F', 4);

-- Dump della struttura di tabella proworkdb.dipendente_recensione
CREATE TABLE IF NOT EXISTS `dipendente_recensione` (
  `id_dipendente` int(10) unsigned NOT NULL,
  `id_recensione` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_dipendente`,`id_recensione`) USING BTREE,
  KEY `id_recensione` (`id_recensione`),
  KEY `id_dipendente` (`id_dipendente`),
  CONSTRAINT `FK_dipendente_recensione_dipendente` FOREIGN KEY (`id_dipendente`) REFERENCES `dipendente` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dipendente_recensione_ibfk_2` FOREIGN KEY (`id_recensione`) REFERENCES `recensione` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Dump dei dati della tabella proworkdb.dipendente_recensione: ~45 rows (circa)
INSERT IGNORE INTO `dipendente_recensione` (`id_dipendente`, `id_recensione`) VALUES
	(2, 1),
	(1, 2),
	(3, 3),
	(4, 4),
	(45, 5),
	(11, 7),
	(21, 8),
	(42, 9),
	(44, 10),
	(49, 11),
	(26, 12),
	(14, 13),
	(22, 14),
	(9, 15),
	(20, 16),
	(8, 17),
	(12, 18),
	(16, 19),
	(31, 20),
	(35, 21),
	(29, 22),
	(40, 23),
	(10, 24),
	(17, 25),
	(6, 26),
	(34, 27),
	(18, 28),
	(27, 29),
	(30, 30),
	(36, 31),
	(7, 32),
	(13, 33),
	(19, 34),
	(24, 35),
	(28, 39),
	(33, 40),
	(25, 41),
	(41, 43),
	(48, 44),
	(46, 45),
	(47, 46),
	(38, 47),
	(39, 48),
	(15, 49),
	(32, 50);

-- Dump della struttura di tabella proworkdb.recensione
CREATE TABLE IF NOT EXISTS `recensione` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `testo` varchar(500) NOT NULL,
  `salario` enum('1','2','3','4','5','6') NOT NULL,
  `orario_flessibile` enum('1','2','3','4','5','6') NOT NULL,
  `benefit_aziendali` enum('1','2','3','4','5','6') NOT NULL,
  `sicurezza_sul_lavoro` enum('1','2','3','4','5','6') NOT NULL,
  `benessere_mentale` enum('1','2','3','4','5','6') NOT NULL,
  `rapporto_interpersonale` enum('1','2','3','4','5','6') NOT NULL,
  `crescita_professionale` enum('1','2','3','4','5','6') NOT NULL,
  `id_azienda` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_recensione_azienda` (`id_azienda`),
  CONSTRAINT `FK_recensione_azienda` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Dump dei dati della tabella proworkdb.recensione: ~45 rows (circa)
INSERT IGNORE INTO `recensione` (`id`, `testo`, `salario`, `orario_flessibile`, `benefit_aziendali`, `sicurezza_sul_lavoro`, `benessere_mentale`, `rapporto_interpersonale`, `crescita_professionale`, `id_azienda`) VALUES
	(1, 'Non la consiglio', '5', '2', '3', '3', '2', '4', '3', 1),
	(2, 'Sono molto contento di lavorare qui', '4', '5', '4', '5', '5', '5', '5', 3),
	(3, 'Il lavoro è molto semplice, i colleghi ti aiutano nei momenti di bisogno', '4', '5', '1', '5', '5', '5', '4', 2),
	(4, 'Lavoro pesante, colleghi fantastici,orari poco flessibili', '5', '3', '4', '1', '1', '5', '2', 1),
	(5, 'Ottima azienda, ambiente di lavoro stimolante e buoni benefit.', '4', '5', '4', '5', '5', '5', '5', 1),
	(7, 'Team affiatato, sempre pronti ad aiutarsi a vicenda.', '5', '5', '5', '4', '4', '5', '4', 2),
	(8, 'Azienda seria, ma gli stipendi potrebbero essere migliori.', '2', '2', '3', '4', '3', '4', '3', 2),
	(9, 'Mi piace lavorare qui, l’orario flessibile è un grande vantaggio.', '5', '5', '5', '5', '4', '4', '5', 3),
	(10, 'Possibilità di apprendere molto, ma manca un piano di carriera chiaro.', '3', '4', '2', '3', '4', '4', '3', 3),
	(11, 'Ottima gestione, ma i benefit potrebbero essere più vari.', '4', '5', '4', '5', '5', '5', '4', 4),
	(12, 'Azienda innovativa, ma stressante nei periodi di scadenza.', '2', '2', '1', '4', '3', '3', '2', 4),
	(13, 'Buon equilibrio tra vita privata e lavoro.', '5', '5', '5', '5', '5', '5', '5', 5),
	(14, 'Compenso adeguato e ambiente molto collaborativo.', '4', '4', '4', '4', '4', '4', '4', 5),
	(15, 'Un’ottima esperienza, ma servirebbero più eventi di team building.', '3', '3', '3', '3', '2', '4', '3', 6),
	(16, 'Alcune procedure potrebbero essere migliorate, ma complessivamente ok.', '3', '5', '2', '4', '4', '4', '3', 6),
	(17, 'Colleghi fantastici, ci si sente come in famiglia.', '5', '5', '5', '5', '5', '5', '5', 7),
	(18, 'Stipendio nella media, ma l’ambiente è molto positivo.', '4', '2', '2', '3', '3', '3', '3', 7),
	(19, 'Non c’è molta flessibilità negli orari, ma le ferie sono generose.', '2', '2', '3', '4', '4', '4', '3', 7),
	(20, 'Le opportunità di formazione sono eccellenti.', '5', '5', '4', '5', '5', '5', '4', 8),
	(21, 'Azienda solida, ma mancano iniziative per il benessere dei dipendenti.', '3', '2', '2', '3', '3', '3', '2', 8),
	(22, 'Mi sento molto motivato a lavorare qui, bellissimo ambiente.', '5', '5', '5', '5', '5', '5', '5', 9),
	(23, 'Possibilità di lavoro remoto, ma non sempre garantita.', '4', '4', '4', '4', '4', '4', '4', 9),
	(24, 'Poche opportunità di avanzamento, ma l’azienda è affidabile.', '2', '2', '2', '3', '3', '3', '2', 10),
	(25, 'La comunicazione interna potrebbe essere migliorata.', '3', '4', '3', '4', '3', '3', '3', 10),
	(26, 'Ambiente di lavoro stimolante, molti progetti interessanti.', '5', '5', '5', '5', '5', '5', '5', 11),
	(27, 'Occasionalmente stressante, ma nel complesso positivo.', '3', '3', '3', '4', '3', '3', '2', 11),
	(28, 'Soddisfazione generale, ma si potrebbe fare di più per i dipendenti.', '4', '4', '4', '4', '4', '4', '4', 12),
	(29, 'Compenso giusto, ma ci sono troppe ore di lavoro.', '2', '3', '2', '3', '2', '4', '2', 12),
	(30, 'Bel posto dove lavorare, ma ci sono momenti di alta pressione.', '3', '2', '3', '4', '3', '3', '3', 13),
	(31, 'Ottimo supporto da parte dei superiori.', '5', '5', '4', '5', '5', '5', '4', 13),
	(32, 'Poche ore di straordinario, ma buoni benefit.', '4', '4', '4', '4', '4', '4', '4', 14),
	(33, 'Compenso nella media, e l’ambiente è accogliente.', '3', '3', '3', '3', '3', '3', '2', 14),
	(34, 'Un ambiente di lavoro molto competitivo.', '4', '2', '3', '4', '3', '3', '3', 15),
	(35, 'Occasionale stress, ma ottime opportunità di networking.', '3', '5', '4', '5', '4', '4', '4', 15),
	(39, 'Stipendi bassi rispetto alla media del settore.', '2', '2', '2', '2', '2', '2', '2', 4),
	(40, 'La mancanza di formazione adeguata rende difficile crescere professionalmente.', '3', '3', '1', '2', '2', '2', '1', 5),
	(41, 'Stress elevato senza un adeguato supporto da parte della direzione.', '2', '1', '1', '1', '1', '1', '1', 6),
	(43, 'Atmosfera pesante e poco motivante.', '2', '1', '2', '2', '1', '2', '2', 8),
	(44, 'L\'azienda non rispetta gli accordi sul lavoro da remoto.', '1', '1', '1', '2', '1', '2', '1', 9),
	(45, 'Lavorare qui è frustrante, la direzione è poco comunicativa.', '1', '1', '1', '2', '1', '1', '1', 10),
	(46, 'Il morale è basso a causa delle continue pressioni sui risultati.', '1', '1', '1', '1', '1', '1', '1', 11),
	(47, 'I benefit sono minimi e non rispondono alle esigenze dei dipendenti.', '2', '1', '1', '1', '1', '1', '1', 12),
	(48, 'L\'azienda è disorganizzata e mancano procedure chiare.', '1', '1', '1', '1', '2', '1', '1', 13),
	(49, 'Inadeguatezza dei mezzi e delle risorse, ci sono difficoltà nel lavoro quotidiano.', '2', '1', '1', '2', '1', '1', '1', 14),
	(50, 'Nonostante l’impegno, non ci sono riconoscimenti tangibili.', '2', '2', '2', '2', '2', '2', '2', 15);

-- Dump della struttura di tabella proworkdb.utente
CREATE TABLE IF NOT EXISTS `utente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `eta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;

-- Dump dei dati della tabella proworkdb.utente: ~3 rows (circa)
INSERT IGNORE INTO `utente` (`id`, `username`, `password`, `eta`) VALUES
	(1, 'MarioRossi', '$2b$12$cEgfUs6xsCZiOK5YR5MaA.G3zEoHB7Ip45uVJ/IKMkNwGaU8U/1LS', 20),
	(2, 'LuigiVerdi', '$2b$12$TeS5IiRc0r8bJgawfv.T4O1q3dciKgDBN16EW896.xLqM5eRJhB1K', 21),
	(3, 'MariaGialli', '$2b$12$2jlBHeArH1pGvy9U741UEOUKeLgEI1.KyopEdbYYHrxGy/h7mjRC2', 18);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
