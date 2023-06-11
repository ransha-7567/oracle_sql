--1

SELECT
    s.staffid,
    stafffname,
    stafflname,
    ofsemester,
    COUNT(*) AS numberclasses,
    CASE
        WHEN COUNT(*) > 2 THEN
            'Overload'
        WHEN COUNT(*) = 2 THEN
            'Correct load'
        ELSE
            'Underload'
    END AS load
FROM
    uni.schedclass   c
    JOIN uni.staff        s ON s.staffid = c.staffid
WHERE
    to_char(ofyear, 'yyyy') = '2019'
GROUP BY
    s.staffid,
    stafffname,
    stafflname,
    ofsemester
ORDER BY
    numberclasses DESC, staffid, ofsemester;

-- 2

/* Using outer join */

SELECT
    u.unitcode,
    u.unitname
FROM
    uni.unit     u
    LEFT OUTER JOIN uni.prereq   p ON u.unitcode = p.unitcode
GROUP BY
    u.unitcode,
    u.unitname
HAVING
    COUNT(prerequnitcode) = 0
ORDER BY
    unitcode;

/* Using set operator MINUS */

SELECT
    u.unitcode,
    unitname
FROM
    uni.unit u
MINUS
SELECT
    u.unitcode,
    unitname
FROM
    uni.unit     u
    JOIN uni.prereq   p ON u.unitcode = p.unitcode
ORDER BY
    unitcode;

/* Using subquery */

SELECT
    unitcode,
    unitname
FROM
    uni.unit
WHERE
    unitcode NOT IN (
        SELECT
            unitcode
        FROM
            uni.prereq
    )
ORDER BY
    unitcode;

--3

SELECT
    unitcode,
    ofsemester,
    COUNT(stuid)                                                       AS no_of_enrolment,
    lpad(to_char(nvl(AVG(enrolmark), 0), '990.99'), 12, ' ') AS average_mark
FROM
    uni.offering
    LEFT OUTER JOIN uni.enrolment
    USING ( ofyear,
            ofsemester,
            unitcode )
WHERE
    EXTRACT(YEAR FROM ofyear) = 2019
GROUP BY
    unitcode,
    ofsemester
ORDER BY
    average_mark,
    ofsemester,
    unitcode;

--4

SELECT
    o.unitcode,
    unitname,
    stafffname
    || ' '
    || stafflname AS ce_name
FROM
    ( ( uni.offering    o
    LEFT OUTER JOIN uni.enrolment   e ON o.unitcode = e.unitcode
                                       AND o.ofyear = e.ofyear
                                       AND o.ofsemester = e.ofsemester )
    JOIN uni.staff       s ON s.staffid = o.staffid )
    JOIN uni.unit        u ON o.unitcode = u.unitcode
WHERE
    to_char(o.ofyear, 'yyyy') = '2019'
    AND o.ofsemester = 2
GROUP BY
    o.unitcode,
    unitname,
    stafffname
    || ' '
    || stafflname
HAVING
    COUNT(e.stuid) = 0
ORDER BY
    unitcode;

--5
SELECT
    stuid,
    stufname
    || ' '
    || stulname AS student_full_name
FROM
    uni.student
WHERE
    stuid IN (
        SELECT
            stuid
        FROM
            uni.enrolment
            NATURAL JOIN uni.unit
        WHERE
            lower(unitname) = lower('Introduction to databases')
            AND ofsemester = 1
            AND to_char(ofyear, 'yyyy') = '2020'
        INTERSECT
        SELECT
            stuid
        FROM
            uni.enrolment
            NATURAL JOIN uni.unit
        WHERE
            lower(unitname) = lower('Introduction to computer architecture and networks')
            AND ofsemester = 1
            AND to_char(ofyear, 'yyyy') = '2020'
    )
ORDER BY
    stuid;

--6
SELECT
    staffid,
    stafffname
    || ' '
    || stafflname AS staffname,
    'Lecture' AS type,
    COUNT(*) AS no_of_classes,
    SUM(clduration) AS total_hours,
    lpad(to_char(SUM(clduration) * 75.60, '$999.99'), 14, ' ') AS weekly_payment
FROM
    uni.schedclass
    NATURAL JOIN uni.staff
WHERE
    upper(cltype) = 'L'
    AND ofsemester = 1
    AND to_char(ofyear, 'yyyy') = '2020'
