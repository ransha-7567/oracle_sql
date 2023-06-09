--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-wc-insert.sql

--Student ID: 29084655
--Student Name: Ransha Habarakada
--Unit Code: FIT2094
--Applied Class No: 02

/* Comments for your marker:
I have added commented numbers above each passenger and manifest 
inserted value.

I am assuming I can use the today's date or submission due date as
a guidance to determine which cruises are past cruises and 
which are future cruises.

*/

-- Task 2 Load the PASSENGER and MANIFEST tables with your own
-- test data following the data requirements expressed in the brief

-- =======================================
-- PASSENGER
-- =======================================

--1
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000001,
    'Ransha',
    'Habarakada',
    TO_DATE('03-Mar-2000', 'dd-Mon-yyyy'),
    'M',    /*('M','F','X' )*/ 
    '0432919902',
    NULL    /* Can be NOT NULL */  
);

--2
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000002, 
    'Aidan',
    'Kozulin',
    TO_DATE('22-Sep-1999', 'dd-Mon-yyyy'),
    'M',    /*('M','F','X' )*/ 
    '0403077525',
    NULL    /* Can be NOT NULL */  
);

--3
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000003, 
    'Alex',
    'Karagiannis',
    TO_DATE('09-Apr-1998', 'dd-Mon-yyyy'),
    'M',    /*('M','F','X' )*/ 
    '0475675120',
    NULL    /* Can be NOT NULL */  
);

--4
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000004, 
    'Liam',
    'Murray',
    TO_DATE('29-Jun-1999', 'dd-Mon-yyyy'),
    'X',    /*('M','F','X' )*/ 
    '0490486040',
    NULL    /* Can be NOT NULL */  
);

--5
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000005, 
    'Kelly',
    'Liope',
    TO_DATE('30-Apr-2002', 'dd-Mon-yyyy'),
    'F',    /*('M','F','X' )*/ 
    '0490105394',
    NULL    /* Can be NOT NULL */  
);

--6
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000006, 
    'Veronica',
    'Sommers',
    TO_DATE('27-Feb-1997', 'dd-Mon-yyyy'),
    'F',    /*('M','F','X' )*/ 
    '0410465632',
    NULL    /* Can be NOT NULL */  
);

--7
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000007, 
    'Shirosaki',
    'Koji',
    TO_DATE('16-Nov-1998', 'dd-Mon-yyyy'),
    'M',    /*('M','F','X' )*/ 
    '0451380319',
    NULL    /* Can be NOT NULL */  
);

--8
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000008, 
    'Clark',
    'West',
    TO_DATE('29-Aug-1982', 'dd-Mon-yyyy'),
    'M',    /*('M','F','X' )*/ 
    '0434561345',
    NULL    /* Can be NOT NULL */  
);

--9
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000009, 
    'Kelly',
    'Smith',
    TO_DATE('21-Jan-1984', 'dd-Mon-yyyy'),
    'F',    /*('M','F','X' )*/ 
    '0517328467',
    NULL    /* Can be NOT NULL */  
);

--10
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000010, 
    'Jack',
    'Mills',
    TO_DATE('18-Mar-1989', 'dd-Mon-yyyy'),
    'M',    /*('M','F','X' )*/ 
    '0425634856',
    NULL    /* Can be NOT NULL */  
);

--11 (Under 18)
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000011, 
    'Oscar',
    'Mills',
    TO_DATE('28-Jul-2010', 'dd-Mon-yyyy'),
    'M',    /*('M','F','X' )*/ 
    NULL,
    000010    /* Can be NOT NULL */  
);

--12 (Under 18)
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000012, 
    'Sadie',
    'Mills',
    TO_DATE('06-Apr-2014', 'dd-Mon-yyyy'),
    'F',    /*('M','F','X' )*/ 
    NULL,
    000010    /* Can be NOT NULL */  
);

--13 (Under 18)
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000013, 
    'Robert',
    'Smith',
    TO_DATE('09-Oct-2017', 'dd-Mon-yyyy'),
    'M',    /*('M','F','X' )*/ 
    NULL,
    000009    /* Can be NOT NULL */  
);

--14 (Under 18)
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000014, 
    'Michaela',
    'Smith',
    TO_DATE('13-Dec-2013', 'dd-Mon-yyyy'),
    'F',    /*('M','F','X' )*/ 
    NULL,
    000009    /* Can be NOT NULL */  
);

--15 (Under 18)
INSERT INTO passenger (
    passenger_id,
    passenger_fname,
    passenger_lname,
    passenger_dob,
    passenger_gender,
    passenger_contact,
    guardian_id
) VALUES (
    000015, 
    'Sydney',
    'West',
    TO_DATE('10-Jul-2009', 'dd-Mon-yyyy'),
    'F',    /*('M','F','X' )*/ 
    NULL,
    000008    /* Can be NOT NULL */  
);

-- =======================================
-- MANIFEST
-- =======================================

