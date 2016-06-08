USE [SkladistaPodataka]
GO

insert into [dbo].[Dobavljac]
				([DobavljacIme],[DobavljacIBAN], [DobavljacKontakt])
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
				([SkladisteIme],[SkladisteLokacija])
	VALUES
			('Prvo',	'U hotelu'),
			('Drugo',	'U rusevini'),
			('Trece',	'Na kopilici'),
			('Cetvrto',	'Jugovinil Poslovna Zona')
go

insert into [dbo].[Artikal]
			([ArtikalIme],[FK_IdDobavljac])
	Values
			('Coca Cola', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Velpro')),
			('Jamnica', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Velpro')),
			('Jamnica Sensation', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Velpro')),
			('Sprite', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Tommy')),
			('Fanta', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Konzum')),
			('Pipi', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Velpro')),
			('Sladoled Vanilija', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Ledo')),
			('Kinder Pingui', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Ledo')),
			('Snjeguljica', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Ledo')),
			('King', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Ledo')),
			('Stol Thorin', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'IKEA')),
			('Stolica Makeh', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'IKEA')),
			('Sjedalice Inga', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'IKEA')),
			('Zavjese Clover', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'IKEA')),
			('Pepeljare', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'IKEA')),
			('Case Vinske Inge', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'IKEA')),
			('Case Shooteri Texas', (select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'IKEA'))
go

INSERT INTO [dbo].[Kafic]
           ([KaficIme],[KaficLokacija])
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
				([KorisnikIme], [KorisnikMobitel])
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
				([ArtikliSkladistaKolicina],[MinKolicina],[OptimalnaKolicina],[FK_IdArtikal],[FK_IdSkladiste])
		VALUES		
					('60','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Coca Cola'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Prvo')),
					('45','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Pipi'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Prvo')),
					('21','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Fanta'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Prvo')),
					('34','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Jamnica Sensation'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Prvo')),

					('40','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Coca Cola'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Drugo')),
					('67','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Pipi'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Drugo')),
					('21','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Fanta'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Drugo')),
					('34','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Jamnica Sensation'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Drugo')),

					('52','20','100',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Jamnica'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Trece')),
					('10','2','15',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Sladoled Vanilija'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Trece')),

					
					('52','20','65',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Jamnica'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Cetvrto')),
					('10','2','15',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Sladoled Vanilija'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Cetvrto')),
					('10','2','15',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='King'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Cetvrto')),
					('10','5','2',(select ArtikalId from [dbo].[Artikal] where ArtikalIme='Kinder Pingui'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Cetvrto'))
GO

insert into [dbo].[NarudzbaZaKafic]
				([VrijemeKreiranja],[StatusNarudzbe],[VrijemeDostave],[FK_IdKafic],[FK_IdKorisnik],[FK_IdSkladiste])
		VALUES
			('2016-02-03', '2','2016-02-07',(select KaficId from [dbo].[Kafic] where KaficIme='Marina'),(select KorisnikId from [dbo].[Korisnik] where KorisnikIme='Ante'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Prvo')),
			('2016-02-03', '2','2016-02-07',(select KaficId from [dbo].[Kafic] where KaficIme='Marina'),(select KorisnikId from [dbo].[Korisnik] where KorisnikIme='Ante'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Prvo')),
			('2016-03-03', '2','2016-03-07',(select KaficId from [dbo].[Kafic] where KaficIme='East 1'),(select KorisnikId from [dbo].[Korisnik] where KorisnikIme='Luka'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Prvo')),

			('2016-03-22', '1','',(select KaficId from [dbo].[Kafic] where KaficIme='Blue'),(select KorisnikId from [dbo].[Korisnik] where KorisnikIme='Mate'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Drugo')),
			('2016-02-03', '0','',(select KaficId from [dbo].[Kafic] where KaficIme='Salona'),(select KorisnikId from [dbo].[Korisnik] where KorisnikIme='Josip'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Drugo')),
			('2016-02-03 ', '0','',(select KaficId from [dbo].[Kafic] where KaficIme='Maduro'),(select KorisnikId from [dbo].[Korisnik] where KorisnikIme='Ante'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Drugo')),

			('2016-03-20', '1','',(select KaficId from [dbo].[Kafic] where KaficIme='Salona'),(select KorisnikId from [dbo].[Korisnik] where KorisnikIme='Marko'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Trece')),
			('2016-03-21', '1','',(select KaficId from [dbo].[Kafic] where KaficIme='City One'),(select KorisnikId from [dbo].[Korisnik] where KorisnikIme='Ivan'),(select SkladisteId from [dbo].[Skladiste] where SkladisteIme='Cetvrto'))
GO
