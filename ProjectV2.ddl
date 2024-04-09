<<<<<<< Updated upstream
DROP TABLE bikemaintenance;
DROP TABLE card;
DROP TABLE trips;
DROP TABLE stations;
DROP TABLE maintenance;
DROP TABLE fees;
DROP TABLE bikes;
DROP TABLE customers;

DROP SEQUENCE bikemaintenanceID;
DROP SEQUENCE bikeID;
DROP SEQUENCE cardID;
DROP SEQUENCE customerID;
DROP SEQUENCE FeeID;
DROP SEQUENCE maintenanceID;
DROP SEQUENCE stationID;
DROP SEQUENCE tripID;

CREATE SEQUENCE bikemaintenanceID START WITH 1 INCREMENT BY 1;

CREATE TABLE bikemaintenance (
    bikemaintenaince_id        NUMBER DEFAULT bikemaintenanceID.NEXTVAL NOT NULL,
    bikes_bike_id              NUMBER NOT NULL,
    maintenance_maintenance_id NUMBER NOT NULL
);

ALTER TABLE bikemaintenance ADD CONSTRAINT bikemaintenance_pk PRIMARY KEY ( bikemaintenaince_id );

CREATE SEQUENCE bikeID START WITH 1 INCREMENT BY 1;

CREATE TABLE bikes (
    bike_id       NUMBER DEFAULT bikeID.NEXTVAL NOT NULL ,
    model         VARCHAR2(50) 
--  WARNING: VARCHAR2(50) size not specified 
    ,
    status        VARCHAR2(50) 
--  WARNING: VARCHAR2(50) size not specified 
    ,
    location_id   VARCHAR2(50) 
--  WARNING: VARCHAR2(50) size not specified 
    ,
    purchase_date DATE
);

ALTER TABLE bikes ADD CONSTRAINT bikes_pk PRIMARY KEY ( bike_id );

CREATE SEQUENCE cardID START WITH 1 INCREMENT BY 1;

CREATE TABLE card (
    card_id     NUMBER DEFAULT cardID.NEXTVAL NOT NULL,
    card_number NUMBER,
    card_expiry DATE,
    card_ssn    NUMBER,
    customer_id NUMBER NOT NULL
);

ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_id );

CREATE SEQUENCE customerID START WITH 1 INCREMENT BY 1;

CREATE TABLE customers (
    customer_id NUMBER DEFAULT customerID.NEXTVAL NOT NULL,
    first_name  VARCHAR2(50) NOT NULL
--  WARNING: VARCHAR2(50) size not specified 
    ,
    last_name   VARCHAR2(50) NOT NULL
--  WARNING: VARCHAR2(50) size not specified 
    ,
    email       VARCHAR2(50) NOT NULL
--  WARNING: VARCHAR2(50) size not specified 
    ,
    phone       NUMBER NOT NULL
);

ALTER TABLE customers ADD CONSTRAINT customers_pk PRIMARY KEY ( customer_id );

CREATE SEQUENCE FeeID START WITH 1 INCREMENT BY 1;

CREATE TABLE fees (
    fee_id                 NUMBER DEFAULT FeeID.NEXTVAL NOT NULL,
    fee_per_hour           NUMBER,
    date_of_implementation DATE
);


ALTER TABLE fees ADD CONSTRAINT fees_pk PRIMARY KEY ( fee_id );

CREATE SEQUENCE maintenanceID START WITH 1 INCREMENT BY 1;

CREATE TABLE maintenance (
    maintenance_id       NUMBER DEFAULT maintenanceID.NEXTVAL NOT NULL,
    start_of_maintenance DATE,
    end_of_maintenance   DATE,
    description          VARCHAR2(50) 
--  WARNING: VARCHAR2(50) size not specified 
    ,
    maintanance_operator VARCHAR2(50) 
--  WARNING: VARCHAR2(50) size not specified 

);

ALTER TABLE maintenance ADD CONSTRAINT maintenance_pk PRIMARY KEY ( maintenance_id );

CREATE SEQUENCE stationID START WITH 1 INCREMENT BY 1;

CREATE TABLE stations (
    station_id NUMBER DEFAULT stationID.NEXTVAL NOT NULL,
    name       VARCHAR2(50) 
--  WARNING: VARCHAR2(50) size not specified 
    ,
    location   VARCHAR2(50) 
--  WARNING: VARCHAR2(50) size not specified 
    ,
    capacity   NUMBER
);

ALTER TABLE stations ADD CONSTRAINT stations_pk PRIMARY KEY ( station_id );

