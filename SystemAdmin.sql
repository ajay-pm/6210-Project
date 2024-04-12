BEGIN
    EXECUTE IMMEDIATE 'CREATE USER system_admin IDENTIFIED BY BostonSpring2024#';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE = -1920 THEN 
            DBMS_OUTPUT.PUT_LINE('Error in User creation.');
        ELSE
            RAISE;  -- Reraise the exception if it's not ORA-00955
        END IF;
END;
/

GRANT CREATE SESSION TO system_admin;
GRANT CREATE TABLE TO system_admin;
GRANT CREATE SEQUENCE TO system_admin;
GRANT CREATE USER TO system_admin;
GRANT CREATE VIEW TO system_admin;
GRANT CREATE PROCEDURE TO system_admin;
GRANT CREATE TRIGGER TO system_admin;
ALTER USER system_admin QUOTA Unlimited ON System;


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
GRANT CREATE SESSION TO maintenance_user, bike_user;

ALTER USER maintenance_user QUOTA 100M ON System;
ALTER USER bike_user QUOTA 100M ON System;