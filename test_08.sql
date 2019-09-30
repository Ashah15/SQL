-- 1) List the teachers who have NULL for their department.

-- answer:
SELECT name FROM teacher
WHERE dept IS NULL;

-- 2) Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

-- answer:
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id)

-- 3) Use a different JOIN so that all teachers are listed.

-- answer:
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id)

-- 4) Use a different JOIN so that all departments are listed.

-- answer:
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id)

-- 5) Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. 
--    Show teacher name and mobile number or '07986 444 2266'

-- answer:
SELECT teacher.name, COALESCE(mobile, '07986 444 2266')
FROM teacher

-- 6) Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 
--    'None' where there is no department.

-- answer:
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON
teacher.dept = dept.id

-- 7) Use COUNT to show the number of teachers and the number of mobile phones.

-- answer:
SELECT COUNT(teacher.name), COUNT(mobile) FROM teacher;

-- 8) Use COUNT and GROUP BY dept.name to show each department and the number of staff. 
--    Use a RIGHT JOIN to ensure that the Engineering department is listed.

-- answer:
SELECT dept.name, COUNT(teacher.name) FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name, teacher.dept;

-- 9) Use CASE to show the name of each teacher followed by 'Sci' if the teacher 
--    is in dept 1 or 2 and 'Art' otherwise.

-- answer:
SELECT name,
CASE WHEN dept = 1 THEN 'Sci'
WHEN dept = 2 THEN 'Sci'
ELSE 'Art' END
FROM teacher;

-- 10) Use CASE to show the name of each teacher followed by 'Sci' if the teacher 
--     is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

-- answer:
SELECT name,
CASE WHEN dept = 1 THEN 'Sci'
WHEN dept = 2 THEN 'Sci'
WHEN dept = 3 THEN 'Art'
ELSE 'None' END
FROM teacher;


-- Quiz

-- 1) Select the code which uses an outer join correctly.

-- answer:
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

-- 2) Select the correct statement that shows the name of department which employs Cutflower -

-- answer:
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

-- 3) Select out of following the code which uses a JOIN to show a list of all the departments 
--    and number of employed teachers

-- answer:
SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

-- 4) Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:

-- answer:
-- display 0 in result column for all teachers without department

-- 5) Query:
        SELECT name,
            CASE WHEN phone = 2752 THEN 'two'
                    WHEN phone = 2753 THEN 'three'
                    WHEN phone = 2754 THEN 'four'
                    END AS digit
        FROM teacher
-- shows following 'digit': 

-- answer:
-- 'four' for Throd

-- 6) Select the result that would be obtained from the following code:
        SELECT name, 
            CASE 
            WHEN dept 
                IN (1) 
                THEN 'Computing' 
            ELSE 'Other' 
            END 
        FROM teacher

-- answer:
/* Table-A
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other */