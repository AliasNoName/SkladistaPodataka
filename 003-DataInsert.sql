USE [SladistaPodataka]
GO

insert into [dbo].[Dobavljac]
				([Ime],[Racun], [Kontakt])
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



