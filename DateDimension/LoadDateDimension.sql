use [DWSkladistaPodataka]
go

/*---------------------------------------------------------------------------*/
/* Loads a Date Dimension                                                    */
/*---------------------------------------------------------------------------*/

-- A few notes, this code does nothing to the existing table, no deletes
-- are triggered before hand. Because the DateKey is uniquely indexed,
-- it will simply produce errors if you attempt to insert duplicates.
-- You can however adjust the Begin/End dates and rerun to safely add
-- new dates to the table every year.
--
-- If the begin date is after the end date, no errors occur but nothing
-- happens as the while loop never executes.

SET NOCOUNT ON -- turn off all the 1 row inserted messages

-- Hold our dates
DECLARE @BeginDate DATE
DECLARE @EndDate DATE

-- Holds a flag so we can determine if the date is the last day of month
DECLARE @LastDayOfMon CHAR(1)

-- Number of months to add to the date to get the current Fiscal date
DECLARE @FiscalYearMonthsOffset INT   

-- These two counters are used in our loop.
DECLARE @DateCounter DATE    --Current date in loop
DECLARE @FiscalCounter DATE  --Fiscal Year Date in loop

-- Set the date to start populating and end populating
SET @BeginDate = '01/01/2015'
SET @EndDate = '12/31/2020' 

-- Set this to the number of months to add to the current date to get
-- the beginning of the Fiscal year. For example, if the Fiscal year
-- begins July 1, put a 6 there.
-- Negative values are also allowed, thus if your 2010 Fiscal year
-- begins in July of 2009, put a -6.
SET @FiscalYearMonthsOffset = 6

-- Start the counter at the begin date
SET @DateCounter = @BeginDate

WHILE @DateCounter <= @EndDate
      BEGIN
            -- Calculate the current Fiscal date as an offset of
            -- the current date in the loop
            SET @FiscalCounter = DATEADD(m, @FiscalYearMonthsOffset, @DateCounter)

            -- Set value for IsLastDayOfMonth
            IF MONTH(@DateCounter) = MONTH(DATEADD(d, 1, @DateCounter))
               SET @LastDayOfMon = 'N'
            ELSE
               SET @LastDayOfMon = 'Y'  

            -- add a record into the date dimension table for this date
            INSERT  INTO [dbo].[DimDate]
                    (
                      [DateKey]
                    , [FullDate]
                    , [DateName]
                    , [DateNameUS]
                    , [DateNameEU]
                    , [DayOfWeek]
                    , [DayNameOfWeek]
                    , [DayOfMonth]
                    , [DayOfYear]
                    , [WeekdayWeekend]
                    , [WeekOfYear]
                    , [MonthName]
                    , [MonthOfYear]
                    , [IsLastDayOfMonth]
                    , [CalendarQuarter]
                    , [CalendarYear]
                    , [CalendarYearMonth]
                    , [CalendarYearQtr]
                    , [FiscalMonthOfYear]
                    , [FiscalQuarter]
                    , [FiscalYear]
                    , [FiscalYearMonth]
                    , [FiscalYearQtr]
                    )
            VALUES  (
                      ( YEAR(@DateCounter) * 10000 ) + ( MONTH(@DateCounter)
                                                         * 100 )
                      + DAY(@DateCounter)  --DateKey
                    , @DateCounter -- FullDate
                    , CAST(YEAR(@DateCounter) AS CHAR(4)) + '/'
                      + RIGHT('00' + RTRIM(CAST(DATEPART(mm, @DateCounter) AS CHAR(2))), 2) + '/'
                      + RIGHT('00' + RTRIM(CAST(DATEPART(dd, @DateCounter) AS CHAR(2))), 2) --DateName
                    , RIGHT('00' + RTRIM(CAST(DATEPART(mm, @DateCounter) AS CHAR(2))), 2) + '/'
                      + RIGHT('00' + RTRIM(CAST(DATEPART(dd, @DateCounter) AS CHAR(2))), 2)  + '/'
                      + CAST(YEAR(@DateCounter) AS CHAR(4))--DateName
                    , RIGHT('00' + RTRIM(CAST(DATEPART(dd, @DateCounter) AS CHAR(2))), 2) + '/'
                      + RIGHT('00' + RTRIM(CAST(DATEPART(mm, @DateCounter) AS CHAR(2))), 2)  + '/'
                      + CAST(YEAR(@DateCounter) AS CHAR(4))--DateName
                    , DATEPART(dw, @DateCounter) --DayOfWeek
                    , DATENAME(dw, @DateCounter) --DayNameOfWeek
                    , DATENAME(dd, @DateCounter) --DayOfMonth
                    , DATENAME(dy, @DateCounter) --DayOfYear
                    , CASE DATENAME(dw, @DateCounter)
                        WHEN 'Saturday' THEN 'Weekend'
                        WHEN 'Sunday' THEN 'Weekend'
                        ELSE 'Weekday'
                      END --WeekdayWeekend
                    , DATENAME(ww, @DateCounter) --WeekOfYear
                    , DATENAME(mm, @DateCounter) --MonthName
                    , MONTH(@DateCounter) --MonthOfYear
                    , @LastDayOfMon --IsLastDayOfMonth
                    , DATENAME(qq, @DateCounter) --CalendarQuarter
                    , YEAR(@DateCounter) --CalendarYear
                    , CAST(YEAR(@DateCounter) AS CHAR(4)) + '-'
                      + RIGHT('00' + RTRIM(CAST(DATEPART(mm, @DateCounter) AS CHAR(2))), 2) --CalendarYearMonth
                    , CAST(YEAR(@DateCounter) AS CHAR(4)) + 'Q' + DATENAME(qq, @DateCounter) --CalendarYearQtr
                    , MONTH(@FiscalCounter) --[FiscalMonthOfYear]
                    , DATENAME(qq, @FiscalCounter) --[FiscalQuarter]
                    , YEAR(@FiscalCounter) --[FiscalYear]
                    , CAST(YEAR(@FiscalCounter) AS CHAR(4)) + '-'
                      + RIGHT('00' + RTRIM(CAST(DATEPART(mm, @FiscalCounter) AS CHAR(2))), 2) --[FiscalYearMonth]
                    , CAST(YEAR(@FiscalCounter) AS CHAR(4)) + 'Q' + DATENAME(qq, @FiscalCounter) --[FiscalYearQtr]
                    )

            -- Increment the date counter for next pass thru the loop
            SET @DateCounter = DATEADD(d, 1, @DateCounter)
      END

SET NOCOUNT ON -- turn the annoying messages back on

-- Select all rows inserted for the final year as a sanity check
SELECT  *
FROM    [dbo].[DimDate]
WHERE DateKey > (YEAR(@EndDate) * 10000)