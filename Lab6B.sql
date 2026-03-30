/*
Bao Luu
CNIT 27200 Spring 2026
Lab time: 9:30-11:30am Wednesday
Duration: 2 hours
********************************************************************************
Question 1
*/

SELECT M.MACHINEID, M.MANUFACTURERNAME, M.MAKE, M.MODEL
FROM MACHINE M LEFT JOIN MACHINEPROCESS MP
ON M.MACHINEID = MP.MACHINEID
WHERE PROCESSID IS NULL;

/* RESULTS:
MACHINEID  MANUFACTURERNAME          MAKE                      MODEL                    
---------- ------------------------- ------------------------- -------------------------
CONVEY     NORTHWEST CONVEYER        LINESHAFT CONVEYOR        STAINLESS STEEL          
RFID       READY ONE RFID            RFID SYSTEM               ZR33D0                   
*/

/* Question 2 */

SELECT E.EMPLOYEEID, E.LASTNAME, E.JOBTITLE, E.HIREDATE, MIN(P.SHIPPEDDATE) AS MINSHIPPEDDATE
FROM EMPLOYEE E LEFT JOIN PACKINGSLIP P
ON E.EMPLOYEEID = P.EMPLOYEEID
GROUP BY E.EMPLOYEEID, E.LASTNAME, E.JOBTITLE, E.HIREDATE
ORDER BY E.EMPLOYEEID;

/* RESULTS:
EMPLOYEEID LASTNAME             JOBTITLE                            HIREDATE  MINSHIPPE
---------- -------------------- ----------------------------------- --------- ---------
250001     Thompson             Chief Financial Officer             12-JUN-01          
250101     Rosner               Assembly                            04-APR-05 25-FEB-19
250103     Gomez                VP Operations                       30-JAN-12          
250104     Blair                Engineer                            25-JAN-12          
250106     Loreto               Programmer Analyst                  04-APR-13          
250112     Hickman              Programmer Analyst                  01-FEB-15          
250120     Nairn                Assembly                            04-APR-11 05-JUL-19
250125     Stevens              Chief Information Officer           01-FEB-15          
250127     Watson               Operations Officer                  07-JAN-18          
250200     Hernandez            Engineer                            13-OCT-08          
250204     Vigus                Assembly                            04-APR-03 25-FEB-19

EMPLOYEEID LASTNAME             JOBTITLE                            HIREDATE  MINSHIPPE
---------- -------------------- ----------------------------------- --------- ---------
250206     Guiomar              VP Finance                          01-DEC-11          
250209     Reyes                Engineer                            09-JAN-11          
250220     Gomez                Accountant                          11-NOV-05          
250330     Gustavel             Operations Officer                  10-SEP-15          
250365     Zollman              President                           20-JAN-13          
250399     Day                  Assembly                            04-MAY-11 20-SEP-19
250475     Hess                 Assembly                            04-APR-03          
250488     Osman                Programmer Analyst                  03-JAN-10          
250550     Roland               Assembly                            04-APR-14 06-JUL-19
250559     Romilda              Engineer                            03-JAN-13          
250600     Winters              Sales                               04-APR-11          

EMPLOYEEID LASTNAME             JOBTITLE                            HIREDATE  MINSHIPPE
---------- -------------------- ----------------------------------- --------- ---------
250650     Lilley               VP Information                      25-NOV-08          
250700     Jones                DBA                                 03-JAN-12          
250880     Goldwear             Chief Sales Officer                 18-JUN-15          
250892     Platt                Assembly                            04-APR-13 06-JUL-19
250944     Thompson             Engineer                            20-JUN-05          
250967     Daniels              Assembly                            25-FEB-12 20-MAR-19
250989     Deagen               Assembly                            04-JAN-06 13-JUL-19
251007     Krastner             Sales                               06-JUN-08          
251030     Moore                Assembly                            06-JUN-12          
251045     Meyer                Assembly                            06-JUN-19 05-JUL-19
251066     Rodgers              Sales                               05-MAY-15          

EMPLOYEEID LASTNAME             JOBTITLE                            HIREDATE  MINSHIPPE
---------- -------------------- ----------------------------------- --------- ---------
251088     Underwood            Assembly                            10-OCT-17 13-JUL-19
251089     Alvarez              Assembly                            23-JUL-15          
251097     Trale                Assembly                            26-SEP-10 07-JUL-19
251115     Cochran              Assembly                            17-JUN-13          
251135     Gostler              Assembly                            06-JUN-14          
251154     Hettinger            Assembly                            25-JAN-02 07-JUL-19
251166     Sidney               Assembly                            25-JUN-10 08-JUL-19
251167     Natlen               Sales                               25-JAN-15 08-MAR-20
251175     Darby                Assembly                            14-APR-19          

42 rows selected. 
*/

/* Question 3 */

