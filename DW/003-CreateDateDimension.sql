use [DWSkladistaPodataka]
go

/* Drop table DimDate */
IF EXISTS ( SELECT  *
            FROM    dbo.sysobjects
            WHERE   id = OBJECT_ID(N'[dbo].[DimDate]')
                    AND OBJECTPROPERTY(id, N'IsUserTable') = 1 )
   DROP TABLE [dbo].[DimDate]
GO

/* Create table DimDate */
CREATE TABLE [dbo].[DimDate]
       ( [DateKey] BIGINT NOT NULL
       , [FullDate] DATE NULL
       , [DateName] CHAR(11) NULL
       , [DateNameUS] CHAR(11) NULL   --US Date FORMAT, MM/DD/YYYY
       , [DateNameEU] CHAR(11) NULL   --European Union Date Format DD/MM/YYYY
       , [DayOfWeek] TINYINT NULL
       , [DayNameOfWeek] CHAR(10) NULL
       , [DayOfMonth] TINYINT NULL
       , [DayOfYear] SMALLINT NULL
       , [WeekdayWeekend] CHAR(7) NULL
       , [WeekOfYear] TINYINT NULL
       , [MonthName] CHAR(10) NULL
       , [MonthOfYear] TINYINT NULL
       , [IsLastDayOfMonth] CHAR(1) NULL
       , [CalendarQuarter] TINYINT NULL
       , [CalendarYear] SMALLINT NULL
       , [CalendarYearMonth] CHAR(7) NULL
       , [CalendarYearQtr] CHAR(7) NULL
       , [FiscalMonthOfYear] TINYINT NULL
       , [FiscalQuarter] TINYINT NULL
       , [FiscalYear] INT NULL
       , [FiscalYearMonth] CHAR(9) NULL
       , [FiscalYearQtr] CHAR(8) NULL
       , [AuditKey] BIGINT IDENTITY NOT NULL
       , CONSTRAINT [PK_DimDate] PRIMARY KEY CLUSTERED ( [DateKey] )
       )
ON     [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name = N'Table Type', @value = N'Dimension',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate'
EXEC sys.sp_addextendedproperty @name = N'View Name', @value = N'Date',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate'
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Date dimension contains one row for every day, beginning at 1/1/2000. There may also be rows for "hasn''t happened yet."',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate'
EXEC sys.sp_addextendedproperty @name = N'Used in schemas',
  @value = N'Sales (3 roles); Finance; Currency Rates; Sales Quota (2 roles; one at Cal Qtr level)',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate'

GO

INSERT  INTO [dbo].[DimDate]  
        ( DateKey
        , FullDate
        , [DateName]
        , [DateNameUS]
        , [DateNameEU]
        , [DayOfWeek]
        , DayNameOfWeek
        , [DayOfMonth]
        , [DayOfYear]
        , WeekdayWeekend
        , WeekOfYear
        , [MonthName]
        , MonthOfYear
        , IsLastDayOfMonth
        , CalendarQuarter
        , CalendarYear
        , CalendarYearMonth
        , CalendarYearQtr
        , FiscalMonthOfYear
        , FiscalQuarter
        , FiscalYear
        , FiscalYearMonth
        , FiscalYearQtr
        )
VALUES  ( -1
        , NULL
        , 'Unknown'
        , 'Unknown'
        , 'Unknown'
        , NULL
        , 'Unknown'
        , NULL
        , NULL
        , 'Unknown'
        , NULL
        , 'Unknown'
        , NULL
        , 'N'
        , NULL
        , NULL
        , 'Unknown'
        , 'Unknown'
        , NULL
        , NULL
        , NULL
        , 'Unknown'
        , 'Unknown'
        )
GO

EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Surrogate primary key', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'DateKey' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Full date as a SQL date', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'FullDate' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Standard Date Format of YYYY/MM/DD', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'DateName' ;
  EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Standard US Date Format of MM/DD/YYYY', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'DateNameUS' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Standard European Union Date Format of DD/MM/YYYY', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'DateNameEU' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Number of the day of week; Monday = 1', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'DayOfWeek' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Day name of week', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'DayNameOfWeek' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Number of the day in the month', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'DayOfMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Number of the day in the year', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'DayOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Is today a weekday or a weekend', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'WeekdayWeekend' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Week of year', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'WeekOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Description', @value = N'Month name',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'MonthName' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Month of year', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'MonthOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Is this the last day of the calendar month?',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'IsLastDayOfMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Calendar quarter', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarQuarter' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Calendar year', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYear' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Calendar year and month', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'CalendarYearMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Calendar year and quarter', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'CalendarYearQtr' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Fiscal month of year (1..12). FY starts in July',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalMonthOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Fiscal quarter', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalQuarter' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Fiscal year. Fiscal year begins in July.',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'FiscalYear' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Fiscal year and month', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'FiscalYearMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'Fiscal year and quarter', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'FiscalYearQtr' ;
EXEC sys.sp_addextendedproperty @name = N'Description',
  @value = N'What process loaded this row?', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'AuditKey' ;
EXEC sys.sp_addextendedproperty @name = N'FK To',
  @value = N'DimAudit.AuditKey', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'AuditKey' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'20041123', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'DateKey' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'11/23/2004', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FullDate' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'23-Nov-2004', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'DateName' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'1..7',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfWeek' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'Monday',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'DayNameOfWeek' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'1..31',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'1..365',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'Weekday, Weekend', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'WeekdayWeekend' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'1..52 or 53', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'WeekOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'November', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'MonthName' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'1, 2, …, 12', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'MonthOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'Y, N',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'IsLastDayOfMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'1, 2, 3, 4', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarQuarter' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'2004',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYear' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'2004-01',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYearMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'2004Q1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYearQtr' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'1, 2, …, 12', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalMonthOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'1, 2, 3, 4', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalQuarter' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values', @value = N'2004',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'FiscalYear' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'FY2004-01', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalYearMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Example Values',
  @value = N'FY2004Q1', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalYearQtr' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DateName' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfWeek' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'DayNameOfWeek' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfMonth' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'WeekdayWeekend' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'WeekOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'MonthName' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'MonthOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'IsLastDayOfMonth' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarQuarter' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYear' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYearMonth' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYearQtr' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalMonthOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalQuarter' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'FiscalYear' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalYearMonth' ;
EXEC sys.sp_addextendedproperty @name = N'SCD  Type', @value = N'1',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalYearQtr' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DateKey' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'FullDate' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DateName' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfWeek' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'DayNameOfWeek' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'DayOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'WeekdayWeekend' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'WeekOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'MonthName' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'MonthOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'IsLastDayOfMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarQuarter' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYear' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYearMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'CalendarYearQtr' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalMonthOfYear' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalQuarter' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN', @level2name = N'FiscalYear' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalYearMonth' ;
EXEC sys.sp_addextendedproperty @name = N'Source System', @value = N'Derived',
  @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
  @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'FiscalYearQtr' ;
EXEC sys.sp_addextendedproperty @name = N'Source System',
  @value = N'Derived in ETL', @level0type = N'SCHEMA', @level0name = N'dbo',
  @level1type = N'TABLE', @level1name = N'DimDate', @level2type = N'COLUMN',
  @level2name = N'AuditKey' ;
EXEC sys.sp_addextendedproperty @name = N'Comments',
  @value = N'In the form: yyyymmdd', @level0type = N'SCHEMA',
  @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DimDate',
  @level2type = N'COLUMN', @level2name = N'DateKey' ;
GO