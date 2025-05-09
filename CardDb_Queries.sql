--USE THE DATABASE
use CARDB

--Select all users
Select * From USER_

--Let's select only username and emaill
Select USERNAME_,EMAIL FROM USER_

--Find out the users that gender is Male
Select NAMESURNAME,EMAIL,TELNR1 FROM USER_
WHERE GENDER='E'

--Acquire users born after the 1989
Select NAMESURNAME,TELNR1,EMAIL FROM USER_
WHERE BIRTHDATE>'1989-01-01'

--I must implement some conditions
Select * From USER_
ORDER BY BIRTHDATE DESC;

Select * From USER_
ORDER BY CREATEDDATE DESC;

--Let's figure out how many users are from each city
Select CITYID,COUNT(*) As UserAmount
FROM USER_
GROUP BY CITYID

--I will work with JOIN EXAMPLE
Select
USER_.ID,
USER_.NAMESURNAME,
CITY.CITY As CityName,
DISTRICT.DISTRICT As DistrictName,
TOWN.TOWN As TownName
FROM USER_
LEFT JOIN CITY ON CITY.ID = USER_.CITYID
LEFT JOIN DISTRICT ON DISTRICT.ID=USER_.DISTRICTID
LEFT JOIN TOWN ON TOWN.ID=USER_.TOWNID

--User and WebOffer Inner Jo�n Queries
Select
USER_.NAMESURNAME,
USER_.EMAIL,
USER_.GENDER,
USER_.TELNR1,
USER_.EMAIL,
WEBOFFERS.BRAND,
WEBOFFERS.TITLE,
WEBOFFERS.SHIFTTYPE,
WEBOFFERS.MODEL
FROM USER_
JOIN WEBOFFERS ON WEBOFFERS.USERID=USER_.ID

--User who posted more than 2 
Select
USER_.ID,
USER_.NAMESURNAME,
USER_.TELNR1,
COUNT(WEBOFFERS.ID) As OfferAmount
From USER_
JOIN WEBOFFERS ON WEBOFFERS.USERID=USER_.ID
GROUP BY USER_.ID,USER_.NAMESURNAME,USER_.TELNR1
HAVING COUNT(WEBOFFERS.ID)>2;

--Average Offer Price Per City
Select 
CITY.CITY As CityName,
AVG(WEBOFFERS.PRICE) As AveragePrice
FROM WEBOFFERS
JOIN CITY ON WEBOFFERS.CITYID=CITY.ID
Group By CITY.CITY
ORDER BY AveragePrice DESC;

SELECT 
    C.CITY,
    W.TITLE,
    W.PRICE
FROM WEBOFFERS W
JOIN CITY C ON W.CITYID = C.ID
WHERE W.PRICE = (
    SELECT MAX(W2.PRICE)
    FROM WEBOFFERS W2
    WHERE W2.CITYID = W.CITYID
);


SELECT 
    C.CITY,
    COUNT(W.ID) AS TotalListings,
    AVG(W.PRICE) AS AvgPrice
FROM WEBOFFERS W
JOIN CITY C ON W.CITYID = C.ID
GROUP BY C.CITY
HAVING COUNT(W.ID) > 10
ORDER BY AvgPrice DESC;


--Group Users by Gender
Select
GENDER,
COUNT(*) As TotalUsers
From USER_
GROUP BY GENDER;

--Age Group
SELECT 
    CASE 
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) < 18 THEN 'Under 18'
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 18 AND 29 THEN '18-29'
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 30 AND 49 THEN '30-49'
        ELSE '50+'
    END AS AgeGroup,
    COUNT(*) AS TotalUsers
FROM USER_
GROUP BY 
    CASE 
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) < 18 THEN 'Under 18'
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 18 AND 29 THEN '18-29'
        WHEN DATEDIFF(YEAR, BIRTHDATE, GETDATE()) BETWEEN 30 AND 49 THEN '30-49'
        ELSE '50+'
    END;

--I will work with WEBOFFERS table
Select TOP 10
 TITLE,
 PRICE
FROM WEBOFFERS
ORDER BY DATE_ DESC;

--Counts of Listings
SELECT 
    C.CITY AS CityName,
    COUNT(W.ID) AS TotalListings
FROM WEBOFFERS W
JOIN CITY C ON W.CITYID = C.ID
GROUP BY C.CITY
ORDER BY TotalListings DESC;

--Average and Maximum
Select
DISTRICT.DISTRICT As DistrictName,
AVG(WEBOFFERS.PRICE) As AvgPrice,
MAX(WEBOFFERS.PRICE) As MaxPrice
FROM WEBOFFERS
JOIN DISTRICT ON WEBOFFERS.DISTRICTID=DISTRICT.ID
GROUP BY DISTRICT.DISTRICT
ORDER BY AvgPrice DESC;

SELECT 
    TITLE,
    PRICE,
    CASE 
        WHEN PRICE < 100000 THEN 'Cheap'
        WHEN PRICE BETWEEN 100000 AND 500000 THEN 'Moderate'
        ELSE 'Expensive'
    END AS PriceCategory
FROM WEBOFFERS;


SELECT 
    W.TITLE,
    W.PRICE,
    U.NAMESURNAME,
    C.CITY AS ListingCity
FROM WEBOFFERS W
JOIN USER_ U ON W.USERID = U.ID
JOIN CITY C ON W.CITYID = C.ID;


SELECT 
    U.NAMESURNAME,
    COUNT(W.ID) AS ListingCount
FROM WEBOFFERS W
JOIN USER_ U ON W.USERID = U.ID
GROUP BY U.NAMESURNAME
HAVING COUNT(W.ID) > 5
ORDER BY ListingCount DESC;
