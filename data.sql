CREATE TABLE AIRPORTS (
    AIRPORT_ID INT PRIMARY KEY IDENTITY (1, 1),
    AIRPORT_LOCATION VARCHAR (80) NOT NULL,
    AIRPORT_NAME VARCHAR (80) NOT NULL
);


CREATE TABLE AIRCRAFTS (
    AIRCRAFT_ID INT PRIMARY KEY IDENTITY (1, 1),
    AIRCRAFT_NAME VARCHAR (80) NOT NULL,
    AIRCRAFT_CAPACITY INT NOT NULL
);


CREATE TABLE AIRLINES (
    AIRLINE_ID INT PRIMARY KEY IDENTITY (1, 1),
    AIRLINE_NAME VARCHAR (80) NOT NULL,
    AIRLINE_COUNTRY VARCHAR (80) NOT NULL
);


CREATE TABLE FLIGHTS (
    FLIGHT_ID INT PRIMARY KEY IDENTITY (1, 1),
    DEPARTURE_DATE_TIME DATETIME NOT NULL,
    ARRIVAL_DATE_TIME DATETIME NOT NULL,
	AIRLINE_ID INT NOT NULL,
	AIRCRAFT_ID INT NOT NULL,
	AIRPORT_ID INT NOT NULL,

    FOREIGN KEY (AIRLINE_ID) REFERENCES AIRLINES (AIRLINE_ID),
    FOREIGN KEY (AIRCRAFT_ID) REFERENCES AIRCRAFTS (AIRCRAFT_ID),
    FOREIGN KEY (AIRPORT_ID) REFERENCES AIRPORTS (AIRPORT_ID)
);

CREATE TABLE CLIENTS (
    CLIENT_ID INT PRIMARY KEY IDENTITY (1, 1),
    FIRST_NAME VARCHAR (80) NOT NULL, 
    LAST_NAME VARCHAR (80) NOT NULL, 
    PHONE_NUMBER VARCHAR (80) NOT NULL, 
    EMAIL_ADDRESS VARCHAR (80) NOT NULL, 
    COUNTRY VARCHAR (80) NOT NULL, 
    CITY VARCHAR (80) NOT NULL
);

CREATE TABLE TRAVEL_CLASSES (
    TRAVEL_CLASS_ID INT PRIMARY KEY IDENTITY (1, 1),
    TRAVEL_CLASS_DESCRIPTION VARCHAR (80) NOT NULL
);

CREATE TABLE RESERVATIONS (
    RESERVATION_ID INT PRIMARY KEY IDENTITY (1, 1),
    RESERVATION_DATE DATETIME NOT NULL,
    SEAT_NUMBER VARCHAR (5) NOT NULL,
	FLIGHT_ID INT NOT NULL,
	CLIENT_ID INT NOT NULL,
	TRAVEL_CLASS_ID INT NOT NULL,

    FOREIGN KEY (FLIGHT_ID) REFERENCES FLIGHTS (FLIGHT_ID),
    FOREIGN KEY (CLIENT_ID) REFERENCES CLIENTS (CLIENT_ID),
    FOREIGN KEY (TRAVEL_CLASS_ID) REFERENCES TRAVEL_CLASSES (TRAVEL_CLASS_ID)
);

CREATE TABLE PAYMENTS (
    PAYMENT_ID INT PRIMARY KEY IDENTITY (1, 1),
    PAYMENT_DATE DATETIME NOT NULL,
    PAYMENT_AMOUNT INT NOT NULL,
	RESERVATION_ID INT NOT NULL,

    FOREIGN KEY (RESERVATION_ID) REFERENCES RESERVATIONS (RESERVATION_ID)
);

CREATE TABLE FLIGHT_COSTS (
    FLIGHT_ID INT NOT NULL,
    VALID_FROM DATETIME NOT NULL,
    TRAVEL_CLASS_ID INT NOT NULL,
    VALID_TO DATETIME,
    COST INT NOT NULL,

    CONSTRAINT FLIGHT_COST_ID PRIMARY KEY (FLIGHT_ID, VALID_FROM, TRAVEL_CLASS_ID)
	FOREIGN KEY (FLIGHT_ID) REFERENCES FLIGHTS (FLIGHT_ID)
	FOREIGN KEY (TRAVEL_CLASS_ID) REFERENCES TRAVEL_CLASSES (TRAVEL_CLASS_ID)
);
