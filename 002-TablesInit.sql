use SladistaPodataka
go

Create table [dbo].[Dobavljac] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,
	IBAN nvarchar(max) not null unique,
	Kontakt nvarchar(max) not null
)
go

Create table [dbo].[Skladiste] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null ,
	Lokacija nvarchar(max)
)
go

Create table [dbo].[Artikal] (
	Id int not null primary key identity,
	Ime nvarchar(max) not null,

	FK_IdDobavljac int not null references Dobavljac(Id) on delete no action
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
	OptimalnaKolicina int,

	FK_IdArtikal int not null references Artikal(Id) on delete no action,
	FK_IdSkladiste int references Skladiste(Id) on delete no action
)
go


Create table [dbo].[NarudzbaZaKafic] (
	Id int not null primary key identity,
	VrijemeKreiranja datetime2 not null,
	StatusNarudzbe int not null,
	VrijemeDostave datetime2,

	FK_IdKafic int not null references Kafic(Id) on delete no action,
	FK_IdKorisnik int not null references Korisnik(Id) on delete no action,
	FK_IdSkladiste int references Skladiste(Id) on delete no action
)
go

Create table [dbo].[ListaZaNarudzbe] (
	Id int not null primary key identity,
	Kolicina int not null,

	FK_IdArtikal int not null references Artikal(Id) on delete no action,
	FK_IdNarudzbaZaKafic int not null references NarudzbaZaKafic(Id) on delete no action
)
go

Create table [dbo].[NarudzbaDobavljacu] (
	Id int not null primary key identity,
	DatumNarudzbe datetime2 not null,
	Cijena float not null,
	Valuta nvarchar(3),
	Kolicina int not null,

	FK_IdArtikal int not null references Artikal(Id) on delete no action,
	FK_IdDobavljac int not null references Dobavljac(Id) on delete no action
)
go