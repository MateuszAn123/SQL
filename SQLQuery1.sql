use master;

CREATE TABLE People (
    ID_Person int PRIMARY KEY,
    First_Name varchar(100) NOT NULL CHECK (First_Name = UPPER(First_Name)),
    Last_Name varchar(100) NOT NULL CHECK (Last_Name = UPPER(Last_Name)),
    Number_ID varchar(40) NOT NULL,
    Phone_Number varchar(12) CHECK (Phone_Number LIKE '+[0-9]%' AND LEN(Phone_Number) = 12),
    Role varchar(20) CHECK (Role = UPPER(Role))
);


CREATE TABLE Tour (
    ID_Tour int PRIMARY KEY,
    How_many_stops tinyint NOT NULL
);

CREATE TABLE Boat (
    ID_Boat int PRIMARY KEY,
    Name varchar(100) NOT NULL CHECK (Name = UPPER(Name)),
    Type varchar(50) NOT NULL CHECK (Type = UPPER(Type)),
    Max_capacity int NOT NULL,
    Number_captains int NOT NULL,
    Number_crew int NOT NULL
);


CREATE TABLE Batch (
    ID_Batch int PRIMARY KEY,
    Start_Date date NOT NULL,
    End_Date date NOT NULL,
	CONSTRAINT enddate CHECK (End_Date >= Start_Date),
	ID_Tour int,
	FOREIGN KEY (ID_Tour) REFERENCES Tour(ID_Tour),
    ID_Boat int,
	FOREIGN KEY (ID_Boat) REFERENCES Boat(ID_Boat)
);

CREATE TABLE PeopleBatch (
	ID_Batch int,
	ID_Person int,
	PRIMARY KEY (ID_Person, ID_Batch),
	FOREIGN KEY (ID_Batch) REFERENCES Batch(ID_Batch),
	FOREIGN KEY (ID_Person) REFERENCES People(ID_Person)

);



CREATE TABLE Offer (
    ID_Offer int PRIMARY KEY,
    Cost_per_adult tinyint NOT NULL,
    Cost_per_child tinyint NOT NULL,
	ID_Batch int FOREIGN KEY REFERENCES Batch(ID_Batch),
	
);

CREATE TABLE Contract (
    ID_Contract int PRIMARY KEY,
    How_many_adults int NOT NULL,
    How_many_children int NOT NULL,
    ID_Offer int NOT NULL,
    FOREIGN KEY (ID_Offer) REFERENCES Offer(ID_Offer)
);



CREATE TABLE Clients (
    ID_Client int PRIMARY KEY,
    First_Name varchar(100) NOT NULL CHECK (First_Name = UPPER(First_Name)),
    Last_Name varchar(100) NOT NULL CHECK (Last_Name = UPPER(Last_Name)),
    Number_ID varchar(50)
);

CREATE TABLE ContractClients (
	ID_Contract int NOT NULL,
	ID_Client int NOT NULL,
	FOREIGN KEY (ID_Contract) REFERENCES Contract(ID_Contract),
	FOREIGN KEY (ID_Client) REFERENCES Clients(ID_Client),
	CONSTRAINT contrclient PRIMARY KEY (ID_Contract, ID_Client)
);



CREATE TABLE Locations (
    ID_Location int PRIMARY KEY,
    Port varchar(100) NOT NULL CHECK (Port = UPPER(Port)), 
    Country varchar(100) NOT NULL CHECK (Country = UPPER(Country)),
    City varchar(100) NOT NULL CHECK (City = UPPER(City)),
    Legal_adress varchar(100) NOT NULL CHECK (Legal_adress = UPPER(Legal_adress))
);

CREATE TABLE Tour_Stops (
    ID_Stop int PRIMARY KEY,
    DayOfStop tinyint NOT NULL,
    ID_Tour int NOT NULL,
    ID_Location int NOT NULL,
    FOREIGN KEY (ID_Tour) REFERENCES Tour(ID_Tour),
    FOREIGN KEY (ID_Location) REFERENCES Locations(ID_Location)
);

CREATE TABLE Shipyards (
    ID_Shipyard int PRIMARY KEY,
    Name varchar(50) NOT NULL CHECK (Name = UPPER(Name)),
    Tax_number varchar(6) NOT NULL CHECK (Tax_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]' AND LEN(Tax_number) = 6),
    ID_Location int NOT NULL,
    FOREIGN KEY (ID_Location) REFERENCES Locations(ID_Location)
);

CREATE TABLE Boat_Repairs (
    ID_Repair int PRIMARY KEY,
    Cost int NOT NULL,
    When_repaired_started date NOT NULL,
    When_repaired_end date NOT NULL,
	CONSTRAINT repairend CHECK (When_repaired_end >= When_repaired_started),
    ID_Boat int FOREIGN KEY REFERENCES Boat(ID_Boat),
    ID_Shipyard int NOT NULL,
	FOREIGN KEY (ID_Shipyard) REFERENCES Shipyards(ID_Shipyard),
);


CREATE TABLE Gas_Stations (
    ID_Petrol_Station int PRIMARY KEY,
    Company varchar(50) CHECK (Company = UPPER(Company)),
    Tax_number varchar(6) NOT NULL CHECK (Tax_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]' AND LEN(Tax_number) = 6),
    ID_Location int NOT NULL,
    FOREIGN KEY (ID_Location) REFERENCES Locations(ID_Location)
);


