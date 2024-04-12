SET AUTOCOMMIT ON;

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
    EXECUTE IMMEDIATE 'CREATE TABLE maintenance_log (
        log_id               NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1) PRIMARY KEY,
        maintenance_id       NUMBER NOT NULL,
        bike_id              NUMBER NOT NULL,
        start_of_maintenance DATE,
        end_of_maintenance   DATE,
        description          VARCHAR2(50),
        maintanance_operator VARCHAR2(50),
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
        log_id          NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1) PRIMARY KEY,
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
        log_id        NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1) PRIMARY KEY,
        trip_id       NUMBER NOT NULL,
        customer_id   NUMBER NOT NULL,
        start_time    DATE NOT NULL,
        end_time      DATE
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
            Else
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/
            
BEGIN
    EXECUTE IMMEDIATE 'CREATE TABLE fee_changes_log (
        log_id            NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1)PRIMARY KEY,
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
    EXECUTE IMMEDIATE 'CREATE TABLE maintenance (
        maintenance_id       NUMBER DEFAULT maintenanceID.NEXTVAL NOT NULL,
        bike_id              NUMBER NOT NULL,
        start_of_maintenance DATE,
        end_of_maintenance   DATE,
        description          VARCHAR2(50),
        maintanance_operator VARCHAR2(50)
    )';
    EXECUTE IMMEDIATE 'ALTER TABLE maintenance ADD CONSTRAINT maintenance_pk PRIMARY KEY ( maintenance_id )';
    EXECUTE IMMEDIATE 'ALTER TABLE maintenance ADD CONSTRAINT trips_bikes_fk FOREIGN KEY ( bike_id ) REFERENCES bikes ( bike_id )';
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
        end_time              DATE,
        bikes_bike_id         NUMBER NOT NULL,
        customers_customer_id NUMBER NOT NULL,
        start_station_id      NUMBER NOT NULL,
        end_station_id        NUMBER,
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

--insert maintenance data