CREATE SEQUENCE tripID START WITH 1 INCREMENT BY 1;

CREATE TABLE trips (
    trip_id               NUMBER DEFAULT tripID.NEXTVAL NOT NULL,
    start_time            DATE NOT NULL,
    end_time              DATE NOT NULL,
    bikes_bike_id         NUMBER NOT NULL,
    customers_customer_id NUMBER NOT NULL,
    start_station_id      NUMBER NOT NULL,
    end_station_id        NUMBER NOT NULL,
    trip_paid             VARCHAR2(50) 
--  WARNING: VARCHAR2(50) size not specified 

);


ALTER TABLE trips ADD CONSTRAINT trips_pk PRIMARY KEY ( trip_id );

ALTER TABLE bikemaintenance
    ADD CONSTRAINT bikemaintenance_bikes_fk FOREIGN KEY ( bikes_bike_id )
        REFERENCES bikes ( bike_id );

ALTER TABLE bikemaintenance
    ADD CONSTRAINT bikemaintenance_maintenance_fk FOREIGN KEY ( maintenance_maintenance_id )
        REFERENCES maintenance ( maintenance_id );

ALTER TABLE card
    ADD CONSTRAINT card_customers_fk FOREIGN KEY ( customer_id )
        REFERENCES customers ( customer_id );

ALTER TABLE trips
    ADD CONSTRAINT trips_bikes_fk FOREIGN KEY ( bikes_bike_id )
        REFERENCES bikes ( bike_id );

ALTER TABLE trips
    ADD CONSTRAINT trips_customers_fk FOREIGN KEY ( customers_customer_id )
        REFERENCES customers ( customer_id );

ALTER TABLE trips
    ADD CONSTRAINT trips_stations_fk FOREIGN KEY ( end_station_id )
        REFERENCES stations ( station_id );

ALTER TABLE trips
    ADD CONSTRAINT trips_stations_fkv1 FOREIGN KEY ( start_station_id )
        REFERENCES stations ( station_id );

--Insert customer data
INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('John', 'Smith', 'john@example.com', '1234567890');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Alice', 'Johnson', 'alice@example.com', '2345678901');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Michael', 'Williams', 'michael@example.com', '3456789012');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Emily', 'Brown', 'emily@example.com', '4567890123');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Daniel', 'Jones', 'daniel@example.com', '5678901234');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Sarah', 'Davis', 'sarah@example.com', '6789012345');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Jessica', 'Miller', 'jessica@example.com', '7890123456');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('David', 'Wilson', 'david@example.com', '8901234567');