SELECT IP.PARTNUMBER, IP.CATEGORYID, C.CATEGORYNAME, IP.STOCKPRICE, IP.STOCKLEVEL
FROM INVENTORYPART IP LEFT JOIN CATEGORY C
ON IP.CATEGORYID = C.CATEGORYID
WHERE IP.STOCKLEVEL > 15 AND IP.STOCKPRICE > (
    SELECT AVG(IP2.STOCKPRICE)
    FROM INVENTORYPART IP2 INNER JOIN CATEGORY C2
    ON IP2.CATEGORYID = C2.CATEGORYID
    WHERE C2.CATEGORYID = 'NET'
);

/* RESULTS:

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
ADT-002    CBL        Cables                              63.88         30
ADT-007    CBL        Cables                              74.88         45
BB-003     BASE       Basics                             317.99         22
BB-005     BASE       Basics                             211.99         30
BRK-004    CBL        Cables                              62.79         55
C-001      BASE       Basics                              70.97         23
CD-003     STOR       Storage                            171.99         18
CRD-001                                                   89.99         60
CRD-003                                                   59.99         60
DVD-002    STOR       Storage                             95.99         27
MEM-001    STOR       Storage                            155.97         25

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
MEM-004    STOR       Storage                            161.99         18
MEM-007    STOR       Storage                             63.99         27
MEM-012    STOR       Storage                             99.99         36
MOM-001    BASE       Basics                              59.93         45
MOM-002    BASE       Basics                              95.99         55
MOM-003    BASE       Basics                              83.99         30
P-001      PROC       Processors                         209.99         30
P-002      PROC       Processors                         239.99         30
P-003      PROC       Processors                         257.99         30
P-004      PROC       Processors                         275.99         45
P-005      PROC       Processors                         239.99         45

PARTNUMBER CATEGORYID CATEGORYNAME                   STOCKPRICE STOCKLEVEL
---------- ---------- ------------------------------ ---------- ----------
P-006      PROC       Processors                         203.99         45
P-007      PROC       Processors                         460.79         30
P-008      PROC       Processors                         119.99         22
P-009      PROC       Processors                         161.99         22
P-010      PROC       Processors                         179.99         22

27 rows selected. 
*/

/* QUESTION 4 */

SELECT EMPLOYEEID
FROM EMPLOYEE
MINUS 
SELECT EMPLOYEEID
FROM PACKINGSLIP;

/* RESULTS:
EMPLOYEEID
----------
250001
250103
250104
250106
250112
250125
250127
250200
250206
250209
250220

EMPLOYEEID
----------
250330
250365
250475
250488
250559
250600
250650
250700
250880
250944
251007

EMPLOYEEID
----------
251030
251066
251089
251115
251135
251175

28 rows selected. 
*/

/* Question 5 */

SELECT SUBSTR(PHONE, 1, 3) AS AREA_CODE
FROM SUPPLIER
INTERSECT
SELECT SUBSTR(PHONE, 1, 3)
FROM CUSTOMER
INTERSECT
SELECT SUBSTR(HOMEPHONE, 1, 3)
FROM EMPLOYEE;

/* Results: 
ARE
---
860
*/

/* Question 6 */
SELECT FIRSTNAME || ' ' || LASTNAME AS FULLNAME, EMAILADDR, HIREDATE, BIRTHDATE, TO_CHAR(HIREDATE, 'MONTH') AS HIRE_BIRTHDATE
FROM EMPLOYEE
INTERSECT
SELECT 
    FIRSTNAME || ' ' || LASTNAME AS FULLNAME,
    EMAILADDR,
    HIREDATE,
    BIRTHDATE,
    TO_CHAR(HIREDATE, 'MONTH')
FROM EMPLOYEE
WHERE TO_CHAR(HIREDATE, 'MM') = TO_CHAR(BIRTHDATE, 'MM');

/* RESULTS:
FULLNAME                             EMAILADDR                                          HIREDATE  BIRTHDATE HIRE_BIRT
------------------------------------ -------------------------------------------------- --------- --------- ---------
Allison Roland                                                                          04-APR-14 08-APR-88 APRIL    
David Gostler                                                                           06-JUN-14 04-JUN-84 JUNE     
Gregory Hettinger                                                                       25-JAN-02 20-JAN-84 JANUARY  
Malik Krastner                       mkrastner@pencomp.com                              06-JUN-08 08-JUN-85 JUNE     
Maria Guiomar                        mguiomar@pencomp.com                               01-DEC-11 01-DEC-79 DECEMBER 
Melissa Alvarez                                                                         23-JUL-15 17-JUL-85 JULY     
Rosario Gomez                        rgomez@pencomp.com                                 11-NOV-05 20-NOV-90 NOVEMBER 
Ryan Thompson                        rthompson@pencomp.com                              20-JUN-05 20-JUN-86 JUNE     
Shannon Darby                                                                           14-APR-19 14-APR-93 APRIL    
Steve Cochran                                                                           17-JUN-13 03-JUN-90 JUNE     

10 rows selected. 

*/

/* Question 7 */

