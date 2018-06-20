CREATE DATABASE IF NOT EXISTS `test`;

USE test;
DROP TABLE IF EXISTS book;
CREATE TABLE book (
`id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
`title` VARCHAR(100) NOT NULL,
`description` VARCHAR(255) NOT NULL,
`author` VARCHAR(100) NOT NULL,
`isbn` VARCHAR(20) NOT NULL,
`printYear` INT(11) NOT NULL,
`readAlready` TINYINT(4) NOT NULL DEFAULT '0');

insert into book (id, title, description, author, isbn, printYear, readAlready) values 
	(1, 'The Perfect Couple', 'When the bride-to-be is discovered dead in Nantucket Harbor', 'Elin Hilderbrand ', '125-1234567890', 2018, 0),
	(2, 'The Great Believers', 'A heartbreaking novel—set in 1985  ', 'Rebecca Makkai ', '125-1234567891', 2016, 0),
	(3, 'Bring Me Back', 'The book is full of quirkiness and playful detail', 'B.A. Paris ', '125-1234567892', 2017, 0),
	(4, 'Truly Madly Guilty', 'Here is the best news you have heard all year', 'Liane Moriarty', '123-125678940', 2016, 0),
	(5, 'Memoirs of a Geisha', 'A stunningly ambitious novel, and a pleasure to read', 'Arthur Golden', '125-1234567893', 2015, 0),
	(6, 'Savage Country', 'Robert Olmstead gets better with every book. If ', 'Robert Olmstead' ,'125-1234567894', 2017, 0),
	(7, 'The Sun and Her Flowers', 'From Rupi Kaur, the 1 New York Times bestselling', 'Liane Moriarty', '123-1234567895', 2017, 0),
	(8, 'Leonardo da Vinci', 'A powerful story of an exhilarating mind and life', 'Walter Isaacson', '125-1234567896', 2017, 0),
	(9, 'Reservoir 13', 'Fiercely intelligent.An astonishing new novel ', 'Jon McGregor', '123-12345678978', 2016, 0),
	(10, 'Pete the Cat: Meet Pete', 'New York Times bestselling author and artist James ', 'Robert Olmstead', '125-1234567877', 2016, 0),
	(11, 'Shh! Bears Sleeping', 'The youngest bear lovers will appreciate Martin is simple rhyming lines', 'David Martin', '123-1234567889', 2017, 0),
	(12, 'Hello You, Hello Me', 'Guaranteed to excite and engage little minds, these beautifully designed soft cloth books help', 'Surya Sajnani', '123-1234567899', 2017, 0),
	(13, 'The Wonderful Things You Will Be', 'The New York Times bestseller that celebrates the dreams', 'Emily Winfield Martin', '123-1234567876', 2015, 0),
	(14, 'Your Baby First Word Will Be DADA', 'Everyone knows that fathers wage a secret campaign', 'Jimmy Fallon', '123-1250071811', 2015, 0),
	(15, 'Llama Llama Red Pajama', 'Llama Llama tale of nighttime drama has charmed readers as a classic hardcover.', 'Jimmy Fallon', '123-0451474575', 2015, 0),
	(16, 'Dinosaur Dance!', 'A brand-new board book about dancing dinosaurs from the beloved and bestselling Sandra Boynton!', 'Jimmy Fallon', '123-1481480994', 2014, 0),
	(17, 'Star Wars: The Blueprints', 'Star Wars: The Blueprints gives an all-access pass into the Lucasfilm Archives.', 'J.W. Rinzler', '123-1234567866', 2014, 0),
	(18, 'She Sheds: A Room of Your Own', 'Create your very own hideaway right at home with She Sheds.', 'Erika Kotite', '123-1591866770', 2014, 0),
	(19, 'Save the Date ', 'This YA romance finds Charlie''s high hopes', 'Morgan Matson', '123-09876543423', 2014, 0),
	(20, 'JSick: A Memoir', 'The author details her struggle with late-stage Lyme disease in her memoir of survival', 'Porochista Khakpour', '123-1579656478', 2014, 0),
	(21, 'Save the Date', 'A hands-on guide to the ins and outs of raising and using vegetables', 'Morgan Matson', '123-0987654321', 2017, 0)
;