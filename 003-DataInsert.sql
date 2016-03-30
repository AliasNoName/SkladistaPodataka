USE [SkladistaPodataka]
GO

insert into [dbo].[Dobavljac]
				([Ime],[IBAN], [Kontakt])
	VALUES
			('Velpro',	'HR12345678907345',	'test1@mail.com'),
			('Ledo',	'HR23502209742341',	'test2@mail.com'),
			('Kras',	'HR27658091898414',	'test3@mail.com'),
			('Roto',	'HR28609204982309',	'test4@mail.com'),
			('Metro',	'HR73468209438024',	'test5@mail.com'),
			('Tommy',	'HR10965923948342',	'test6@mail.com'),
			('Nird',	'HR91409918519384',	'test7@mail.com'),
			('Konzum',	'HR10245991510242',	'test8@mail.com'),
			('IKEA',	'HR23746298957052',	'test9@mail.com'),
			('Links',	'HR09275987234987',	'test0@mail.com')
GO

Insert into [dbo].[Skladiste]
				([Ime],[Lokacija])
	VALUES
			('Prvo',	'U hotelu'),
			('Drugo',	'U rusevini'),
			('Trece',	'Na kopilici'),
			('Cetvrto',	'Jugovinil Poslovna Zona')
go

insert into [dbo].[Artikal]
			([Ime],[FK_IdDobavljac])
	Values
			('Coca Cola', (select Id from [dbo].[Dobavljac] where Ime = 'Velpro')),
			('Jamnica', (select Id from [dbo].[Dobavljac] where Ime = 'Velpro')),
			('Jamnica Sensation', (select Id from [dbo].[Dobavljac] where Ime = 'Velpro')),
			('Sprite', (select Id from [dbo].[Dobavljac] where Ime = 'Velpro')),
			('Fanta', (select Id from [dbo].[Dobavljac] where Ime = 'Velpro')),
			('Pipi', (select Id from [dbo].[Dobavljac] where Ime = 'Velpro')),
			('Sladoled Vanilija', (select Id from [dbo].[Dobavljac] where Ime = 'Ledo')),
			('Kinder Pingui', (select Id from [dbo].[Dobavljac] where Ime = 'Ledo')),
			('Snjeguljica', (select Id from [dbo].[Dobavljac] where Ime = 'Ledo')),
			('King', (select Id from [dbo].[Dobavljac] where Ime = 'Ledo')),
			('Stol Thorin', (select Id from [dbo].[Dobavljac] where Ime = 'IKEA')),
			('Stolica Makeh', (select Id from [dbo].[Dobavljac] where Ime = 'IKEA')),
			('Sjedalice Inga', (select Id from [dbo].[Dobavljac] where Ime = 'IKEA')),
			('Zavjese Clover', (select Id from [dbo].[Dobavljac] where Ime = 'IKEA')),
			('Pepeljare', (select Id from [dbo].[Dobavljac] where Ime = 'IKEA')),
			('Case Vinske Inge', (select Id from [dbo].[Dobavljac] where Ime = 'IKEA')),
			('Case Shooteri Texas', (select Id from [dbo].[Dobavljac] where Ime = 'IKEA'))
go

INSERT INTO [dbo].[Kafic]
           ([Ime],[Lokacija])
    VALUES
           ('Maduro','Doli na kraju'),
		   ('Marina','U sredini'),
		   ('Blue','Oni blizu rusevine'),
		   ('East 1','Uz kulu'),
		   ('East 2','Uz turisticku palacu'),
		   ('City One','City Centar One'),
		   ('Mall Center','Mall of Split'),
		   ('Salona','Klis')
GO

insert into [dbo].[Korisnik]
				([Ime], [Mobitel])
		VALUES
					('Ante', '091 123 4567'),
					('Mate', '092 123 4567'),
					('Ivan', '098 123 4567'),
					('Luka', '099 123 4567'),
					('Filip', '095 123 4567'),
					('Josip', '091 555 5555'),
					('Marko', '099 345 6789'),
					('Petar', '097 987 6543')
GO		

