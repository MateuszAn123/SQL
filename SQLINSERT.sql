INSERT INTO People (ID_Person, First_Name, Last_Name, Number_ID, Phone_Number, Role)
VALUES 
(1, 'JAN', 'KOWALSKI', '12345', '+48700000001', 'CAPTAIN'),
(2, 'ANNA', 'NOWAK', '12346', '+48700000002', 'CREW'),
(3, 'PIOTR', 'WIŒNIEWSKI', '12347', '+48700000003', 'CREW'),
(4, 'KATARZYNA', 'WÓJCIK', '12348', '+48700000004', 'CAPTAIN'),
(5, 'TOMASZ', 'KOWALCZYK', '12349', '+48700000005', 'CREW'),
(6, 'AGATA', 'LEWANDOWSKA', '12350', '+48700000006', 'CREW'),
(7, 'MICHA£', 'D¥BROWSKI', '12351', '+48700000007', 'CREW'),
(8, 'ALEKSANDRA', 'ZIELIÑSKA', '12352', '+48700000008', 'CAPTAIN'),
(9, 'KRZYSZTOF', 'SZYMAÑSKI', '12353', '+48700000009', 'CREW'),
(10, 'MARIA', 'MAJEWSKA', '12354', '+48700000010', 'CREW'),
(11, '£UKASZ', 'GAJEWSKI', '12355', '+48700000011', 'CAPTAIN'),
(12, 'JUSTYNA', 'PIETRZYK', '12356', '+48700000012', 'CREW'),
(13, 'BARTEK', 'CZERWIÑSKI', '12357', '+48700000013', 'CREW'),
(14, 'PAULINA', 'URBANIAK', '12358', '+48700000014', 'CAPTAIN'),
(15, 'WOJCIECH', 'MALINOWSKI', '12359', '+48700000015', 'CREW');


INSERT INTO Boat (ID_Boat, Name, Type, Max_capacity, Number_captains, Number_crew)
VALUES 
(1, 'TITANIC', 'CRUISE', 150, 1, 6),
(2, 'ODYSSEY', 'CARGO', 90, 2, 6),
(3, 'VOYAGER', 'FERRY', 60, 2, 5),
(4, 'EXPLORER', 'YACHT', 50, 1, 5),
(5, 'ADVENTURE', 'CRUISE', 150, 2, 4),
(6, 'NAUTILUS', 'SUBMARINE', 20, 1, 2),
(7, 'ENTERPRISE', 'CARGO', 80, 1, 3),
(8, 'ENDEAVOUR', 'CRUISE', 150, 2, 5),
(9, 'DISCOVERY', 'YACHT', 100, 1, 4),
(10, 'ATLANTIS', 'CARGO', 90, 1, 4);


INSERT INTO Tour (ID_Tour, How_many_stops)
VALUES 
(1, 3),
(2, 2),
(3, 4),
(4, 3),
(5, 2),
(6, 2),
(7, 2),
(8, 3),
(9, 3),
(10, 2);

INSERT INTO Batch (ID_Batch, Start_date, End_date, ID_Boat, ID_Tour)
VALUES 
(1, '2025-05-01', '2025-05-10', 1, 1),
(2, '2025-05-11', '2025-05-20', 2, 2),
(3, '2025-05-21', '2025-05-30', 3, 3),
(4, '2025-06-01', '2025-06-10', 4, 4),
(5, '2025-06-11', '2025-06-20', 5, 5),
(6, '2025-06-21', '2025-06-28', 6, 6),
(7, '2025-07-01', '2025-07-10', 7, 7),
(8, '2025-08-11', '2025-08-20', 8, 8),
(9, '2025-08-21', '2025-08-30', 1, 4),
(10, '2025-09-01', '2025-09-10', 10, 3);

INSERT INTO PeopleBatch (ID_Person, ID_Batch) 
VALUES 
(1, 1), 
(2, 1), (3, 1), (5, 1), (6, 1), (7, 1), (8, 1), 
(4, 2), (9, 2), 
(10, 2), (11, 2), (12, 2), (13, 2), (14, 2), (15, 2), 
(1, 3), (2, 3), 
(3, 3), (5, 3), (6, 3), (7, 3), 
(4, 4), 
(8, 4), (9, 4), (10, 4), (11, 4), (12, 4), 
(1, 5), (2, 5), 
(3, 5), (5, 5), (6, 5), (7, 5), 
(4, 6), 
(8, 6), (9, 6), 
(10, 7), 
(11, 7), (12, 7), (13, 7), 
(1, 8), (2, 8), 
(3, 8), (5, 8), (6, 8), (7, 8), 
(4, 9), 
(8, 9), (9, 9), (10, 9), (11, 9), 
(12, 10), 
(13, 10), (14, 10), (15, 10), (1, 10);


