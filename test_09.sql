-- 1) How many stops are in the database.

-- answer:
SELECT COUNT(*) FROM stops

-- 2) Find the id value for the stop 'Craiglockhart'

-- answer:
SELECT id FROM stops
WHERE name = 'Craiglockhart';

-- 3) Give the id and the name for the stops on the '4' 'LRT' service.

-- answer:
SELECT id, name FROM stops JOIN route ON
id = stop WHERE company = 'LRT' and num = 4;

-- 4) Add a HAVING clause to restrict the output to these two routes.

-- answer:
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) > 1

-- 5) Change the query so that it shows the services from Craiglockhart to London Road.

-- answer:
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149

-- 6) Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.

-- answer:
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'London Road';

-- 7) Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')

-- answer:
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket'
AND stopb.name = 'Leith';

-- 8) Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

-- answer:
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'Tollcross';

-- 9) Give a distinct list of the stops which may be reached from 'Craiglockhart' by 
--    taking one bus, including 'Craiglockhart' itself, offered by the LRT company. 
--    Include the company and bus no. of the relevant services.

-- answer:
SELECT stopa.name, a.company, a.num
FROM route a
  JOIN route b ON (a.num=b.num AND a.company=b.company)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopb.name = 'Craiglockhart'

-- 10) Find the routes involving two buses that can go from Craiglockhart to Lochend.
--     Show the bus no. and company for the first bus, the name of the stop for the transfer,
--     and the bus no. and company for the second bus.

-- answer:
/* SELECT DISTINCT a.num, a.company, stopb.name ,  c.num,  c.company
FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num)
JOIN ( route c JOIN route d ON (c.company = d.company AND c.num= d.num))
JOIN stops stopa ON (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
JOIN stops stopc ON (c.stop = stopc.id)
JOIN stops stopd ON (d.stop = stopd.id)
WHERE  stopa.name = 'Craiglockhart' AND stopd.name = 'Lochend'
            AND  stopb.name = stopc.name
ORDER BY LENGTH(a.num), b.num, stopb.id, LENGTH(c.num), d.num */

-----------------------------------------------------------------------------------------------------------------------


-- Quiz

-- 1) Select the code that would show it is possible to get from Craiglockhart to Haymarket

-- answer:
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

-- 2) Select the code that shows the stops that are on route.num '2A' 
--    which can be reached with one bus from Haymarket?

-- answer:
SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'

-- 3) Select the code that shows the services available from Tollcross?

-- answer:
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross'
