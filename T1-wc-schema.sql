--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-wc-schema.sql

--Student ID: 29084655
--Student Name: Ransha Habarakada
--Unit Code: FIT2094
--Applied Class No: 02

/* Comments for your marker:
At the bottom of the page there is old code I wanted to keep around in case
I wanted to copy or keep saved variants of my work. They can be ignored.

*/

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script



-- PASSENGER

CREATE TABLE passenger (
    passenger_id NUMBER(6) NOT NULL,
    passenger_fname VARCHAR(30),
    passenger_lname VARCHAR(30),
    passenger_dob DATE NOT NULL,
    passenger_gender CHAR(1) NOT NULL,
    passenger_contact CHAR(10),
    guardian_id NUMBER(6)
);

COMMENT ON COLUMN passenger.passenger_id IS 
    'Unique identifier for a passenger';
COMMENT ON COLUMN passenger.passenger_fname IS 
    'Passenger first name';
COMMENT ON COLUMN passenger.passenger_lname IS
    'Passenger last name';
COMMENT ON COLUMN passenger.passenger_dob IS
    'Passenger date of birth';
COMMENT ON COLUMN passenger.passenger_gender IS
    'Passenger gender (M for male, F for female, or X for
    non-binary/indeterminate/intersex/unspecified/other';
COMMENT ON COLUMN passenger.passenger_contact IS
    'Passenger contact number';
COMMENT ON COLUMN passenger.guardian_id IS 
    'Unique identifier for a guardian';

ALTER TABLE passenger ADD CONSTRAINT passenger_pk 
    PRIMARY KEY (passenger_id);
ALTER TABLE passenger ADD CONSTRAINT passenger_contact_unique 
    UNIQUE (passenger_contact);
ALTER TABLE passenger ADD CONSTRAINT check_passenger_gender 
    CHECK (passenger_gender IN ('M','F','X'));
    
-- MANIFEST

CREATE TABLE manifest (
   manifest_id NUMBER(7) NOT NULL,
   passenger_id NUMBER(6) NOT NULL,
   cruise_id NUMBER(6) NOT NULL,
   manifest_board_datetime DATE,
   ship_code NUMBER(4) NOT NULL,
   cabin_no NUMBER(5) NOT NULL
); 

COMMENT ON COLUMN manifest.manifest_id IS
    'Unique identifier for a manifest';

COMMENT ON COLUMN manifest.passenger_id IS
    'Unique identifer for a passenger';

COMMENT ON COLUMN manifest.cruise_id IS
    'Cruise identifier - used only for a single cruise';

COMMENT ON COLUMN manifest.manifest_board_datetime IS
    'Date/time passenger boarded ship';

COMMENT ON COLUMN manifest.ship_code IS
    'Identifier for ship';
    
COMMENT ON COLUMN manifest.cabin_no IS
    'Cabin number on given ship';

ALTER TABLE manifest ADD CONSTRAINT manifest_pk 
    PRIMARY KEY (manifest_id);
    
ALTER TABLE manifest ADD CONSTRAINT manifest_un
    UNIQUE (passenger_id, cruise_id);

-- Add all missing FK Constraints below here
ALTER TABLE passenger 
    ADD CONSTRAINT guardian_passenger_fk FOREIGN KEY (guardian_id)
        REFERENCES passenger (passenger_id);

ALTER TABLE manifest
    ADD CONSTRAINT manifest_passenger_id_fk FOREIGN KEY (passenger_id)
        REFERENCES passenger (passenger_id);
            
ALTER TABLE manifest
    ADD CONSTRAINT manifest_cruise_id_fk FOREIGN KEY (cruise_id)
        REFERENCES cruise (cruise_id);

ALTER TABLE manifest
    ADD CONSTRAINT manifest_ship_cabin_fk FOREIGN KEY (ship_code, cabin_no)
        REFERENCES cabin (ship_code, cabin_no);
/*
 - OLD CODE - 

ALTER TABLE manifest
    ADD CONSTRAINT manifest_ship_code_fk FOREIGN KEY (ship_code)
        REFERENCES ship (ship_code) 
            ON DELETE CASCADE ;

SELECT * FROM cabin; 
SELECT * FROM ALL_CONS_COLUMNS WHERE TABLE_NAME = 'cabin';
  
ALTER TABLE manifest
ADD CONSTRAINT manifest_cabin_no_fk FOREIGN KEY (cabin_no)
    REFERENCES cabin (cabin_no)
        ON DELETE CASCADE;
                   
ALTER TABLE manifest
    ADD CONSTRAINT manifest_cabin_no_fk FOREIGN KEY (cabin_no)
        REFERENCES cabin (cabin_no) 
            ON DELETE CASCADE ;
*/




