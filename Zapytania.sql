
/*
--1. Który pracownik najczêœciej p³ywa? Podaj imiê i nazwisko.
SELECT TOP 1 P.First_Name, P.Last_Name, COUNT(PB.ID_Batch) AS Number_of_Batches
FROM 
	People P
JOIN 
	PeopleBatch PB ON P.ID_Person = PB.ID_Person
GROUP BY 
	P.ID_Person, P.First_Name, P.Last_Name
ORDER BY 
	Number_of_Batches DESC;
*/


--2.Ile doros³ych osób i dzeici wziê³o udzia³ ³¹cznie w wycieczkach w okresie wakacyjnym Czerwiec - Sierpieñ?
SELECT 
    SUM(c.How_many_adults) AS Total_Adults,
    SUM(c.How_many_children) AS Total_Children
FROM Batch b
JOIN Offer o ON b.ID_Batch = o.ID_Batch
JOIN Contract c ON o.ID_Offer = c.ID_Offer
WHERE b.Start_Date >= '2025-06-01' AND b.End_Date <= '2025-08-31';




-- 3. Na której wycieczce by³o najwiêcej klientów? I ile? 
SELECT TOP 1
    B.ID_Tour, SUM(C.How_many_adults + C.How_many_children) AS Total_Participants
FROM Contract C
JOIN Offer O ON C.ID_Offer = O.ID_Offer
JOIN Batch B ON O.ID_Batch = B.ID_Batch
GROUP BY B.ID_Tour
ORDER BY Total_Participants DESC;




--4. Ile ³¹cznie kosztowa³y ³acznie wszytkie wycieczki, których statki zatrzymywa³y siê w porcie Hiszpanii? 
SELECT SUM(c.How_many_adults * o.Cost_per_adult + c.How_many_children * o.Cost_per_child) AS Total_Cost
FROM Tour_Stops ts
JOIN Locations l ON ts.ID_Location = l.ID_Location
JOIN Batch b ON ts.ID_Tour = b.ID_Tour
JOIN Offer o ON b.ID_Batch = o.ID_Batch
JOIN Contract c ON o.ID_Offer = c.ID_Offer
WHERE l.Country = 'SPAIN';



--5. Najwieksze wype³nienie ³odki na wycieczce w okresie letnim(czerwiec - wrzesieñ)? Procent wype³nienia ³ódki 
WITH Summer_Tours AS (
    SELECT b.ID_Tour, bo.Max_capacity, SUM(c.How_many_adults + c.How_many_children) AS Total_Participants
    FROM Batch b
    JOIN Offer o ON b.ID_Batch = o.ID_Batch
    JOIN Contract c ON o.ID_Offer = c.ID_Offer
    JOIN Boat bo ON b.ID_Boat = bo.ID_Boat
    WHERE b.Start_Date >= '2025-06-01' AND b.End_Date <= '2025-09-30'
    GROUP BY b.ID_Tour, bo.Max_capacity),
Occupancy_Percentage AS (
    SELECT ID_Tour, Total_Participants, Max_capacity, CAST((CAST(Total_Participants AS DECIMAL) / Max_capacity) * 100 AS DECIMAL(5, 2)) AS Occupancy_Percentage
    FROM Summer_Tours
)
SELECT ID_Tour, Total_Participants, Max_capacity, Occupancy_Percentage
FROM Occupancy_Percentage
ORDER BY Occupancy_Percentage DESC;



--6. Jaki jest œredni koszt i czas naprawy ?
SELECT 
    AVG(Cost) AS Average_Cost,
    AVG(DATEDIFF(DAY, When_repaired_started, When_repaired_end)) AS Average_Repair_Duration
FROM Boat_Repairs;



--7. Jaka ³ódka daje najwiêkszy roczny zysk?
WITH Boat_Revenue AS (
    SELECT b.ID_Boat,
        SUM(c.How_many_adults * o.Cost_per_adult + c.How_many_children * o.Cost_per_child) AS Total_Revenue
    FROM Batch b
    JOIN Offer o ON b.ID_Batch = o.ID_Batch
    JOIN Contract c ON o.ID_Offer = c.ID_Offer
    WHERE YEAR(b.Start_Date) = 2025
    GROUP BY b.ID_Boat),
Boat_Repair_Cost AS (
    SELECT br.ID_Boat, SUM(br.Cost) AS Total_Repair_Cost
    FROM Boat_Repairs br
    WHERE YEAR(br.When_repaired_started) = 2025
    GROUP BY br.ID_Boat),
Boat_Profit AS (
    SELECT br.ID_Boat, COALESCE(r.Total_Revenue, 0) - COALESCE(rc.Total_Repair_Cost, 0) AS Profit
    FROM (SELECT DISTINCT ID_Boat FROM Boat) br
    LEFT JOIN Boat_Revenue r ON br.ID_Boat = r.ID_Boat
    LEFT JOIN Boat_Repair_Cost rc ON br.ID_Boat = rc.ID_Boat
)
SELECT ID_Boat,Profit
FROM Boat_Profit
ORDER BY Profit DESC;



--8. Jaki rodzaj ³ódek jest najczêœciej naprawianych?
SELECT bo.Type, COUNT(br.ID_Repair) AS Number_of_repairs  FROM Boat bo
JOIN Boat_Repairs br ON bo.ID_Boat = br.ID_Boat
GROUP BY bo.Type
ORDER BY Number_of_repairs DESC;



--9.Jaka jest najpopularniejsza trasa wycieczki (na podstawie liczby uczestników) oraz ile portów odwiedza?
SELECT
    T.ID_Tour,
    COUNT(DISTINCT TS.ID_Location) AS Number_of_Stops,
    SUM(C.How_many_adults + C.How_many_children) AS Total_Participants
FROM Contract C
JOIN Offer O ON C.ID_Offer = O.ID_Offer
JOIN Batch B ON O.ID_Batch = B.ID_Batch
JOIN Tour T ON B.ID_Tour = T.ID_Tour
JOIN Tour_Stops TS ON T.ID_Tour = TS.ID_Tour
GROUP BY T.ID_Tour
ORDER BY Total_Participants DESC;



-- 10.Które ³ódki s¹ najczêœciej wykorzystywane ? 
SELECT 
    BO.ID_Boat,
    BO.Name AS Boat_Name,
    SUM(DATEDIFF(DAY, B.Start_Date, B.End_Date) + 1) AS Total_Days_Used
FROM Batch B
JOIN Boat BO ON B.ID_Boat = BO.ID_Boat
WHERE YEAR(B.Start_Date) = YEAR(GETDATE()) 
GROUP BY BO.ID_Boat, BO.Name
ORDER BY Total_Days_Used DESC;