--1
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000001,
    000001,
    1,
    TO_DATE('02-Apr-2022 9:33', 'dd-Mon-yyyy HH24:MI'),
    101,
    1001
);

--2
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000002,
    000002,
    1,
    TO_DATE('02-Apr-2022 09:21', 'dd-Mon-yyyy HH24:MI'),
    101,
    1002
);


--3
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000003,
    000003,
    1,
    TO_DATE('02-Apr-2022 09:10', 'dd-Mon-yyyy HH24:MI'),
    101,
    1003
);


--4
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000004,
    000004,
    1,
    TO_DATE('02-Apr-2022 09:21', 'dd-Mon-yyyy HH24:MI'),
    101,
    1004
);

--5
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000005,
    000005,
    1,
    TO_DATE('02-Apr-2022 09:25', 'dd-Mon-yyyy HH24:MI'),
    101,
    1012
);

--6
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000006,
    000006,
    1,
    TO_DATE('16-Apr-2022 8:00', 'dd-Mon-yyyy HH24:MI'),
    102,
    2002
);

--7
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000007,
    000007,
    1,
    TO_DATE('16-Apr-2022 08:22', 'dd-Mon-yyyy HH24:MI'),
    102,
    2003
);

--8
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000008,
    000008,
    1,
    TO_DATE('02-Apr-2022 07:50', 'dd-Mon-yyyy HH24:MI'),
    102,
    2004
);

--9
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000009,
    000009,
    3,
    NULL,
    103,
    110
);

--10
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000010,
    000010,
    3,
    NULL,
    103,
    110
);

--11
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000011,
    000011,
    3,
    NULL,
    103,
    111
);

--12
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000012,
    000012,
    3,
    NULL,
    103,
    111
);

--13
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000013,
    000013,
    4,
    TO_DATE('07-May-2022 13:00', 'dd-Mon-yyyy HH24:MI'),
    101,
    1001
);

--14
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000014,
    000014,
    4,
    TO_DATE('07-May-2022 13:20', 'dd-Mon-yyyy HH24:MI'),
    101,
    1001
);

--15
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000015,
    000015,
    4,
    TO_DATE('07-May-2022 13:20', 'dd-Mon-yyyy HH24:MI'),
    101,
    1001
);

--16
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000016,
    000001,
    5,
    TO_DATE('08-May-2022 10:00', 'dd-Mon-yyyy HH24:MI'),
    102,
    2001
);

--17
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000017,
    000002,
    5,
    TO_DATE('08-May-2022 09:30', 'dd-Mon-yyyy HH24:MI'),
    102,
    2001
);

--18
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000018,
    000003,
    5,
    TO_DATE('08-May-2022 09:21', 'dd-Mon-yyyy HH24:MI'),
    102,
    2001
);

--19
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000019,
    000004,
    5,
    TO_DATE('08-May-2022 09:25', 'dd-Mon-yyyy HH24:MI'),
    102,
    2002
);

--20
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000020,
    000005,
    5,
    TO_DATE('08-May-2022 09:45', 'dd-Mon-yyyy HH24:MI'),
    102,
    2002
);

--21
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000021,
    000006,
    5,
    TO_DATE('08-May-2022 09:41', 'dd-Mon-yyyy HH24:MI'),
    102,
    2002
);

--22
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000022,
    000007,
    5,
    TO_DATE('08-May-2022 08:55', 'dd-Mon-yyyy HH24:MI'),
    102,
    2003
);

--23
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000023,
    000008,
    5,
    TO_DATE('08-May-2022 09:34', 'dd-Mon-yyyy HH24:MI'),
    102,
    2003
);

--24
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000024,
    000009,
    5,
    NULL,
    102,
    2003
);

--25
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000025,
    000010,
    8,
    TO_DATE('30-Oct-2022 9:30', 'dd-Mon-yyyy HH24:MI'),
    105,
    8031
);

--26
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000026,
    000011,
    8,
    TO_DATE('30-Oct-2022 9:30', 'dd-Mon-yyyy HH24:MI'),
    105,
    8031
);

--27
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000027,
    000012,
    8,
    TO_DATE('30-Oct-2022 9:30', 'dd-Mon-yyyy HH24:MI'),
    105,
    8031
);

--28
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000028,
    000013,
    7,
    TO_DATE('23-Oct-2022 10:00', 'dd-Mon-yyyy HH24:MI'),
    103,
    110
);

--29
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000029,
    000014,
    7,
    TO_DATE('23-Oct-2022 10:00', 'dd-Mon-yyyy HH24:MI'),
    103,
    110
);

--30
INSERT INTO manifest (
   manifest_id,
   passenger_id,
   cruise_id,
   manifest_board_datetime,
   ship_code,
   cabin_no
) VALUES (
    0000030,
    000015,
    7,
    TO_DATE('23-Oct-2022 10:00', 'dd-Mon-yyyy HH24:MI'),
    103,
    110
);