INSERT INTO Offer (ID_Offer, Cost_per_adult, Cost_per_child, ID_Batch) VALUES 
(1, 100, 50, 1),
(2, 120, 60, 2),
(3, 150, 75, 3),
(4, 80, 40, 4),
(5, 200, 100, 5),
(6, 110, 55, 6),
(7, 130, 65, 7),
(8, 90, 45, 8),
(9, 140, 70, 9),
(10, 170, 85, 10);

INSERT INTO Contract ( ID_Contract, How_many_adults, How_many_children, ID_Offer)
VALUES 
(1, 2, 1, 1),
(2, 4, 2, 2),
(3, 6, 3, 3),
(4, 1, 0, 4),
(5, 8, 3, 5),
(6, 3, 2, 6),
(7, 5, 1, 7),
(8, 5, 4, 8),
(9, 2, 0, 9),
(10, 3, 5, 10);

INSERT INTO Clients (ID_Client, First_Name, Last_Name, Number_ID)
VALUES 
(1, 'DAVID', 'MILLER', '654321'),
(2, 'SARA', 'CONNOR', '654322'),
(3, 'ELON', 'MUSK', '654323'),
(4, 'LARRY', 'PAGE', '654324'),
(5, 'SERGEY', 'BRIN', '654325'),
(6, 'MARK', 'ZUCKERBERG', '654326'),
(7, 'JEFF', 'BEZOS', '654327'),
(8, 'WARREN', 'BUFFET', '654328'),
(9, 'OPRAH', 'WINFREY', '654329'),
(10, 'BEYONCE', 'KNOWLES', '654330'),
(11, 'BILL', 'GATES', '654331'),
(12, 'STEVE', 'JOBS', '654332'),
(13, 'RICHARD', 'BRANSON', '654333'),
(14, 'SHERYL', 'SANDBERG', '654334'),
(15, 'ELIZABETH', 'HOLMES', '654335'),
(16, 'TIM', 'COOK', '654336'),
(17, 'SUNDAR', 'PICHAI', '654337'),
(18, 'SATYA', 'NADELLA', '654338'),
(19, 'JACK', 'DORSEY', '654339'),
(20, 'MARISSA', 'MAYER', '654340');

INSERT INTO ContractClients ( ID_Contract, ID_Client)
VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), 
(6, 6), (7, 7), (8, 8), (9, 9), (10, 10),
(1, 11), (2, 12), (3, 13), (4, 14), (5, 15),
(6, 20), (3, 19), (8, 18), (9, 17), (10, 16);


INSERT INTO Locations (ID_Location, Port, Country, City, Legal_adress)
VALUES 
(1, 'BARCELONA PORT', 'SPAIN', 'BARCELONA', 'EL BORN'),
(2, 'MARSEILLE PORT', 'FRANCE', 'MARSEILLE', 'OLD PORT'),
(3, 'GENOA PORT', 'ITALY', 'GENOA', 'PORTO ANTICO'),
(4, 'NAPLES PORT', 'ITALY', 'NAPLES', 'PIAZZA MUNICIPIO'),
(5, 'ATHENS PORT', 'GREECE', 'PIRAEUS', 'ATTICA'),
(6, 'ALEXANDRIA PORT', 'EGYPT', 'ALEXANDRIA', 'CORNICHE'),
(7, 'VALLETTA PORT', 'MALTA', 'VALLETTA', 'GRAND HARBOUR'),
(8, 'BEIRUT PORT', 'LEBANON', 'BEIRUT', 'DOWNTOWN'),
(9, 'TUNIS PORT', 'TUNISIA', 'TUNIS', 'LA GOULETTE'),
(10, 'IZMIR PORT', 'TURKEY', 'IZMIR', 'KONAK'),
(11, 'DUBROVNIK PORT', 'CROATIA', 'DUBROVNIK', 'GRUZ HARBOUR'),
(12, 'VENICE PORT', 'ITALY', 'VENICE', 'MARITTIMA'),
(13, 'CANNES PORT', 'FRANCE', 'CANNES', 'LA CROISETTE'),
(14, 'SANTORINI PORT', 'GREECE', 'SANTORINI', 'FIRA'),
(15, 'MONACO PORT', 'MONACO', 'MONACO', 'PORT HERCULE'),
(16, 'LIMASSOL PORT', 'CYPRUS', 'LIMASSOL', 'OLD HARBOUR'),
(17, 'DUBAI PORT', 'UAE', 'DUBAI', 'JEBEL ALI'),
(18, 'CASABLANCA PORT', 'MOROCCO', 'CASABLANCA', 'HASSAN II HARBOUR'),
(19, 'VALENCIA PORT', 'SPAIN', 'VALENCIA', 'MARINA REAL JUAN CARLOS I'),
(20, 'HAMMAMET PORT', 'TUNISIA', 'HAMMAMET', 'YASMINE HARBOUR');