--insert bike data
INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Mountain', 'Available', 'Station A', TO_DATE('2022-01-15', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Road', 'Available', 'Station B', TO_DATE('2022-02-20', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Hybrid', 'In Use', 'Station C', TO_DATE('2022-03-10', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Electric', 'Under Maintenance', 'Station D', TO_DATE('2022-04-05', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Road', 'Available', 'Station E', TO_DATE('2022-05-25', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Cruiser', 'Available', 'Station F', TO_DATE('2022-06-14', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('BMX', 'Available', 'Station G', TO_DATE('2022-07-30', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('City', 'Available', 'Station H', TO_DATE('2022-08-08', 'YYYY-MM-DD'));

--insert card data
INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (1234567890123456, TO_DATE('2025-12-31', 'YYYY-MM-DD'), 1234, 1);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (9876543210987654, TO_DATE('2024-10-31', 'YYYY-MM-DD'), 5678, 2);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (1111222233334444, TO_DATE('2026-06-30', 'YYYY-MM-DD'), 9876, 3);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (4444333322221111, TO_DATE('2025-09-15', 'YYYY-MM-DD'), 5432, 4);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (5555666677778888, TO_DATE('2023-04-28', 'YYYY-MM-DD'), 8765, 5);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (8888777766665555, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 2109, 6);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (9999888877776666, TO_DATE('2026-03-22', 'YYYY-MM-DD'), 3145, 7);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (7777666655554444, TO_DATE('2025-08-09', 'YYYY-MM-DD'), 8234, 8);

--insert fee data
INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (10.50, TO_DATE('2022-01-01', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (8.75, TO_DATE('2022-02-15', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (15.00, TO_DATE('2022-03-20', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (5.25, TO_DATE('2022-04-10', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (12.00, TO_DATE('2022-05-05', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (9.99, TO_DATE('2022-06-08', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (20.50, TO_DATE('2022-07-15', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (7.75, TO_DATE('2022-08-20', 'YYYY-MM-DD'));

--insert maintenance data

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-03', 'YYYY-MM-DD'), 'Routine check', 'A');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-02-16', 'YYYY-MM-DD'), 'Battery replacement', 'B');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-03-20', 'YYYY-MM-DD'), TO_DATE('2022-03-21', 'YYYY-MM-DD'), 'Brake adjustment', 'C');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2022-04-12', 'YYYY-MM-DD'), 'Tire replacement', 'D');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-05-05', 'YYYY-MM-DD'), TO_DATE('2022-05-07', 'YYYY-MM-DD'), 'Chain lubrication', 'E');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-06-08', 'YYYY-MM-DD'), TO_DATE('2022-06-09', 'YYYY-MM-DD'), 'Frame inspection', 'F');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-07-15', 'YYYY-MM-DD'), TO_DATE('2022-07-17', 'YYYY-MM-DD'), 'Light replacement', 'G');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2022-08-21', 'YYYY-MM-DD'), 'Handlebar adjustment', 'H');

--Insert station data
INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station A', 'Location A', 20);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station B', 'Location B', 15);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station C', 'Location C', 25);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station D', 'Location D', 30);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station E', 'Location E', 18);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station F', 'Location F', 22);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station G', 'Location G', 27);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station H', 'Location H', 16);

--insert trip info
INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 2, 1, 2, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-02 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 3, 2, 3, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-03 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-03 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3, 6, 4, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-04 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-04 17:15:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1, 4, 5, 'N');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-05 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-05 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 5, 7, 6, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-06 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-06 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 6, 1, 7, 'N');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-07 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-07 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 7, 1, 8, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-08 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-08 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 3, 8, 1, 'Y');


-- Drop existing users if they exist
DROP USER bike_user CASCADE;
DROP USER maintenance_user CASCADE;

-- Create users
CREATE USER bike_user IDENTIFIED BY BostonSpring2024#;
CREATE USER maintenance_user IDENTIFIED BY NEUSpring2024;

-- Grant necessary privileges to users
GRANT SELECT, INSERT, UPDATE, DELETE ON bikemaintenance TO bike_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON maintenance TO maintenance_user;

-- Grant SELECT privilege on each object individually
GRANT SELECT ON customers TO bike_user, maintenance_user;
GRANT SELECT ON bikes TO bike_user, maintenance_user;
GRANT SELECT ON card TO bike_user, maintenance_user;
GRANT SELECT ON fees TO bike_user, maintenance_user;
GRANT SELECT ON stations TO bike_user, maintenance_user;
GRANT SELECT ON trips TO bike_user, maintenance_user;



=======
SET AUTOCOMMIT ON;

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE bikemaintenanceID START WITH 1 INCREMENT BY 1';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table bikemaintenance already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE maintenance_log (
        log_id                      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        bikemaintenaince_id         NUMBER NOT NULL,
        bikes_bike_id               NUMBER NOT NULL,
        maintenance_maintenance_id  NUMBER NOT NULL,
        log_time                    DATE NOT NULL
    )';
    DBMS_OUTPUT.PUT_LINE('Table maintenance_log created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Table maintenance_log already exists.');
        ELSE
            RAISE; -- Re-raise the exception if it is not the expected ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE bikemaintenance (
        log_id                      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        bikemaintenaince_id         NUMBER NOT NULL,
        bikes_bike_id               NUMBER NOT NULL,
        maintenance_maintenance_id  NUMBER NOT NULL,
        log_time                    DATE NOT NULL
    )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table bikemaintenance already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/




BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE bikeID START WITH 1 INCREMENT BY 1';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table bikeID already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE bikes (
    bike_id       NUMBER DEFAULT bikeID.NEXTVAL NOT NULL ,
    model         VARCHAR2(50) 
    ,
    status        VARCHAR2(50) 
    ,
    location_id   VARCHAR2(50) 
    ,
    purchase_date DATE
)';
EXECUTE IMMEDIATE 'ALTER TABLE bikes ADD CONSTRAINT bikes_pk PRIMARY KEY ( bike_id )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table bikes already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE Bike_count_per_station (
        station_id    NUMBER PRIMARY KEY,
        trips_started INT DEFAULT 0,
        trips_ended   INT DEFAULT 0
    )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table Bike_count_per_station already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE cardID START WITH 1 INCREMENT BY 1';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table Bike_count_per_station already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE card (
    card_id     NUMBER DEFAULT cardID.NEXTVAL NOT NULL,
    card_number NUMBER,
    card_expiry DATE,
    card_ssn    NUMBER,
    customer_id NUMBER NOT NULL
)';
EXECUTE IMMEDIATE 'ALTER TABLE card ADD CONSTRAINT card_pk PRIMARY KEY ( card_id )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table card already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE card_audit_log (
        log_id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        card_id         NUMBER NOT NULL,
        old_card_number VARCHAR2(16),
        new_card_number VARCHAR2(16),
        change_date     DATE NOT NULL,
        action_type     VARCHAR2(10) NOT NULL
    )';
    DBMS_OUTPUT.PUT_LINE('card_audit_log table created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('card_audit_log table already exists. Skipping creation.');
        ELSE
            RAISE; -- Re-raises the exception if it's not the expected ORA-00955
        END IF;
END;
/


BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE customer_activity_log (
        log_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        trip_id       NUMBER NOT NULL,
        customer_id   NUMBER NOT NULL,
        start_time    DATE NOT NULL,
        end_time      DATE NOT NULL
    )';
    DBMS_OUTPUT.PUT_LINE('Table customer_activity_log created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Table customer_activity_log already exists. Skipping creation.');
        ELSE
            RAISE; -- Re-raise the exception if it is not the expected ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE customerID START WITH 1 INCREMENT BY 1';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table customerID already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE customers (
        customer_id NUMBER DEFAULT customerID.NEXTVAL NOT NULL,
        first_name  VARCHAR2(50) NOT NULL,
        last_name   VARCHAR2(50) NOT NULL,
        email       VARCHAR2(50) NOT NULL,
        phone       NUMBER NOT NULL,
        status      VARCHAR2(50) DEFAULT ''Active'' 
    )';
    
    EXECUTE IMMEDIATE 'ALTER TABLE customers ADD CONSTRAINT customers_pk PRIMARY KEY ( customer_id )';
    
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table customers already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/


BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE fee_changes_log (
        log_id            NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
        fee_id            NUMBER NOT NULL,
        old_fee_per_hour  NUMBER,
        new_fee_per_hour  NUMBER,
        change_date       DATE NOT NULL
    )';
    DBMS_OUTPUT.PUT_LINE('Table fee_changes_log created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN
            DBMS_OUTPUT.PUT_LINE('Table fee_changes_log already exists.');
        ELSE
            RAISE; -- Re-raise the exception if it is not the expected ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE FeeID START WITH 1 INCREMENT BY 1';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Sequence FeeID already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE fees (
    fee_id                 NUMBER DEFAULT FeeID.NEXTVAL NOT NULL,
    fee_per_hour           NUMBER,
    date_of_implementation DATE
)';
EXECUTE IMMEDIATE 'ALTER TABLE fees ADD CONSTRAINT fees_pk PRIMARY KEY ( fee_id )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table fees already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE maintenanceID START WITH 1 INCREMENT BY 1';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table maintenanceID already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE maintenance (
    maintenance_id       NUMBER DEFAULT maintenanceID.NEXTVAL NOT NULL,
    start_of_maintenance DATE,
    end_of_maintenance   DATE,
    description          VARCHAR2(50),
    maintanance_operator VARCHAR2(50) 
)';
EXECUTE IMMEDIATE 'ALTER TABLE maintenance ADD CONSTRAINT maintenance_pk PRIMARY KEY ( maintenance_id )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table maintenance already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE stationID START WITH 1 INCREMENT BY 1';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table stationI already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE stations (
    station_id NUMBER DEFAULT stationID.NEXTVAL NOT NULL,
    name       VARCHAR2(50) 
    ,
    location   VARCHAR2(50) 
    ,
    capacity   NUMBER
)';
EXECUTE IMMEDIATE'ALTER TABLE stations ADD CONSTRAINT stations_pk PRIMARY KEY ( station_id )';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table stations already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/


