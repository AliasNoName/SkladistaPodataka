USE [SkladistaPodataka]
GO

insert into [dbo].[ListaZaNarudzbe]
				([ListaZaNarudzbeKolicina],[FK_IdArtikal], [FK_IdNarudzbaZaKafic])
		VALUES
					('20', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Coca Cola'), (select NarudzbaZaKaficId from [dbo].NarudzbaZaKafic where NarudzbaZaKaficId=5)),
					('10', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Pipi'), (select NarudzbaZaKaficId from [dbo].NarudzbaZaKafic where NarudzbaZaKaficId=5)),
					('3', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Sladoled Vanilija'), (select NarudzbaZaKaficId from [dbo].NarudzbaZaKafic where NarudzbaZaKaficId=5)),
					('15', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Fanta'), (select NarudzbaZaKaficId from [dbo].NarudzbaZaKafic where NarudzbaZaKaficId=6)),
					('15', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Sprite'), (select NarudzbaZaKaficId from [dbo].NarudzbaZaKafic where NarudzbaZaKaficId=6)),
					('13', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Jamnica Sensation'), (select NarudzbaZaKaficId from [dbo].NarudzbaZaKafic where NarudzbaZaKaficId=6)),
					('17', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Jamnica'), (select NarudzbaZaKaficId from [dbo].NarudzbaZaKafic where NarudzbaZaKaficId=6))
go

insert into [dbo].[NarudzbaDobavljacu]
				([DatumNarudzbe],[Cijena],[Valuta],[Kolicina],[FK_IdArtikal],[FK_IdDobavljac])

		VALUES
					('2016-02-03','500','Kn','70', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Coca Cola'),(select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Velpro')),
					('2016-03-03','700','Kn','70', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Pipi'),(select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Velpro')),
					('2016-02-03','700','Kn','70', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Sladoled Vanilija'),(select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Ledo')),
					('2016-02-03','1500','Kn','5', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Stol Thorin'),(select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'IKEA')),
					('2016-03-03','700','Kn','70', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Fanta'),(select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Konzum')),
					('2016-02-03','700','Kn','70', (select ArtikalId from [dbo].[Artikal] where ArtikalIme='Jamnica'),(select DobavljacId from [dbo].[Dobavljac] where DobavljacIme = 'Tommy'))
go