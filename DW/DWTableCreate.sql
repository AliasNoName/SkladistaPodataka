use [DWSkladistaPodataka]
go


Create table [dbo].[Artikal] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	OldID int not null
)
go

Create table [dbo].[Kafic] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	OldID int not null
)
go

Create table [dbo].[Korisnik] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	OldID int not null
)
go

Create table [dbo].[Skladiste] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	OldID int not null
)
go

Create table [dbo].[FactTable] (
	Kolicina int not null,
	VrijemeKreiranja datetime2 not null,
	VrijemeDostave datetime2 not null,

	FK_IdArtikal int not null references Artikal(Id) on delete no action,
	FK_IdKafic int not null references Kafic(Id) on delete no action,
	FK_IdKorisnik int not null references Korisnik(Id) on delete no action,
	FK_IdSkladiste int not null references Skladiste(Id) on delete no action,
	

)
go