insert into [dbo].[ArtikliSkladista]
				([Kolicina],[MinKolicina],[OptimalnaKolicina],[FK_IdArtikal],[FK_IdSkladiste])
		VALUES		
					('60','20','100',(select Id from [dbo].[Artikal] where Ime='Coca Cola'),(select Id from [dbo].[Skladiste] where Ime='Prvo')),
					('45','20','100',(select Id from [dbo].[Artikal] where Ime='Pipi'),(select Id from [dbo].[Skladiste] where Ime='Prvo')),
					('21','20','100',(select Id from [dbo].[Artikal] where Ime='Fanta'),(select Id from [dbo].[Skladiste] where Ime='Prvo')),
					('34','20','100',(select Id from [dbo].[Artikal] where Ime='Jamnica Sensation'),(select Id from [dbo].[Skladiste] where Ime='Prvo')),

					('40','20','100',(select Id from [dbo].[Artikal] where Ime='Coca Cola'),(select Id from [dbo].[Skladiste] where Ime='Drugo')),
					('67','20','100',(select Id from [dbo].[Artikal] where Ime='Pipi'),(select Id from [dbo].[Skladiste] where Ime='Drugo')),
					('21','20','100',(select Id from [dbo].[Artikal] where Ime='Fanta'),(select Id from [dbo].[Skladiste] where Ime='Drugo')),
					('34','20','100',(select Id from [dbo].[Artikal] where Ime='Jamnica Sensation'),(select Id from [dbo].[Skladiste] where Ime='Drugo')),

					('52','20','100',(select Id from [dbo].[Artikal] where Ime='Jamnica'),(select Id from [dbo].[Skladiste] where Ime='Trece')),
					('10','2','15',(select Id from [dbo].[Artikal] where Ime='Sladoled Vanilija'),(select Id from [dbo].[Skladiste] where Ime='Trece')),

					
					('52','20','65',(select Id from [dbo].[Artikal] where Ime='Jamnica'),(select Id from [dbo].[Skladiste] where Ime='Cetvrto')),
					('10','2','15',(select Id from [dbo].[Artikal] where Ime='Sladoled Vanilija'),(select Id from [dbo].[Skladiste] where Ime='Cetvrto')),
					('10','2','15',(select Id from [dbo].[Artikal] where Ime='King'),(select Id from [dbo].[Skladiste] where Ime='Cetvrto')),
					('10','5','2',(select Id from [dbo].[Artikal] where Ime='Kinder Pingui'),(select Id from [dbo].[Skladiste] where Ime='Cetvrto'))
GO

insert into [dbo].[NarudzbaZaKafic]
				([VrijemeKreiranja],[StatusNarudzbe],[VrijemeDostave],[FK_IdKafic],[FK_IdKorisnik],[FK_IdSkladiste])
		VALUES
			('2016-02-03 15:10:44', '2','2016-02-07 10:44:02',(select Id from [dbo].[Kafic] where Ime='Marina'),(select Id from [dbo].[Korisnik] where Ime='Ante'),(select Id from [dbo].[Skladiste] where Ime='Prvo')),
			('2016-02-03 15:11:44', '2','2016-02-07 10:44:30',(select Id from [dbo].[Kafic] where Ime='Marina'),(select Id from [dbo].[Korisnik] where Ime='Ante'),(select Id from [dbo].[Skladiste] where Ime='Prvo')),
			('2016-03-03 12:10:44', '2','2016-03-07 14:10:55',(select Id from [dbo].[Kafic] where Ime='East 1'),(select Id from [dbo].[Korisnik] where Ime='Luka'),(select Id from [dbo].[Skladiste] where Ime='Prvo')),

			('2016-03-22 15:10:44', '1','',(select Id from [dbo].[Kafic] where Ime='Blue'),(select Id from [dbo].[Korisnik] where Ime='Mate'),(select Id from [dbo].[Skladiste] where Ime='Drugo')),
			('2016-02-03 15:10:44', '0','',(select Id from [dbo].[Kafic] where Ime='Salona'),(select Id from [dbo].[Korisnik] where Ime='Josip'),(select Id from [dbo].[Skladiste] where Ime='Drugo')),
			('2016-02-03 15:10:44', '0','',(select Id from [dbo].[Kafic] where Ime='Maduro'),(select Id from [dbo].[Korisnik] where Ime='Ante'),(select Id from [dbo].[Skladiste] where Ime='Drugo')),

			('2016-03-20 15:10:44', '1','',(select Id from [dbo].[Kafic] where Ime='Salona'),(select Id from [dbo].[Korisnik] where Ime='Marko'),(select Id from [dbo].[Skladiste] where Ime='Trece')),
			('2016-03-21 15:10:44', '1','',(select Id from [dbo].[Kafic] where Ime='City One'),(select Id from [dbo].[Korisnik] where Ime='Ivan'),(select Id from [dbo].[Skladiste] where Ime='Cetvrto'))
GO