BEGIN
    EXECUTE IMMEDIATE 'CREATE SEQUENCE tripID START WITH 1 INCREMENT BY 1';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table tripID already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    -- Create the new "TRIPS" table
    EXECUTE IMMEDIATE 'CREATE TABLE trips (
        trip_id               NUMBER DEFAULT tripID.NEXTVAL NOT NULL,
        start_time            DATE NOT NULL,
        end_time              DATE NOT NULL,
        bikes_bike_id         NUMBER NOT NULL,
        customers_customer_id NUMBER NOT NULL,
        start_station_id      NUMBER NOT NULL,
        end_station_id        NUMBER NOT NULL,
        trip_paid             VARCHAR2(50) 
    )';

    -- Add constraints and keys to the "TRIPS" table
    EXECUTE IMMEDIATE 'ALTER TABLE trips ADD CONSTRAINT trips_pk PRIMARY KEY ( trip_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE trips ADD CONSTRAINT trips_bikes_fk FOREIGN KEY ( bikes_bike_id ) REFERENCES bikes ( bike_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE trips ADD CONSTRAINT trips_customers_fk FOREIGN KEY ( customers_customer_id ) REFERENCES customers ( customer_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE trips ADD CONSTRAINT trips_stations_fk FOREIGN KEY ( end_station_id ) REFERENCES stations ( station_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE trips ADD CONSTRAINT trips_stations_fkv1 FOREIGN KEY ( start_station_id ) REFERENCES stations ( station_id )';

    DBMS_OUTPUT.PUT_LINE('Table "TRIPS" created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


BEGIN
EXECUTE IMMEDIATE 'ALTER TABLE bikemaintenance
    ADD CONSTRAINT bikemaintenance_bikes_fk FOREIGN KEY ( bikes_bike_id )
        REFERENCES bikes ( bike_id )';
EXECUTE IMMEDIATE 'ALTER TABLE bikemaintenance
    ADD CONSTRAINT bikemaintenance_maintenance_fk FOREIGN KEY ( maintenance_maintenance_id )
        REFERENCES maintenance ( maintenance_id )';
EXECUTE IMMEDIATE 'ALTER TABLE card
    ADD CONSTRAINT card_customers_fk FOREIGN KEY ( customer_id )
        REFERENCES customers ( customer_id )';
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

--Insert customer data
INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('John', 'Smith', 'john@example.com', '1234567890');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Alice', 'Johnson', 'alice@example.com', '2345678901');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Michael', 'Williams', 'michael@example.com', '3456789012');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Emily', 'Brown', 'emily@example.com', '4567890123');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Daniel', 'Jones', 'daniel@example.com', '5678901234');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Sarah', 'Davis', 'sarah@example.com', '6789012345');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('Jessica', 'Miller', 'jessica@example.com', '7890123456');

INSERT INTO CUSTOMERS (FIRST_NAME, LAST_NAME, EMAIL, PHONE)
VALUES ('David', 'Wilson', 'david@example.com', '8901234567');