INSERT INTO MAINTENANCE (bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (1, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-03', 'YYYY-MM-DD'), 'Routine check', 'A');

INSERT INTO MAINTENANCE (bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (1, TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-02-16', 'YYYY-MM-DD'), 'Battery replacement', 'B');

INSERT INTO MAINTENANCE (bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (2, TO_DATE('2022-03-20', 'YYYY-MM-DD'), TO_DATE('2022-03-21', 'YYYY-MM-DD'), 'Brake adjustment', 'C');

INSERT INTO MAINTENANCE (bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (3, TO_DATE('2022-04-10', 'YYYY-MM-DD'), TO_DATE('2022-04-12', 'YYYY-MM-DD'), 'Tire replacement', 'D');

INSERT INTO MAINTENANCE (bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (4, TO_DATE('2022-05-05', 'YYYY-MM-DD'), TO_DATE('2022-05-07', 'YYYY-MM-DD'), 'Chain lubrication', 'E');

INSERT INTO MAINTENANCE (bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (5, TO_DATE('2022-06-08', 'YYYY-MM-DD'), TO_DATE('2022-06-09', 'YYYY-MM-DD'), 'Frame inspection', 'F');

INSERT INTO MAINTENANCE (bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (2, TO_DATE('2022-07-15', 'YYYY-MM-DD'), TO_DATE('2022-07-17', 'YYYY-MM-DD'), 'Light replacement', 'G');

INSERT INTO MAINTENANCE (bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
VALUES (5, TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2022-08-21', 'YYYY-MM-DD'), 'Handlebar adjustment', 'H');

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
        maintenance m ON b.bike_id = m.bike_id';
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

CREATE OR REPLACE TRIGGER check_duplicate_customer
BEFORE INSERT ON customers
FOR EACH ROW
DECLARE
    phone_exists NUMBER;
    email_exists NUMBER;
BEGIN
    -- Check if the new row being inserted has a duplicate phone number
    SELECT COUNT(*)
    INTO phone_exists
    FROM customers
    WHERE phone = :new.phone;

    -- Check if the new row being inserted has a duplicate email
    SELECT COUNT(*)
    INTO email_exists
    FROM customers
    WHERE email = :new.email;

    -- If a duplicate phone number or email is found, raise an exception
    IF phone_exists > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'A customer with this phone number already exists.');
    ELSIF email_exists > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'A customer with this email already exists.');
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
AFTER INSERT ON maintenance
FOR EACH ROW
BEGIN
    UPDATE bikes
    SET status = 'Under Maintenance'
    WHERE bike_id = :new.bike_id;
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
AFTER INSERT OR Update ON maintenance
FOR EACH ROW
BEGIN
    INSERT INTO maintenance_log (maintenance_id, bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR, LOG_TIME)
    VALUES (:new.maintenance_id, :new.bike_id, :new.START_OF_MAINTENANCE, :new.END_OF_MAINTENANCE, :new.DESCRIPTION, :new.MAINTANANCE_OPERATOR, SYSDATE);
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
AFTER INSERT or update ON trips
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

CREATE OR REPLACE TRIGGER trg_prevent_open_trip
BEFORE INSERT ON trips
FOR EACH ROW
DECLARE
    v_open_trip_count NUMBER;
BEGIN
    -- Check if the customer already has an open trip
    SELECT COUNT(*)
    INTO v_open_trip_count
    FROM trips
    WHERE customers_customer_id = :NEW.customers_customer_id
      AND end_time IS NULL; -- Assumes an open trip doesn't have an end time

    IF v_open_trip_count > 0 THEN
        -- Customer already has an open trip, raise an exception to prevent the new trip insertion
        RAISE_APPLICATION_ERROR(-20001, 'Customer already has an open trip. Cannot open a new trip.');
    END IF;
END;
/


--mark_bike_maintenance_procedure
CREATE OR REPLACE PROCEDURE mark_bike_maintenance_procedure (
    new_bike_id IN bikes.bike_id%TYPE
)
AS
BEGIN
    UPDATE bikes
    SET status = 'Under Maintenance'
    WHERE bike_id = new_bike_id;
END mark_bike_maintenance_procedure;
/

--update_bike_status_procedure
CREATE OR REPLACE PROCEDURE update_bike_status_procedure (
    new_bike_id IN trips.bikes_bike_id%TYPE,
    new_end_time IN trips.end_time%TYPE
)
AS
BEGIN
    IF new_end_time IS NULL THEN
        UPDATE bikes
        SET status = 'In Use'
        WHERE bike_id = new_bike_id;
    ELSE
        UPDATE bikes
        SET status = 'Available'
        WHERE bike_id = new_bike_id;
    END IF;
END update_bike_status_procedure;
/

--check_bike_availability_procedure
CREATE OR REPLACE PROCEDURE check_bike_availability_procedure (
    new_bike_id IN trips.bikes_bike_id%TYPE,
    new_end_time IN trips.end_time%TYPE
)
AS
    v_bike_status bikes.status%TYPE;
BEGIN
    IF new_end_time IS NULL THEN
        SELECT status INTO v_bike_status
        FROM bikes
        WHERE bike_id = new_bike_id;
        
        IF v_bike_status != 'Available' THEN
            RAISE_APPLICATION_ERROR(-20001, 'Selected bike is not available for rent.');
        END IF;
    END IF;
END check_bike_availability_procedure;
/
    
--bike_maintenance_log_procedure
CREATE OR REPLACE PROCEDURE maintenance_log_procedure (
    new_bike_maintenance_id IN maintenance.maintenance_id%TYPE,
    new_bike_id IN maintenance.bike_id%TYPE,
    new_START_OF_MAINTENANCE IN maintenance.START_OF_MAINTENANCE%TYPE,
    new_END_OF_MAINTENANCE IN maintenance.END_OF_MAINTENANCE%TYPE,
    new_DESCRIPTION IN maintenance.DESCRIPTION%TYPE,
    new_MAINTANANCE_OPERATOR IN maintenance.MAINTANANCE_OPERATOR%TYPE
)
AS
BEGIN
    INSERT INTO maintenance_log (maintenance_id, bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR, LOG_TIME)
    VALUES (new_bike_maintenance_id, new_bike_id, new_START_OF_MAINTENANCE,new_END_OF_MAINTENANCE,new_DESCRIPTION,new_MAINTANANCE_OPERATOR, SYSDATE);
END maintenance_log_procedure;
/
-- Create or replace the procedure to insert a new maintenance entry
CREATE OR REPLACE PROCEDURE create_new_maintenance_procedure (
    new_maintenance_id IN maintenance.maintenance_id%TYPE,
    new_bike_id IN maintenance.bike_id%TYPE,
    new_start_of_maintenance IN maintenance.START_OF_MAINTENANCE%TYPE,
    new_end_of_maintenance IN maintenance.END_OF_MAINTENANCE%TYPE,
    new_description IN maintenance.DESCRIPTION%TYPE,
    new_maintenance_operator IN maintenance.MAINTANANCE_OPERATOR%TYPE
)
AS
BEGIN
    INSERT INTO maintenance (maintenance_id, bike_id, START_OF_MAINTENANCE, END_OF_MAINTENANCE, DESCRIPTION, MAINTANANCE_OPERATOR)
    VALUES (new_maintenance_id, new_bike_id, new_start_of_maintenance, new_end_of_maintenance, new_description, new_maintenance_operator);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('New maintenance log entry created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END create_new_maintenance_procedure;
/

-- Create or replace the procedure to update the end of maintenance in a maintenance log entry
CREATE OR REPLACE PROCEDURE update_end_of_maintenance (
    maintenance_log_id IN maintenance_log.maintenance_id%TYPE,
    new_end_of_maintenance IN maintenance_log.END_OF_MAINTENANCE%TYPE
)
AS
BEGIN
    UPDATE maintenance
    SET END_OF_MAINTENANCE = new_end_of_maintenance
    WHERE maintenance_id = maintenance_log_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('End of maintenance updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No maintenance log entry found with ID ' || maintenance_log_id);
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END update_end_of_maintenance;
/
--fee_change_log_procedure
CREATE OR REPLACE PROCEDURE fee_change_log_procedure (
    old_fee_id IN fees.fee_id%TYPE,
    old_fee_per_hour IN fees.fee_per_hour%TYPE,
    new_fee_per_hour IN fees.fee_per_hour%TYPE
)
AS
BEGIN
    INSERT INTO fee_changes_log (fee_id, old_fee_per_hour, new_fee_per_hour, change_date)
    VALUES (old_fee_id, old_fee_per_hour, new_fee_per_hour, SYSDATE);
END fee_change_log_procedure;
/
--customer_trip_log_procedure
CREATE OR REPLACE PROCEDURE customer_trip_log_procedure (
    new_trip_id IN trips.trip_id%TYPE,
    new_customer_id IN trips.customers_customer_id%TYPE,
    new_start_time IN trips.start_time%TYPE,
    new_end_time IN trips.end_time%TYPE
)
AS
BEGIN
    INSERT INTO customer_activity_log (trip_id, customer_id, start_time, end_time)
    VALUES (new_trip_id, new_customer_id, new_start_time, new_end_time);
END customer_trip_log_procedure;
/
--card_audit_log_procedure
CREATE OR REPLACE PROCEDURE card_audit_log_procedure (
    old_card_id IN card.card_id%TYPE,
    old_card_number IN card.card_number%TYPE,
    new_card_number IN card.card_number%TYPE,
    action_type IN VARCHAR2
)
AS
BEGIN
    IF action_type = 'UPDATE' THEN
        INSERT INTO card_audit_log (card_id, old_card_number, new_card_number, change_date, action_type)
        VALUES (old_card_id, SUBSTR(TO_CHAR(old_card_number), -4), SUBSTR(TO_CHAR(new_card_number), -4), SYSDATE, 'UPDATE');
    ELSIF action_type = 'DELETE' THEN
        INSERT INTO card_audit_log (card_id, old_card_number, change_date, action_type)
        VALUES (old_card_id, SUBSTR(TO_CHAR(old_card_number), -4), SYSDATE, 'DELETE');
    END IF;
END card_audit_log_procedure;
/

--prevent_duplicate_customers_procedure
CREATE OR REPLACE PROCEDURE prevent_duplicate_customers_procedure (
    new_email IN customers.email%TYPE
)
AS
    email_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO email_count
    FROM customers
    WHERE email = new_email;

    IF email_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'A customer with this email already exists.');
    END IF;
END prevent_duplicate_customers_procedure; 
/

-- Create or replace the procedure to insert a new customer
CREATE OR REPLACE PROCEDURE create_new_customer (
    new_first_name IN customers.first_name%TYPE,
    new_last_name IN customers.last_name%TYPE,
    new_email IN customers.email%TYPE,
    new_phone IN customers.phone%TYPE
)
AS
BEGIN
    INSERT INTO customers (first_name, last_name, email, phone)
    VALUES ( new_first_name, new_last_name, new_email, new_phone);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('New customer created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END create_new_customer;
/

CREATE OR REPLACE PROCEDURE new_trip (
    new_bike_id IN trips.bikes_bike_id%TYPE,
    new_customer_id IN trips.customers_customer_id%TYPE,
    new_start_station_id IN trips.start_station_id%TYPE
)
AS
BEGIN
    INSERT INTO trips (start_time, end_time, bikes_bike_id, customers_customer_id, start_station_id, end_station_id, trip_paid)
    VALUES (SYSDATE, NULL, new_bike_id, new_customer_id, new_start_station_id, NULL, NULL);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('New trip entry created successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END new_trip;
/

-- Create or replace the procedure to show a customer their current trip
CREATE OR REPLACE PROCEDURE show_current_trip (
    customer_id IN trips.customers_customer_id%TYPE
)
AS
    v_trip_id trips.trip_id%TYPE;
    v_start_time trips.start_time%TYPE;
    v_end_time trips.end_time%TYPE;
    v_bike_id trips.bikes_bike_id%TYPE;
    v_start_station_id trips.start_station_id%TYPE;
    v_end_station_id trips.end_station_id%TYPE;
BEGIN
    SELECT trip_id, start_time, end_time, bikes_bike_id, start_station_id, end_station_id
    INTO v_trip_id, v_start_time, v_end_time, v_bike_id, v_start_station_id, v_end_station_id
    FROM trips
    WHERE customers_customer_id = customer_id
      AND end_time IS NULL; -- Retrieves only open trips

    -- Display the current trip details
    DBMS_OUTPUT.PUT_LINE('Current Trip Details:');
    DBMS_OUTPUT.PUT_LINE('Trip ID: ' || v_trip_id);
    DBMS_OUTPUT.PUT_LINE('Start Time: ' || TO_CHAR(v_start_time, 'DD-MON-YY'));
    DBMS_OUTPUT.PUT_LINE('End Time: ' || NVL(TO_CHAR(v_end_time, 'DD-MON-YY HH24:MI:SS'), 'Not ended yet'));
    DBMS_OUTPUT.PUT_LINE('Bike ID: ' || v_bike_id);
    DBMS_OUTPUT.PUT_LINE('Start Station ID: ' || v_start_station_id);
    DBMS_OUTPUT.PUT_LINE('End Station ID: ' || NVL(TO_CHAR(v_end_station_id), 'Not ended yet'));
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No open trip found for customer ' || customer_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END show_current_trip;
/

CREATE OR REPLACE PROCEDURE update_trip_end_details (
    customer_id_in IN trips.customers_customer_id%TYPE,
    end_station_id_in IN trips.end_station_id%TYPE
)
AS
    v_trip_id trips.trip_id%TYPE;
BEGIN
    -- Find the open trip for the specified customer
    SELECT trip_id
    INTO v_trip_id
    FROM trips
    WHERE customers_customer_id = customer_id_in
      AND end_time IS NULL; -- Assumes an open trip doesn't have an end time

    -- Update the end time and end station for the open trip
    UPDATE trips
    SET end_time = SYSDATE,
        end_station_id = end_station_id_in
    WHERE trip_id = v_trip_id;

    DBMS_OUTPUT.PUT_LINE('End time and station updated for trip ID ' || v_trip_id);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No open trip found for customer ' || customer_id_in);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END update_trip_end_details;
/

CREATE OR REPLACE FUNCTION calculate_rental_fee(
    trip_id_in IN trips.trip_id%TYPE
) RETURN NUMBER
AS
    start_time DATE;
    end_time DATE;
    fee_per_hour NUMBER := 10.0;  -- Assume a default fee or fetch dynamically as needed
    total_fee NUMBER;
    rental_duration_hrs NUMBER;
BEGIN
    -- Retrieve start and end times based on trip ID
    SELECT start_time, end_time
    INTO start_time, end_time
    FROM trips
    WHERE trip_id = trip_id_in;

    -- Ensure end_time is not null to proceed with duration calculation
    IF end_time IS NOT NULL THEN
        -- Calculate the duration in hours
        rental_duration_hrs := (end_time - start_time) * 24;
    ELSE
        -- If end_time is null, assume ongoing trip with no fees applicable yet
        rental_duration_hrs := 0;
    END IF;

    -- Calculate total fee
    total_fee := rental_duration_hrs * fee_per_hour;

    RETURN total_fee;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If the trip information is not found, return zero as fee
        RETURN 0;
    WHEN OTHERS THEN
        RAISE;
END;
/



CREATE OR REPLACE FUNCTION is_bike_available(
    bike_id_in IN bikes.bike_id%TYPE
) RETURN VARCHAR2
AS
    bike_status VARCHAR2(50);
BEGIN
    SELECT status INTO bike_status FROM bikes WHERE bike_id = bike_id_in;

    IF bike_status = 'Available' THEN
        RETURN 'Yes';
    ELSE
        RETURN 'No';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Bike not found';
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE FUNCTION get_customer_status(
    customer_id_in IN customers.customer_id%TYPE
) RETURN VARCHAR2
AS
    card_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO card_count FROM card WHERE customer_id = customer_id_in;

    IF card_count > 0 THEN
        RETURN 'Active';
    ELSE
        RETURN 'Inactive';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'No customer found';
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE FUNCTION total_trips_from_station(
    station_id_in IN stations.station_id%TYPE
) RETURN NUMBER
AS
    trips_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO trips_count FROM trips WHERE start_station_id = station_id_in;

    RETURN trips_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        RAISE;
END;
/




