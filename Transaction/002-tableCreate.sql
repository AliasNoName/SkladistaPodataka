use [SkladistaPodataka]
go

Create table [dbo].[Dobavljac] (
	DobavljacId int not null primary key identity,
	DobavljacIme nvarchar(20) not null,
	DobavljacIBAN nvarchar(max) not null,
	DobavljacKontakt nvarchar(max) not null
)
go

Create table [dbo].[Skladiste] (
	SkladisteId int not null primary key identity,
	SkladisteIme nvarchar(20) not null ,
	SkladisteLokacija nvarchar(max)
)
go

Create table [dbo].[Artikal] (
	ArtikalId int not null primary key identity,
	ArtikalIme nvarchar(20) not null,

	FK_IdDobavljac int not null references Dobavljac(DobavljacId) on delete no action
)
go

Create table [dbo].[Kafic] (
	KaficId int not null primary key identity,
	KaficIme nvarchar(20) not null,
	KaficLokacija nvarchar(max)
)
go

Create table [dbo].[Korisnik] (
	KorisnikId int not null primary key identity,
	KorisnikIme nvarchar(20) not null,
	KorisnikMobitel nvarchar(max) not null
)
go

Create table [dbo].[ArtikliSkladista] (
	ArtikliSkladistaId int not null primary key identity,
	ArtikliSkladistaKolicina int,
	MinKolicina int,
	OptimalnaKolicina int,

	FK_IdArtikal int not null references Artikal(ArtikalId) on delete no action,
	FK_IdSkladiste int references Skladiste(SkladisteId) on delete no action
)
go


Create table [dbo].[NarudzbaZaKafic] (
	NarudzbaZaKaficId int not null primary key identity,
	VrijemeKreiranja date not null,
	StatusNarudzbe int not null,
	VrijemeDostave date,

	FK_IdKafic int not null references Kafic(KaficId) on delete no action,
	FK_IdKorisnik int not null references Korisnik(KorisnikId) on delete no action,
	FK_IdSkladiste int references Skladiste(SkladisteId) on delete no action
)
go

Create table [dbo].[ListaZaNarudzbe] (
	ListaZaNarudzbeId int not null primary key identity,
	ListaZaNarudzbeKolicina int not null,

	FK_IdArtikal int not null references Artikal(ArtikalId) on delete no action,
	FK_IdNarudzbaZaKafic int not null references NarudzbaZaKafic(NarudzbaZaKaficId) on delete no action
)
go

Create table [dbo].[NarudzbaDobavljacu] (
	NarudzbaDobavljacuId int not null primary key identity,
	DatumNarudzbe date not null,
	Cijena float not null,
	Valuta nvarchar(3),
	Kolicina int not null,

	FK_IdArtikal int not null references Artikal(ArtikalId) on delete no action,
	FK_IdDobavljac int not null references Dobavljac(DobavljacId) on delete no action
)
go