--****PLEASE ENTER YOUR DETAILS BELOW****
--T4-wc-alter.sql

--Student ID: 29804655
--Student Name: Ransha Habarakada
--Unit Code: FIT2094
--Applied Class No: 02

/* Comments for your marker:
Some testing code has been left over for me to see how the table would look
after alters were made.

It is assumed that a ship doesn't require a maintenance start date as they might 
not need on for an extended period of time. Hence a 'NOT NULL' has not been
inserted for this reason. Same with maintenance types due to the fact the 
ship might not be allocated a type at all.

*/

--4(a)

ALTER TABLE cruise
ADD cruise_passengercount NUMBER(6) DEFAULT 0;

UPDATE cruise
SET cruise_passengercount = (SELECT COUNT(cruise_id) FROM manifest 
WHERE manifest.cruise_id = cruise.cruise_id)
;

/*  Output Table Code
SELECT * 
FROM cruise;

*/

--4(b)
ALTER TABLE ship
ADD ship_maint_type CHAR(1);

ALTER TABLE ship
ADD ship_maint_start DATE;

ALTER TABLE ship
ADD ship_maint_end DATE;

COMMENT ON COLUMN ship.ship_maint_type IS
    'Type of maintenance - P Preventative, S Scheduled, B Breakdown, C Condition';

COMMENT ON COLUMN ship.ship_maint_start IS
    'Start date of maintenance period';
    
COMMENT ON COLUMN ship.ship_maint_end IS
    'End date of maintenance period';

ALTER TABLE ship
    ADD CONSTRAINT ship_maint_type_chk CHECK ( ship_maint_type IN ('P','S','B','C'))
;

--4(c)

DROP TABLE guardian CASCADE CONSTRAINTS PURGE;

DROP SEQUENCE passenger_seq_pk;
DROP SEQUENCE guardian_seq_num_pk;

CREATE SEQUENCE passenger_seq_pk START WITH 000001 INCREMENT BY 1;
CREATE SEQUENCE guardian_seq_num_pk START WITH 0000001 INCREMENT BY 1;

CREATE TABLE guardian (
    guardian_num NUMBER(7) NOT NULL,
    guardian_id NUMBER(6),
    passenger_id NUMBER(6) NOT NULL
);

COMMENT ON COLUMN guardian.guardian_num IS 
    'Unique identifer for guardian transaction';
    
COMMENT ON COLUMN guardian.guardian_id IS 
    'Unique identifer for a guardian';
    
COMMENT ON COLUMN guardian.passenger_id IS 
    'Unique identifier for a passenger';

ALTER TABLE guardian ADD CONSTRAINT guardian_pk 
    PRIMARY KEY (guardian_num);

ALTER TABLE guardian
    ADD CONSTRAINT guardian_passenger_id_fk FOREIGN KEY (passenger_id)
        REFERENCES passenger (passenger_id);

INSERT INTO guardian VALUES (
    guardian_seq_num_pk.NEXTVAL,
    DISTINCT guardian_id,
    passenger_seq_pk.NEXTVAL
    );

SELECT *
FROM guardian;



/*
INSERT INTO guardian VALUES (
      guardian_seq_num_pk.NEXTVAL,
      (SELECT DISTINCT(guardian_id) FROM passenger 
      WHERE guardian_id = passenger_id),
      passenger_seq_pk.NEXTVAL
);*/