--insert bike data
INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Mountain', 'Available', 'Station A', TO_DATE('2022-01-15', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Road', 'Available', 'Station B', TO_DATE('2022-02-20', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Hybrid', 'In Use', 'Station C', TO_DATE('2022-03-10', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Electric', 'Under Maintenance', 'Station D', TO_DATE('2022-04-05', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Road', 'Available', 'Station E', TO_DATE('2022-05-25', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('Cruiser', 'Available', 'Station F', TO_DATE('2022-06-14', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('BMX', 'Available', 'Station G', TO_DATE('2022-07-30', 'YYYY-MM-DD'));

INSERT INTO BIKES (MODEL, STATUS, LOCATION_ID, PURCHASE_DATE)
VALUES ('City', 'Available', 'Station H', TO_DATE('2022-08-08', 'YYYY-MM-DD'));

--insert card data
INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (1234567890123456, TO_DATE('2025-12-31', 'YYYY-MM-DD'), 1234, 1);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (9876543210987654, TO_DATE('2024-10-31', 'YYYY-MM-DD'), 5678, 2);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (1111222233334444, TO_DATE('2026-06-30', 'YYYY-MM-DD'), 9876, 3);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (4444333322221111, TO_DATE('2025-09-15', 'YYYY-MM-DD'), 5432, 4);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (5555666677778888, TO_DATE('2023-04-28', 'YYYY-MM-DD'), 8765, 5);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (8888777766665555, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 2109, 6);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (9999888877776666, TO_DATE('2026-03-22', 'YYYY-MM-DD'), 3145, 7);

INSERT INTO CARD (CARD_NUMBER, CARD_EXPIRY, CARD_SSN, CUSTOMER_ID)
VALUES (7777666655554444, TO_DATE('2025-08-09', 'YYYY-MM-DD'), 8234, 8);

--insert fee data
INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (10.50, TO_DATE('2022-01-01', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (8.75, TO_DATE('2022-02-15', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (15.00, TO_DATE('2022-03-20', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (5.25, TO_DATE('2022-04-10', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (12.00, TO_DATE('2022-05-05', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (9.99, TO_DATE('2022-06-08', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (20.50, TO_DATE('2022-07-15', 'YYYY-MM-DD'));

INSERT INTO FEES (FEE_PER_HOUR, DATE_OF_IMPLEMENTATION)
VALUES (7.75, TO_DATE('2022-08-20', 'YYYY-MM-DD'));

--insert bikemaintenance data

INSERT INTO bikemaintenance (bikes_bike_id, maintenance_maintenance_ID)
VALUES (1,1);

INSERT INTO bikemaintenance (bikes_bike_id, maintenance_maintenance_ID)
VALUES (2,2);

INSERT INTO bikemaintenance (bikes_bike_id, maintenance_maintenance_ID)
VALUES (3,3);

INSERT INTO bikemaintenance (bikes_bike_id, maintenance_maintenance_ID)
VALUES (4,4);

INSERT INTO bikemaintenance (bikes_bike_id, maintenance_maintenance_ID)
VALUES (5,5);

INSERT INTO bikemaintenance (bikes_bike_id, maintenance_maintenance_ID)
VALUES (6,6);

INSERT INTO bikemaintenance (bikes_bike_id, maintenance_maintenance_ID)
VALUES (7,7);

INSERT INTO bikemaintenance (bikes_bike_id, maintenance_maintenance_ID)
VALUES (8,8);

--insert maintenance data

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-03', 'YYYY-MM-DD'), 'Routine check', 'A');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-02-16', 'YYYY-MM-DD'), 'Battery replacement', 'B');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-03-20', 'YYYY-MM-DD'), TO_DATE('2022-03-21', 'YYYY-MM-DD'), 'Brake adjustment', 'C');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2022-04-12', 'YYYY-MM-DD'), 'Tire replacement', 'D');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-05-05', 'YYYY-MM-DD'), TO_DATE('2022-05-07', 'YYYY-MM-DD'), 'Chain lubrication', 'E');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-06-08', 'YYYY-MM-DD'), TO_DATE('2022-06-09', 'YYYY-MM-DD'), 'Frame inspection', 'F');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-07-15', 'YYYY-MM-DD'), TO_DATE('2022-07-17', 'YYYY-MM-DD'), 'Light replacement', 'G');

INSERT INTO MAINTENANCE (START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2022-08-21', 'YYYY-MM-DD'), 'Handlebar adjustment', 'H');

--Insert station data
INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station A', 'Location A', 20);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station B', 'Location B', 15);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station C', 'Location C', 25);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station D', 'Location D', 30);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station E', 'Location E', 18);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station F', 'Location F', 22);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station G', 'Location G', 27);

INSERT INTO STATIONS (NAME, LOCATION, CAPACITY)
VALUES ('Station H', 'Location H', 16);

--insert trip info
INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 2, 1, 2, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-02 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-02 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 3, 2, 3, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-03 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-03 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3, 6, 4, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-04 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-04 17:15:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 1, 4, 5, 'N');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-05 08:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-05 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 5, 7, 6, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-06 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-06 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 6, 1, 7, 'N');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-07 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-07 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 7, 1, 8, 'Y');

INSERT INTO TRIPS (START_TIME, END_TIME, BIKES_BIKE_ID, CUSTOMERS_CUSTOMER_ID, START_STATION_ID, END_STATION_ID, TRIP_PAID)
VALUES (TO_DATE('2022-01-08 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2022-01-08 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 3, 8, 1, 'Y');


-- Create users
BEGIN
    EXECUTE IMMEDIATE 'CREATE USER bike_user IDENTIFIED BY BostonSpring2024#';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -1920 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table bikemaintenance already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE USER maintenance_user IDENTIFIED BY NEUSpring2024';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -1920 THEN  -- ORA-00955: table already exists
            DBMS_OUTPUT.PUT_LINE('Table bikemaintenance already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

-- Grant necessary privileges to users
GRANT SELECT, INSERT, UPDATE, DELETE ON bikemaintenance TO bike_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON maintenance TO maintenance_user;

-- Grant SELECT privilege on each object individually
GRANT SELECT ON customers TO bike_user, maintenance_user;
GRANT SELECT ON bikes TO bike_user, maintenance_user;
GRANT SELECT ON card TO bike_user, maintenance_user;
GRANT SELECT ON fees TO bike_user, maintenance_user;
GRANT SELECT ON stations TO bike_user, maintenance_user;
GRANT SELECT ON trips TO bike_user, maintenance_user;

--VEIWS
BEGIN
    EXECUTE IMMEDIATE 'CREATE VIEW Bike_count_per_station AS
SELECT s.station_id,
       s.name AS station_name,
       COUNT(b.bike_id) AS bike_count
FROM stations s
LEFT JOIN bikes b ON s.name = b.location_id
GROUP BY s.station_id, s.name';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Total_trips_per_month already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE VIEW Total_trips_per_month AS
    SELECT TO_CHAR(start_time, ''YYYY-MM'') AS trip_month,
    COUNT(*) AS total_trips
    FROM trips
    GROUP BY TO_CHAR(start_time, ''YYYY-MM'')';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Total_trips_per_month already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE VIEW Maintenance_per_bike AS
    SELECT
        b.bike_id,
        b.model,
        m.start_of_maintenance,
        m.end_of_maintenance,
        m.description,
        m.maintanance_operator
    FROM
        bikes b
    LEFT JOIN
        bikemaintenance bm ON b.bike_id = bm.bikes_bike_id
    LEFT JOIN
        maintenance m ON bm.maintenance_maintenance_id = m.maintenance_id';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Maintenance_per_bike already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE '
            CREATE VIEW Trips_started_at_each_station AS
            SELECT start_station_id AS station_id,
                COUNT(trip_id) AS trips_started
            FROM trips
            GROUP BY start_station_id
            Order by start_station_id';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Maintenance_per_bike already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE '
            CREATE VIEW Trips_ended_at_each_station AS
            SELECT end_station_id AS station_id,
                COUNT(trip_id) AS trips_ended
            FROM trips
            GROUP BY end_station_id
            Order by end_station_id';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Maintenance_per_bike already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE '
                CREATE VIEW Customer_rental_history AS
                SELECT
                    c.customer_id,
                    c.first_name || '' '' || c.last_name AS customer_name,
                    t.trip_id,
                    t.start_time,
                    t.end_time,
                    t.start_station_id AS start_station,
                    t.end_station_id AS end_station,
                    t.trip_paid
                FROM customers c
                JOIN trips t ON c.customer_id = t.customers_customer_id';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Maintenance_per_bike already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
            EXECUTE IMMEDIATE '
                CREATE VIEW Customer_membership_status AS
                SELECT
                    c.customer_id,
                    c.first_name || '' '' || c.last_name AS customer_name,
                    CASE
                        WHEN cr.card_id IS NOT NULL THEN ''Active''
                        ELSE ''Inactive''
                    END AS membership_status
                FROM customers c
                LEFT JOIN card cr ON c.customer_id = cr.customer_id';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Maintenance_per_bike already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
                        EXECUTE IMMEDIATE '
                CREATE VIEW Unreturned_bikes AS
                SELECT
                    t.trip_id,
                    t.start_time AS rental_start_time,
                    t.bikes_bike_id AS bike_id,
                    c.customer_id AS customer_id,
                    c.first_name || '' '' || c.last_name AS customer_name,
                    t.start_station_id AS rented_from_station_id,
                    s1.name AS rented_from_station_name
                FROM
                    trips t
                INNER JOIN
                    customers c ON t.customers_customer_id = c.customer_id
                INNER JOIN
                    stations s1 ON t.start_station_id = s1.station_id
                LEFT JOIN
                    stations s2 ON t.end_station_id = s2.station_id
                WHERE
                    t.end_time IS NULL';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Maintenance_per_bike already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'CREATE VIEW Average_trip_duration_per_bike AS
    SELECT
        t.bikes_bike_id AS bike_id,
        TRUNC(AVG(diff_minutes) / 60) || '' hours '' ||
        MOD(AVG(diff_minutes), 60) || '' minutes'' AS average_duration
    FROM
        (SELECT
            bikes_bike_id,
            (MAX(end_time) - MIN(start_time)) * 24 * 60 AS diff_minutes -- Total minutes difference
        FROM
            trips
        GROUP BY
            bikes_bike_id) t
    GROUP BY
        t.bikes_bike_id';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -955 THEN  -- ORA-00955: view already exists
            DBMS_OUTPUT.PUT_LINE('View Average_trip_duration_per_bike already exists. Skipping creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

-- Create Triggers 

CREATE OR REPLACE TRIGGER trg_prevent_duplicate_customers
BEFORE INSERT ON customers
FOR EACH ROW
DECLARE
    v_exists NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_exists
    FROM customers
    WHERE email = :new.email;

    IF v_exists > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'A customer with this email already exists.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_autocorrect_customers
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    :new.first_name := TRIM(:new.first_name);
    :new.last_name := TRIM(:new.last_name);
    :new.email := LOWER(TRIM(:new.email)); -- Store emails in lowercase and trimmed

    -- Set default status if not provided
    IF :new.status IS NULL THEN
        :new.status := 'Active'; -- Default status
    END IF;
END;
/


CREATE OR REPLACE TRIGGER update_bike_count
AFTER INSERT OR DELETE ON bikes
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        -- Increase capacity when a bike is added
        UPDATE stations
        SET capacity = capacity + 1
        WHERE name = :new.location_id; -- Match station name to location_id from bikes
    ELSIF DELETING THEN
        -- Decrease capacity when a bike is removed
        UPDATE stations
        SET capacity = capacity - 1
        WHERE name = :old.location_id; -- Match station name to location_id from bikes
    END IF;
END;
/


CREATE OR REPLACE TRIGGER mark_bike_maintenance
AFTER INSERT ON bikemaintenance
FOR EACH ROW
BEGIN
    UPDATE bikes
    SET status = 'Under Maintenance'
    WHERE bike_id = :new.bikes_bike_id;
END;
/

CREATE OR REPLACE TRIGGER update_bike_status
AFTER INSERT OR UPDATE OF end_time ON trips
FOR EACH ROW
BEGIN
    IF :new.end_time IS NULL THEN
        UPDATE bikes
        SET status = 'In Use'
        WHERE bike_id = :new.bikes_bike_id;
    ELSE
        UPDATE bikes
        SET status = 'Available'
        WHERE bike_id = :new.bikes_bike_id;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER check_bike_availability
BEFORE INSERT ON trips
FOR EACH ROW
DECLARE
    v_bike_status bikes.status%TYPE;
BEGIN
    IF :new.end_time IS NULL THEN
        SELECT status INTO v_bike_status
        FROM bikes
        WHERE bike_id = :new.bikes_bike_id;
        
        IF v_bike_status != 'Available' THEN
            RAISE_APPLICATION_ERROR(-20001, 'Selected bike is not available for rent.');
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_bikemaintenance_log
AFTER INSERT ON bikemaintenance
FOR EACH ROW
BEGIN
    INSERT INTO maintenance_log (bikemaintenaince_id, bikes_bike_id, maintenance_maintenance_id, log_time)
    VALUES (:new.bikemaintenaince_id, :new.bikes_bike_id, :new.maintenance_maintenance_id, SYSDATE);
END;
/

CREATE OR REPLACE TRIGGER trg_fee_change_log
AFTER UPDATE OF fee_per_hour ON fees
FOR EACH ROW
BEGIN
    INSERT INTO fee_changes_log (fee_id, old_fee_per_hour, new_fee_per_hour, change_date)
    VALUES (:old.fee_id, :old.fee_per_hour, :new.fee_per_hour, SYSDATE);
END;
/

CREATE OR REPLACE TRIGGER trg_log_customer_trip
AFTER INSERT ON trips
FOR EACH ROW
BEGIN
    INSERT INTO customer_activity_log (trip_id, customer_id, start_time, end_time)
    VALUES (:new.trip_id, :new.customers_customer_id, :new.start_time, :new.end_time);
END;
/

CREATE OR REPLACE TRIGGER trg_card_advanced
BEFORE INSERT OR UPDATE ON card
FOR EACH ROW
DECLARE
    cardNumLength NUMBER;
BEGIN
    -- Basic validation for card number length
    cardNumLength := LENGTH(TO_CHAR(:new.card_number));
    IF cardNumLength < 16 OR cardNumLength > 16 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Card number must be 16 digits.');
    END IF;

    IF UPDATING THEN
        -- Conditional logging: Log only if card number changes, and mask card number
        IF :old.card_number <> :new.card_number THEN
            INSERT INTO card_audit_log (card_id, old_card_number, new_card_number, change_date, action_type)
            VALUES (:old.card_id, SUBSTR(TO_CHAR(:old.card_number), -4), SUBSTR(TO_CHAR(:new.card_number), -4), SYSDATE, 'UPDATE');
        END IF;
    ELSIF DELETING THEN
        -- For deletion, log the action with masked card number
        INSERT INTO card_audit_log (card_id, old_card_number, change_date, action_type)
        VALUES (:old.card_id, SUBSTR(TO_CHAR(:old.card_number), -4), SYSDATE, 'DELETE');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_prevent_duplicate_customers
BEFORE INSERT ON customers
FOR EACH ROW
DECLARE
    email_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO email_count
    FROM customers
    WHERE email = :new.email;

    IF email_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'A customer with this email already exists.');
    END IF;
END;
/








>>>>>>> Stashed changes