INSERT INTO Tour_Stops (ID_Stop, DayOfStop, ID_Tour, ID_Location) 
VALUES 
(1, 1, 1, 1), (2, 2, 1, 2), (3, 3, 1, 3), 
(4, 1, 2, 4), (5, 2, 2, 5), 
(6, 1, 3, 6), (7, 2, 3, 7), (8, 3, 3, 8), (9, 4, 3, 9), 
(10, 1, 4, 10), (11, 2, 4, 1), (12, 3, 4, 2), 
(13, 1, 5, 3), (14, 2, 5, 4), 
(15, 1, 6, 5), (16, 2, 6, 6), 
(17, 1, 7, 7), (18, 2, 7, 8), 
(19, 1, 8, 9), (20, 2, 8, 10), (21, 3, 8, 11), 
(22, 1, 9, 12), (23, 2, 9, 13), (24, 3, 9, 14), 
(25, 1, 10, 15), (26, 2, 10, 16);


INSERT INTO Shipyards (ID_Shipyard, Name, Tax_number, ID_Location) VALUES 
(1, 'GLOBAL YARDS', '123456', 1),
(2, 'SEA SHIPYARDS', '223456', 2),
(3, 'HORIZON DOCKS', '323456', 3),
(4, 'PACIFIC YARDS', '423456', 4),
(5, 'ATLANTIC DOCKS', '523456', 5),
(6, 'ARCTIC YARDS', '623456', 6),
(7, 'INDIAN DOCKS', '723456', 7),
(8, 'OCEANIA YARDS', '823456', 8),
(9, 'CARIBBEAN DOCKS', '923456', 9),
(10, 'AFRICAN YARDS', '023456', 10);

INSERT INTO Boat_Repairs ( ID_Repair, Cost, When_repaired_started, When_repaired_end, ID_Boat, ID_Shipyard) VALUES 
(1, 5000, '2025-01-01', '2025-01-05', 1, 1),
(2, 3000, '2025-02-01', '2025-02-10', 2, 3),
(3, 4000, '2025-03-01', '2025-03-15', 6, 2),
(4, 2000, '2025-04-01', '2025-04-20', 7, 4),
(5, 3500, '2025-05-01', '2025-05-25', 5, 5),
(6, 2500, '2025-06-01', '2025-06-30', 7, 4),
(7, 4500, '2025-07-01', '2025-07-20', 7, 3),
(8, 1000, '2025-08-01', '2025-08-04', 4, 5),
(9, 4000, '2025-09-01', '2025-09-25', 9, 9),
(10, 3000, '2025-10-01', '2025-10-30', 7, 6);

INSERT INTO Gas_Stations (ID_Petrol_Station, Company, Tax_number, ID_Location) VALUES 
(1, 'SHELL', '112233', 1),
(2, 'BP', '223344', 2),
(3, 'ORLEN', '334455', 3),
(4, 'TOTAL', '445566', 4),
(5, 'CHEVRON', '556677', 5),
(6, 'REPSOL', '667788', 6),
(7, 'SINOPEC', '778899', 7),
(8, 'GAZPROM', '889900', 8),
(9, 'PETROBRAS', '990011', 9),
(10, 'SAUDI ARAMCO', '001122', 10);
