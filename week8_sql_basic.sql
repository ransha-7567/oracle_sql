
--Week 8 SQL Basic

--Student ID: 29804655
--Student Name: Ransha Habarakada
--Unit Code: FIT2094
--Applied Class No: 02


/* Part A - Retrieving data from a single table */

-- A1
SELECT
    *
FROM
    uni.unit
ORDER BY
    unitcode;

-- A2
SELECT
    stuid,
    stufname,
    stulname,
    to_char(
        studob, 'dd-Mon-yyyy'
    ) AS date_of_birth,
    stuaddress,
    stuphone,
    stuemail
FROM
    uni.student
WHERE
    stuaddress LIKE '%Caulfield'
ORDER BY
    stuid;

-- A3
SELECT
    stulname,
    stufname,
    stuaddress
FROM
    uni.student
WHERE
    stulname LIKE 'S%'
    AND stufname LIKE '%i%'
ORDER BY
    stuid;

-- A4
SELECT
    *
FROM
    uni.unit
WHERE
    unitcode LIKE 'FIT1%'
ORDER BY
    unitcode;

-- A5
SELECT
    unitcode,
    ofsemester
FROM
    uni.offering
WHERE
    to_char(
        ofyear, 'yyyy'
    ) = '2021'
ORDER BY
    unitcode,
    ofsemester;

-- A6
SELECT
    to_char(
        ofyear, 'yyyy'
    ) AS offering_year,
    ofsemester,
    unitcode
FROM
    uni.offering
WHERE
    ofsemester = 2
    AND ( ( to_char(
        ofyear, 'yyyy'
    ) = '2019' )
          OR ( to_char(
        ofyear, 'yyyy'
    ) = '2020' ) )
ORDER BY
    offering_year,
    ofsemester,
    unitcode;

-- A7
SELECT
    stuid,
    unitcode,
    enrolmark
FROM
    uni.enrolment
WHERE
    enrolmark < 50
    AND ofsemester = 2
    AND to_char(
        ofyear, 'yyyy'
    ) = '2021'
ORDER BY
    stuid,
    unitcode;
  
  
/* OR*/

SELECT
    stuid,
    unitcode,
    enrolmark
FROM
    uni.enrolment
WHERE
    enrolgrade = 'N'
    AND ofsemester = 2
    AND to_char(
        ofyear, 'yyyy'
    ) = '2021'
ORDER BY
    stuid,
    unitcode;

/* Part B - Retrieving data from multiple tables */

-- B1
SELECT
    unitcode,
    ofsemester,
    stafffname,
    stafflname
FROM
    uni.offering o
    JOIN uni.staff s ON o.staffid = s.staffid
WHERE
    to_char(
        ofyear, 'yyyy'
    ) = '2021'
ORDER BY
    ofsemester,
    unitcode;

-- B2
SELECT
    u.unitcode,
    unitname,
    to_char(
        ofyear, 'yyyy'
    ) AS offeringyear,
    ofsemester
FROM
    uni.unit u
    JOIN uni.offering o ON u.unitcode = o.unitcode
ORDER BY
    unitcode,
    offeringyear,
    ofsemester;

-- B3
SELECT
    e.stuid,
    stufname
    || ' '
    || stulname AS studentname,
    unitname
FROM
    uni.student s
    JOIN uni.enrolment e ON s.stuid = e.stuid
    JOIN uni.unit      u ON u.unitcode = e.unitcode
WHERE
    ofsemester = 1
    AND to_char(
        ofyear, 'yyyy'
    ) = '2021'
ORDER BY
    unitname,
    stuid;

-- B4
SELECT
    unitcode,
    ofsemester,
    cltype,
    clday,
    to_char(
        cltime, 'HHAM'
    )               AS time,
    clduration * 60 AS duration
FROM
    uni.staff s
    JOIN uni.schedclass sc ON s.staffid = sc.staffid
WHERE
    to_char(
        ofyear, 'yyyy'
    ) = '2021'
    AND stafffname = 'Windham'
    AND stafflname = 'Ellard'
ORDER BY
    unitcode,
    ofsemester;

-- B5
SELECT
    e.unitcode,
    unitname,
    ofsemester,
    to_char(
        ofyear, 'yyyy'
    ) AS year,
    nvl(
        to_char(
            enrolmark, '999'
        ), 'N/A'
    ) AS mark,
    nvl(
        enrolgrade, 'N/A'
    ) AS grade
FROM
    uni.student s
    JOIN uni.enrolment e ON s.stuid = e.stuid
    JOIN uni.unit      u ON e.unitcode = u.unitcode
WHERE
    stufname = 'Brier'
    AND stulname = 'Kilgour'
ORDER BY
    year,
    ofsemester,
    unitcode;

-- B6
SELECT
    prerequnitcode AS prereq_unitcode,
    u2.unitname    AS prereq_unitname
FROM
    uni.unit u1
    JOIN uni.prereq p ON u1.unitcode = p.unitcode
    JOIN uni.unit   u2 ON u2.unitcode = p.prerequnitcode
WHERE
    u1.unitname = 'Introduction to data science'
ORDER BY
    prereq_unitcode;

-- B7
SELECT
    s.stuid,
    stufname,
    stulname
FROM
    uni.student s
    JOIN uni.enrolment e ON s.stuid = e.stuid
WHERE
    enrolgrade = 'HD'
    AND unitcode = 'FIT2094'
    AND ofsemester = 2
    AND to_char(
        ofyear, 'yyyy'
    ) = '2021'
ORDER BY
    s.stuid;

-- B8
SELECT
    stufname
    || ' '
    || stulname AS student_fullname,
    e.unitcode
FROM
    uni.student s
    JOIN uni.enrolment e ON s.stuid = e.stuid
WHERE
    enrolmark IS NULL
    AND ofsemester = 1
    AND to_char(
        ofyear, 'yyyy'
    ) = '2021'
ORDER BY
    student_fullname;