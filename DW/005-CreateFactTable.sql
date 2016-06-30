use [DWSkladistaPodataka]
go

Create table [dbo].[FactTable] (
	Kolicina int not null,
	VrijemeKreiranja date not null,
	VrijemeDostave date,

	FK_IdArtikal int not null references Artikal(Id) on delete no action,
	FK_IdKafic int not null references Kafic(Id) on delete no action,
	FK_IdKorisnik int not null references Korisnik(Id) on delete no action,
	FK_IdSkladiste int not null references Skladiste(Id) on delete no action,
	FK_IDVrijeme bigint not null references [dbo].[DimDate](DateKey) on delete no action
	

)
go