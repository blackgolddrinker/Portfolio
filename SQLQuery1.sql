Select *
From Portfolio.dbo.HousePriceIndex
Select *
From Portfolio.dbo.PersonalDisposableIncome

--Round up numbers to have only 2 decimal places and update the tables.

Update Portfolio.dbo.HousePriceIndex
Set "2017Q4" = ROUND("2017Q4", 2),
"2018Q1" = ROUND("2018Q1", 2),
"2018Q2" = ROUND("2018Q2", 2),
"2018Q3" = ROUND("2018Q3", 2),
"2018Q4" = ROUND("2018Q4", 2),
"2019Q1" = ROUND("2019Q1", 2),
"2019Q2" = ROUND("2019Q2", 2),
"2019Q3" = ROUND("2019Q3", 2),
"2019Q4" = ROUND("2019Q4", 2),
"2020Q1" = ROUND("2020Q1", 2),
"2020Q2" = ROUND("2020Q2", 2),
"2020Q3" = ROUND("2020Q3", 2),
"2020Q4" = ROUND("2020Q4", 2),
"2021Q1" = ROUND("2021Q1", 2),
"2021Q2" = ROUND("2021Q2", 2),
"2021Q3" = ROUND("2021Q3", 2),
"2021Q4" = ROUND("2021Q4", 2),
"2022Q1" = ROUND("2022Q1", 2),
"2022Q2" = ROUND("2022Q2", 2),
"2022Q3" = ROUND("2022Q3", 2)

Update Portfolio.dbo.PersonalDisposableIncome
Set "2017Q4" = ROUND("2017Q4", 2),
"2018Q1" = ROUND("2018Q1", 2),
"2018Q2" = ROUND("2018Q2", 2),
"2018Q3" = ROUND("2018Q3", 2),
"2018Q4" = ROUND("2018Q4", 2),
"2019Q1" = ROUND("2019Q1", 2),
"2019Q2" = ROUND("2019Q2", 2),
"2019Q3" = ROUND("2019Q3", 2),
"2019Q4" = ROUND("2019Q4", 2),
"2020Q1" = ROUND("2020Q1", 2),
"2020Q2" = ROUND("2020Q2", 2),
"2020Q3" = ROUND("2020Q3", 2),
"2020Q4" = ROUND("2020Q4", 2),
"2021Q1" = ROUND("2021Q1", 2),
"2021Q2" = ROUND("2021Q2", 2),
"2021Q3" = ROUND("2021Q3", 2),
"2021Q4" = ROUND("2021Q4", 2),
"2022Q1" = ROUND("2022Q1", 2),
"2022Q2" = ROUND("2022Q2", 2),
"2022Q3" = ROUND("2022Q3", 2)

--Sort in the order of highest rate of HPI and PDI in the third quarter of 2022.

Select *
From Portfolio.dbo.HousePriceIndex
Order by "2022Q3" desc
Select *
From Portfolio.dbo.PersonalDisposableIncome
Order by "2022Q3" desc

--Showing PDI after HPI for each country.

SELECT *
FROM Portfolio.dbo.HousePriceIndex
UNION 
SELECT *
FROM Portfolio.dbo.PersonalDisposableIncome

--Average rate of all countries for each quarter to see the trend during the 5-year period.

Select AVG("2017Q4") as AveHPI_2017Q4, 
AVG("2018Q1") as AveHPI_2018Q1,
AVG("2018Q2") as AveHPI_2018Q2,
AVG("2018Q3") as AveHPI_2018Q3,
AVG("2018Q4") as AveHPI_2018Q4,
AVG("2019Q1") as AveHPI_2019Q1,
AVG("2019Q2") as AveHPI_2019Q2,
AVG("2019Q3") as AveHPI_2019Q3,
AVG("2019Q4") as AveHPI_2019Q4,
AVG("2020Q1") as AveHPI_2020Q1,
AVG("2020Q2") as AveHPI_2020Q2,
AVG("2020Q3") as AveHPI_2020Q3,
AVG("2020Q4") as AveHPI_2020Q4,
AVG("2021Q1") as AveHPI_2021Q1,
AVG("2021Q2") as AveHPI_2021Q2,
AVG("2021Q3") as AveHPI_2021Q3,
AVG("2021Q4") as AveHPI_2021Q4,
AVG("2022Q1") as AveHPI_2022Q1,
AVG("2022Q2") as AveHPI_2022Q2,
AVG("2022Q3") as AveHPI_2022Q3
From dbo.HousePriceIndex

Select AVG("2017Q4") as AvePDI_2017Q4, 
AVG("2018Q1") as AvePDI_2018Q1,
AVG("2018Q2") as AvePDI_2018Q2,
AVG("2018Q3") as AvePDI_2018Q3,
AVG("2018Q4") as AvePDI_2018Q4,
AVG("2019Q1") as AvePDI_2019Q1,
AVG("2019Q2") as AvePDI_2019Q2,
AVG("2019Q3") as AvePDI_2019Q3,
AVG("2019Q4") as AvePDI_2019Q4,
AVG("2020Q1") as AvePDI_2020Q1,
AVG("2020Q2") as AvePDI_2020Q2,
AVG("2020Q3") as AvePDI_2020Q3,
AVG("2020Q4") as AvePDI_2020Q4,
AVG("2021Q1") as AvePDI_2021Q1,
AVG("2021Q2") as AvePDI_2021Q2,
AVG("2021Q3") as AvePDI_2021Q3,
AVG("2021Q4") as AvePDI_2021Q4,
AVG("2022Q1") as AvePDI_2022Q1,
AVG("2022Q2") as AvePDI_2022Q2,
AVG("2022Q3") as AvePDI_2022Q3
From Portfolio.dbo.PersonalDisposableIncome

--House price compared to personal disposable income in the 3rd quarter of 2022 to see the affordability in each country.

Select Portfolio.dbo.HousePriceIndex.Countries, 
Round((Portfolio.dbo.HousePriceIndex."2022Q3" / Portfolio.dbo.PersonalDisposableIncome."2022Q3")*100, 2) as "22Q3HPIoverPDI",
CASE
When Round((Portfolio.dbo.HousePriceIndex."2022Q3" / Portfolio.dbo.PersonalDisposableIncome."2022Q3")*100, 2) > 100 then 'Expansive' 
Else 'Affordable' 
End as Affordability
From Portfolio.dbo.HousePriceIndex
Full Join Portfolio.dbo.PersonalDisposableIncome
On Portfolio.dbo.HousePriceIndex.countries = Portfolio.dbo.PersonalDisposableIncome.countries
Order by 2 Desc