GROUP BY
    staffid,
    stafffname
    || ' '
    || stafflname
UNION
SELECT
    staffid,
    stafffname
    || ' '
    || stafflname AS staffname,
    'Tutorial' AS type,
    COUNT(*) AS no_of_classes,
    SUM(clduration) AS total_hours,
    lpad(to_char(SUM(clduration) * 42.85, '$999.99'), 14, ' ') AS weekly_payment
FROM
    uni.schedclass
    NATURAL JOIN uni.staff
WHERE
    upper(cltype) = 'T'
    AND ofsemester = 1
    AND to_char(ofyear, 'yyyy') = '2020'
GROUP BY
    staffid,
    stafffname
    || ' '
    || stafflname
ORDER BY
    staffid, type;
    
--7

SELECT DISTINCT
    s.staffid,
    stafffname
    || ' '
    || stafflname AS staffname,
    lpad(to_char(nvl((
        SELECT
            SUM(clduration) * 42.85
        FROM
            uni.schedclass sc1
        WHERE
            sc1.staffid = sc.staffid
            AND upper(cltype) = 'T'
            AND ofsemester = 1
            AND to_char(ofyear, 'yyyy') = '2020'
    ), 0), '$990.99'), 16, ' ') AS tutorial_payment,
    lpad(to_char(nvl((
        SELECT
            SUM(clduration) * 75.60
        FROM
            uni.schedclass sc1
        WHERE
            sc1.staffid = sc.staffid
            AND upper(cltype) = 'L'
            AND ofsemester = 1
            AND to_char(ofyear, 'yyyy') = '2020'
    ), 0), '$990.99'), 16, ' ') AS lecture_payment,
    lpad(to_char(nvl((
        SELECT
            SUM(clduration) * 75.60
        FROM
            uni.schedclass sc1
        WHERE
            sc1.staffid = sc.staffid
            AND upper(cltype) = 'L'
            AND ofsemester = 1
            AND to_char(ofyear, 'yyyy') = '2020'
    ), 0) + nvl((
        SELECT
            SUM(clduration) * 42.85
        FROM
            uni.schedclass sc1
        WHERE
            sc1.staffid = sc.staffid
            AND upper(cltype) = 'T'
            AND ofsemester = 1
            AND to_char(ofyear, 'yyyy') = '2020'
    ), 0), '$990.99'), 20, ' ') AS total_weekly_payment
FROM
    uni.schedclass   sc
    JOIN uni.staff        s ON sc.staffid = s.staffid
ORDER BY
    staffid;
    
--8


--Week 11 SQL Advanced

--Student ID: 29804655
--Student Name: Ransha Habarakada
--Unit Code: FIT2094
--Applied Class No: 02


SELECT
    stuid,
    rpad(stufname
         || ' '
         || stulname, 40, ' ') AS student_fullname,
    to_char(SUM(
        CASE
            WHEN enrolmark IS NOT NULL
                 AND substr(unitcode, 4, 1) = '1' THEN
                enrolmark * 3
            WHEN enrolmark IS NOT NULL
                 AND substr(unitcode, 4, 1) <> '1' THEN
                enrolmark * 6
        END
    ) / SUM(
        CASE
            WHEN enrolmark IS NOT NULL
                 AND substr(unitcode, 4, 1) = '1' THEN
                3
            WHEN enrolmark IS NOT NULL
                 AND substr(unitcode, 4, 1) <> '1' THEN
                6
        END
    ), '990.99') AS wam,
    to_char(SUM(
        CASE
            WHEN enrolmark IS NOT NULL
                 AND upper(enrolgrade) = 'N' THEN
                0.3
            WHEN enrolmark IS NOT NULL
                 AND upper(enrolgrade) = 'P' THEN
                1
            WHEN enrolmark IS NOT NULL
                 AND upper(enrolgrade) = 'C' THEN
                2
            WHEN enrolmark IS NOT NULL
                 AND upper(enrolgrade) = 'D' THEN
                3
            WHEN enrolmark IS NOT NULL
                 AND upper(enrolgrade) = 'HD' THEN
                4
        END
        * 6) /(COUNT(enrolmark) * 6), '990.99') AS gpa
FROM
    uni.enrolment
    NATURAL JOIN uni.student
GROUP BY
    stuid,
    rpad(stufname
         || ' '
         || stulname, 40, ' ')
ORDER BY
    wam DESC,
    gpa DESC,
    stuid;