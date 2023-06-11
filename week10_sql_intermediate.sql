
--Week 10 SQL Intermediate

--Student ID: 29804655
--Student Name: Ransha Habarakada
--Unit Code: FIT2094
--Applied Class No: 02

--1

SELECT
    to_char(AVG(enrolmark), '990.00') AS average_mark
FROM
    uni.enrolment
WHERE
    upper(unitcode) = 'FIT2094'
    AND ofsemester = 2
    AND to_char(ofyear, 'YYYY') = '2020';

--2

SELECT
    to_char(ofyear, 'YYYY') AS year,
    ofsemester,
    to_char(AVG(enrolmark), '990.0') AS average_mark
FROM
    uni.enrolment
WHERE
    upper(unitcode) = 'FIT9136'
GROUP BY
    to_char(ofyear, 'YYYY'),
    ofsemester
ORDER BY
    year,
    ofsemester;

--3
-- a. Repeat students are counted multiple times in each semester of 2019

SELECT
    COUNT(stuid) AS student_count
FROM
    uni.enrolment
WHERE
    upper(unitcode) = 'FIT1045'
    AND to_char(ofyear, 'YYYY') = '2019';

-- b. Repeat students are only counted once across 2019

SELECT
    COUNT(DISTINCT stuid) AS student_count
FROM
    uni.enrolment
WHERE
    upper(unitcode) = 'FIT1045'
    AND to_char(ofyear, 'YYYY') = '2019';

--4

SELECT
    COUNT(prerequnitcode) AS no_prereqs
FROM
    uni.prereq
WHERE
    upper(unitcode) = 'FIT5145';


--5

SELECT
    unitcode,
    COUNT(prerequnitcode) AS no_prereqs
FROM
    uni.prereq
GROUP BY
    unitcode
ORDER BY
    unitcode;

--6

SELECT
    unitcode,
    COUNT(stuid) AS total_no_students
FROM
    uni.enrolment
WHERE
    ofsemester = 2
    AND to_char(ofyear, 'yyyy') = '2020'
    AND upper(enrolgrade) = 'WH'
GROUP BY
    unitcode
ORDER BY
    total_no_students DESC, unitcode;

--7

SELECT
    prerequnitcode AS unitcode,
    u.unitname,
    COUNT(u.unitcode) AS no_times_used
FROM
    uni.prereq   p
    JOIN uni.unit     u ON u.unitcode = p.prerequnitcode
GROUP BY
    prerequnitcode,
    u.unitname
ORDER BY
    unitcode;

--8

SELECT
    unitcode,
    unitname
FROM
         uni.enrolment
    NATURAL JOIN uni.unit
WHERE
        ofsemester = 2
    AND to_char(ofyear, 'yyyy') = '2021'
    AND upper(enrolgrade) = 'DEF'
GROUP BY
    unitcode,
    unitname
HAVING
    COUNT(*) >= 2
ORDER BY
    unitcode;

--9


SELECT
    unitcode,
    ofsemester,
    COUNT(stuid) AS student_count
FROM
    uni.enrolment
WHERE
    to_char(ofyear, 'YYYY') = '2019'
GROUP BY
    unitcode,
    ofsemester
HAVING
    COUNT(stuid) = (
        SELECT
            MAX(COUNT(stuid))
        FROM
            uni.enrolment
        WHERE
            to_char(ofyear, 'YYYY') = '2019'
        GROUP BY
            unitcode,
            ofsemester
    )
ORDER BY
    ofsemester,
    unitcode;

--10

SELECT
    stufname || ' ' || stulname as student_name,
    enrolmark
FROM
    uni.student     s
    JOIN uni.enrolment   e ON s.stuid = e.stuid
WHERE
    upper(unitcode) = 'FIT3157'
    AND ofsemester = 1
    AND to_char(ofyear, 'YYYY') = '2020'
    AND enrolmark > (
        SELECT
            AVG(enrolmark)
        FROM
            uni.enrolment
        WHERE
            upper(unitcode) = 'FIT3157'
            AND ofsemester = 1
            AND to_char(ofyear, 'YYYY') = '2020'
    )
ORDER BY
    enrolmark DESC, student_name;

