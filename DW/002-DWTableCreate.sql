use [DWSkladistaPodataka]
go

Create table [dbo].[Artikal] (
	Id int not null primary key identity,
	ImeArtikal nvarchar(20) not null,
	OldID int not null
)
go

Create table [dbo].[Kafic] (
	Id int not null primary key identity,
	ImeKafic nvarchar(20) not null,
	OldID int not null
)
go

Create table [dbo].[Korisnik] (
	Id int not null primary key identity,
	ImeKorisnik nvarchar(20) not null,
	OldID int not null
)
go

Create table [dbo].[Skladiste] (
	Id int not null primary key identity,
	ImeSkladiste nvarchar(20) not null,
	OldID int not null
)
go