SELECT PARTNUMBER, STATUS, COUNT(*) AS COUNT
FROM CUSTORDERLINE
WHERE SUBSTR(PARTNUMBER, 1, 3) = 'KEY'
GROUP BY PARTNUMBER, STATUS
UNION
SELECT PARTNUMBER, ECNUMBER, COUNT(*) AS COUNT
FROM OPERATION
WHERE SUBSTR(PARTNUMBER, 1, 3) = 'KEY'
GROUP BY PARTNUMBER, ECNUMBER;

/* Results:
PARTNUMBER STATUS               COUNT
---------- --------------- ----------
KEY-001    PACK-009                 7
KEY-001    PENDING                  1
KEY-001    PICKED                   1
KEY-001    SHIPPED                  4
KEY-002    PACK-009                 7
KEY-002    SHIPPED                  7
KEY-003    PACK-009                 7
KEY-003    SHIPPED                  6
KEY-004    PACK-009                 7
KEY-004    SHIPPED                  4
KEY-005    PACK-009                 7

PARTNUMBER STATUS               COUNT
---------- --------------- ----------
KEY-005    SHIPPED                  5
KEY-006    PACK-009                 7
KEY-006    SHIPPED                 13
KEY-007    PACK-009                 7
KEY-007    SHIPPED                 10
KEY-008    PACK-009                 7
KEY-008    SHIPPED                 14
KEY-009    PACK-009                 7
KEY-009    PACKED                   1
KEY-009    SHIPPED                  8

21 rows selected. 

*/

/* Question 8 */
SELECT SH.SHIPNAME, SH.SHIPADDRESS, SH.SHIPCITY, SH.SHIPSTATE
FROM SHIPMENT SH INNER JOIN SHIPPER SP ON SH.SHIPPERID = SP.SHIPPERID
WHERE SP.SHIPPERNAME = 'Federal Express'
AND SH.SHIPSTATE = 'NY'
UNION
SELECT COMPANYNAME, ADDRESS, CITY, STATE
FROM CUSTOMER
WHERE COMPANYNAME IS NOT NULL
AND STATE = 'IL';
/* RESULTS:
SHIPNAME                                 SHIPADDRESS                              SHIPCITY             SH
---------------------------------------- ---------------------------------------- -------------------- --
Apartment Referrals                      555 W. Liberty Ave.                      Chicago              IL
Bankruptcy Help                          5991 Kenwood Rd.                         Chicago              IL
Jack Illingworth                         2741 Ashland Ave.                        Buffalo              NY
Kevin Zubarev                            5933 Valley St.                          Syracuse             NY
Lucille Appleton                         5260 Blue Mound Rd.                      Newburgh             NY
Tim Leffert                              2765 Independence Ave.                   Rome                 NY

6 rows selected. 
*/

/* Question 9 */
SELECT PARTNUMBER
FROM INVENTORYPART
MINUS
SELECT PARTNUMBER
FROM CUSTORDERLINE;

/* RESULTS:
PARTNUMBER
----------
ADT-002
BRK-006
C-004
CAB-002
CAB-004
CAB-014
CAB-019
CAB-024
CS-001
CS-002
CS-003

PARTNUMBER
----------
CTR-010
CTR-020
POW-001
PRT-005
SCN-003
SFT-009

17 rows selected. 

*/

/* Question 10 */
SELECT ORDERID, ORDERDATE, CUSTOMERID
FROM CUSTORDER
WHERE ORDERDATE IN (
    SELECT MIN(ORDERDATE)
    FROM CUSTORDER
    UNION
    SELECT MAX(ORDERDATE)
    FROM CUSTORDER
);

/* Results:
ORDERID    ORDERDATE CUSTOMERID
---------- --------- ----------
3000000001 01-JUL-19 I-310001  
3000000002 01-JUL-19 C-310008  
3000000003 01-JUL-19 I-310002  
3000000004 01-JUL-19 I-310003  
3001000813 02-APR-20 I-310150  
3001000814 02-APR-20 C-310065  
3001000815 02-APR-20 I-310155  
3001000816 02-APR-20 I-310010  
3001000817 02-APR-20 C-310043  

9 rows selected. 
*/

/* Question 11: Inner join of A and B gives the result of A intersect B while Outer Join of A and B gives the results of A union B */

/* Question 12: Left join returns all rows from the left table with matches from the right. Right join returns all rows from the right table and matches from the left. Both will fill in NULLs for missing left side matches. */

/* Question 13: When we add more attributes to both SELECT clauses in an INTERSECT, the operation becomes stricter — a row only appears in the result if every single column value matches exactly between both queries. The more attributes you add, the harder it is for rows to match, so the result set typically shrinks. INTERSECT requires both SELECT clauses to have the same number of columns with compatible data types. */

/* Question 14: UNION combines the results of two queries into one result set and automatically removes duplicates — UNION ALL keeps them. Unlike joins, UNION is not constrained by relationships between tables. */

/* Question 15: MINUS returns rows from the first query that do not appear in the second query. Yes, order absolutely matters — flipping the queries gives us a completely different result because we are now subtracting the opposite set. 
