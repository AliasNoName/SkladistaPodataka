use SladistaPodataka
go

Create table [dbo].[Dobavljac] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	Racun nvarchar(max) not null
)
go

Create table [dbo].[Skladiste] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	Lokacija nvarchar(max)
)
go

Create table [dbo].[Artikal] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,

	FK_IdDobavljac int not null references Dobavljac(Id)
)
go

Create table [dbo].[Kafic] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	Lokacija nvarchar(max)
)
go

Create table [dbo].[Korisnik] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	Mobitel nvarchar(max) not null
)
go

Create table [dbo].[ArtikliSkladista] (
	Id int not null primary key identity,
	Kolicina int,
	MinKolicina int,

	FK_IdArtikal int not null references Artikal(Id),
	FK_IdSkladiste int references Skladiste(Id)
)
go


Create table [dbo].[NarudzbaZaKafic] (
	Id int not null primary key identity,
	VrijemeKreiranja datetime2 not null,
	StatusNarudzbe int not null,
	VrijemeDostave datetime2,

	FK_IdKafic int not null references Kafic(Id),
	FK_IdKorisnik int not null references Korisnik(Id),
	FK_IdSkladiste int references Skladiste(Id)
)
go

Create table [dbo].[ListaZaNarudzbe] (
	Id int not null primary key identity,
	Kolicina int not null,

	FK_IdArtikal int not null references Artikal(Id),
	FK_IdNarudzbaZaKafic int not null references NarudzbaZaKafic(Id)
)
go

Create table [dbo].[PovijestNabaveArtikla] (
	Id int not null primary key identity,
	DatumNarudzbe datetime2 not null,
	Cijena float not null,
	Valuta nvarchar(3),
	Kolicina int not null,

	FK_IdArtikal int not null references Artikal(Id),
	FK_IdDobavljac int not null references Dobavljac(Id)
)
go