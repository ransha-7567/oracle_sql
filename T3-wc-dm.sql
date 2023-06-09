--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-wc-dm.sql

--Student ID: 29084655
--Student Name: Ransha Habarakada
--Unit Code: FIT2094
--Applied Class No: 02

/* Comments for your marker:
I am assuming that it is okay to search and find the name of the
parent when identifying the passenger_id of their guardian.
Due to no other more appropriate way to select a guardian.

Some extra code has been left for during moments when I needed to
see the updated tables after some statemnets were ran.

*/

--3(a)
DROP SEQUENCE passenger_seq_pk;
DROP SEQUENCE manifest_seq_pk;

CREATE SEQUENCE passenger_seq_pk START WITH 000100 INCREMENT BY 1;
CREATE SEQUENCE manifest_seq_pk START WITH 0000100 INCREMENT BY 1;

--3(b)
INSERT INTO passenger VALUES (
    passenger_seq_pk.NEXTVAL,
    'Dominik',
    'Davies',
    TO_DATE('11-Jan-1980', 'dd-Mon-yyyy'),
    'M',
    '0493336312',
    NULL
);

INSERT INTO manifest VALUES (
    manifest_seq_pk.NEXTVAL,
    passenger_seq_pk.CURRVAL,
    7,
    TO_DATE('23-Oct-2022 10:00', 'dd-Mon-yyyy hh24:mi'),
    103,
    210
);

INSERT INTO passenger VALUES (
    passenger_seq_pk.NEXTVAL,
    'Henrietta',
    'Davies',
    TO_DATE('10-Mar-2015', 'dd-Mon-yyyy'),
    'F',
    NULL,
    (SELECT
        passenger_id
    FROM
        passenger
    WHERE
        passenger_fname = 'Dominik' AND
        passenger_lname = 'Davies'
    )
);

INSERT INTO manifest VALUES (
    manifest_seq_pk.NEXTVAL,
    passenger_seq_pk.CURRVAL,
    7,
    TO_DATE('23-Oct-2022 10:00', 'dd-Mon-yyyy hh24:mi'),
    103,
    210
);

INSERT INTO passenger VALUES (
    passenger_seq_pk.NEXTVAL,
    'Poppy',
    'Davies',
    TO_DATE('10-Mar-2015', 'dd-Mon-yyyy'),
    'F',
    NULL,
    (SELECT
        passenger_id
    FROM
        passenger
    WHERE
        passenger_fname = 'Dominik' AND
        passenger_lname = 'Davies'
    )
);

INSERT INTO manifest VALUES (
    manifest_seq_pk.NEXTVAL,
    passenger_seq_pk.CURRVAL,
    7,
    TO_DATE('23-Oct-2022 10:00', 'dd-Mon-yyyy hh24:mi'),
    103,
    210
);

--3(c)

/* Prior Table Check
SELECT *
FROM manifest;
*/

DELETE FROM manifest
WHERE 
    passenger_id = 0000102;

/*
SELECT *
FROM manifest;
After Table Check */

/* Prior Table Check
SELECT *
FROM passenger;
*/

DELETE FROM passenger
WHERE 
    passenger_id = 0000102 AND
    passenger_fname = 'Poppy' AND
    passenger_lname = 'Davies';
 
/*
SELECT *
FROM passenger;
 After Table Check */

--3(d)

/* Prior Table Check
SELECT *
FROM manifest;
*/

DELETE FROM manifest
WHERE 
    passenger_id = 0000101;

DELETE FROM passenger
WHERE 
    passenger_id = 0000101 AND
    passenger_fname = 'Henrietta' AND
    passenger_lname = 'Davies'; 

/*
SELECT *
FROM manifest;
After Table Check */

DELETE FROM manifest
WHERE 
    passenger_id = 0000100;

/* Prior Table Check
SELECT *
FROM passenger;
*/

DELETE FROM passenger
WHERE 
    passenger_id = 0000100 AND
    passenger_fname = 'Dominik' AND
    passenger_lname = 'Davies';
    
/*
SELECT *
FROM passenger;
 After Table Check */



