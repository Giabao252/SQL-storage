/*
Bao Luu
CNIT 27200 Fall 2021
Lab Time: 9:30am Wednesday
Duration: 
********************************************************************************
Question 1
*/
SET LINESPACE 200;
SELECT USER, 
    ROUND(3859.5886, 1) AS round, 
    TRUNC(3859.5886, 2) AS truncate,
    FLOOR(3859.5886) AS floor,
    CEIL(3859.5886) AS ceiling
FROM DUAL;

/* Results:
USER                                                                                                                                  ROUND   TRUNCATE      FLOOR    CEILING
-------------------------------------------------------------------------------------------------------------------------------- ---------- ---------- ---------- ----------
LUUB                                                                                                                                 3859.6    3859.58       3859       3860
*/

/*Question 2*/
SELECT CUSTOMERID,
    CUSTFIRSTNAME || ' ' || CUSTLASTNAME AS CUSTOMER,
    EMAILADDR,
    NVL(CELLPHONE, '*Cell Missing*') AS CELLPHONE
FROM CUSTOMER
WHERE STATE = 'NY'
  AND (COMPANYNAME IS NOT NULL OR EMAILADDR LIKE '%outlook%');

/* Results:
CUSTOMERID CUSTOMER                             EMAILADDR                                          CELLPHONE     
---------- ------------------------------------ -------------------------------------------------- --------------
C-310005   Carl Tulain                          ctulain@guidestar.com                              507-762-9493  
C-310006   Davin Coleman                        davinc@allianz.com                                 507-543-1845  
C-310023   David Tarter                         estate@gmail.com                                   518-500-6159  
C-310039   Tim Leffert                          trailrent@comcast.net                              315-486-0683  
C-310053   Jeff Kowaiski                        equipit@live.com                                   212-492-9525  
C-310062   Doug Blizzard                        collectit@outlook.com                              518-646-2170  
I-310035   Tim Parker                           tparker22@outlook.com                              *Cell Missing*
I-310092   Trudi Antonio                        trudia67@outlook.com                               *Cell Missing*

8 rows selected. 
*/

/*Question 3*/
SELECT SUPPLIERID, 
    COUNT(*) AS PART_COUNT,
    MIN(UNITCOST) AS MINIMUM_UNITCOST,
    MAX(UNITCOST) AS MAXIMUM_UNITCOST,
    ROUND(AVG(UNITCOST), 2) AS AVERAGE_UNITCOST
FROM SUPPLIEDPART
WHERE PARTNUMBER LIKE 'M%' OR PARTNUMBER LIKE 'P%'
GROUP BY SUPPLIERID;

/* Results:
SUPPLIERID PART_COUNT MINIMUM_UNITCOST MAXIMUM_UNITCOST AVERAGE_UNITCOST
---------- ---------- ---------------- ---------------- ----------------
C-455               4            23.44           257.44           135.55
CA-103              3            23.44          1179.25           554.48
CCS-106             2           431.94          1689.85           1060.9
CF-450              1           459.25           459.25           459.25
DCI-450             2           233.97           239.79           236.88
DE-450              2           525.82          4697.44          2611.63
GC-450              8            45.67          2699.85           962.52
JLI-450             1          3322.65          3322.65          3322.65
LL-455              2             75.8           8275.8           4175.8
MC-455              8            235.8           7195.8           1641.4
MM-103              2           149.95           215.96           182.96

SUPPLIERID PART_COUNT MINIMUM_UNITCOST MAXIMUM_UNITCOST AVERAGE_UNITCOST
---------- ---------- ---------------- ---------------- ----------------
MM-104              2            239.4          2429.85          1334.63
MSN-105             2           134.85            535.8           335.33
MY-450              4            83.99            322.4           180.44
NA-450              2           125.97            419.4           272.69
OI-450              4            95.99           239.46           155.19
PA-384              3           167.22           285.56           245.55
PA-450              3             52.4            239.4           127.07
PP-103              4            229.4           6115.8          2112.14
RC-450              1           4199.8           4199.8           4199.8
SS-455              4           289.85          2339.55           1313.3
TA-144              3            179.4          1619.85           778.24

SUPPLIERID PART_COUNT MINIMUM_UNITCOST MAXIMUM_UNITCOST AVERAGE_UNITCOST
---------- ---------- ---------------- ---------------- ----------------
WE-450              2          2266.85           5122.8          3694.83

23 rows selected. 
*/

/*Question 4*/
SELECT SUPPLIERID, 
    COUNT(*) AS PART_COUNT,
    MIN(UNITCOST) AS MINIMUM_UNITCOST,
    MAX(UNITCOST) AS MAXIMUM_UNITCOST,
    ROUND(AVG(UNITCOST), 2) AS AVERAGE_UNITCOST
FROM SUPPLIEDPART
WHERE PARTNUMBER LIKE 'M%' OR PARTNUMBER LIKE 'P%' 
GROUP BY SUPPLIERID
HAVING COUNT(*) > 5; /*filters after grouping*/

/* Results:
SUPPLIERID PART_COUNT MINIMUM_UNITCOST MAXIMUM_UNITCOST AVERAGE_UNITCOST
---------- ---------- ---------------- ---------------- ----------------
GC-450              8            45.67          2699.85           962.52
MC-455              8            235.8           7195.8           1641.4
*/

/*Question 5*/
SELECT SUBSTR(PARTNUMBER, 1, 3) AS PARSED_PARTNUMBER,
    OPERATIONSTEP, 
    COUNT(*) AS PARTCOUNT
FROM OPERATION
WHERE OPERATIONSTEP IN ('BOX', 'WRAP', 'SEAL')
GROUP BY SUBSTR(PARTNUMBER, 1, 3), OPERATIONSTEP
HAVING COUNT(*) > 10
ORDER BY SUBSTR(PARTNUMBER, 1, 3);

/*Results:
PAR OPERATIONS  PARTCOUNT
--- ---------- ----------
BRK BOX                11
BRK SEAL               11
BRK WRAP               11
CAB BOX                28
CAB SEAL               28
CAB WRAP               28
CTR BOX                29
CTR SEAL               29
CTR WRAP               29
MEM BOX                12
MEM SEAL               12

PAR OPERATIONS  PARTCOUNT
--- ---------- ----------
MEM WRAP               12
MIC BOX                12
MIC SEAL               12
MIC WRAP               12

15 rows selected. 
*/

/*Question 6*/
SELECT EMPLOYEEID, SUPPLIERID, DATEORDERED, DATEDELIVERED
FROM PURCHASEORDER
WHERE DATEDELIVERED = (SELECT MAX(DATEDELIVERED) FROM PURCHASEORDER);

/* Results:
EMPLOYEEID SUPPLIERID DATEORDER DATEDELIV
---------- ---------- --------- ---------
250892     CA-105     03-SEP-20 14-SEP-20
250880     MSN-105    10-SEP-20 14-SEP-20
*/

/*Question 7*/
SELECT PARTNUMBER,
    RPAD(LOWER(PARTDESCRIPTION), 30, '*'), 
    CATEGORYID, 
    WEIGHT, 
    STOCKPRICE,
    ROUND((SELECT AVG(STOCKPRICE) FROM INVENTORYPART), 2) AS AVG_STOCKPRICE
FROM INVENTORYPART
WHERE STOCKLEVEL < REORDERLEVEL 
    AND STOCKPRICE < (SELECT AVG(STOCKPRICE) FROM INVENTORYPART);
/* Results:
PARTNUMBER RPAD(LOWER(PARTDESCRIPTION),30 CATEGORYID     WEIGHT STOCKPRICE ROUND((SELECTAVG(STOCKPRICE)FROMINVENTORYPART),2)
---------- ------------------------------ ---------- ---------- ---------- -------------------------------------------------
BRK-010    3 1/2in mounting kit********** CBL                .5       2.99                                            222.85
CAB-027    16ft hdmi to dvid cable*******                     1      25.99                                            222.85
CRD-009    4gb 128 bit ddr3 pci hdcp read                  .438     119.99                                            222.85
MIC-005    wired optical mouse*********** BASE             1.25      17.97                                            222.85
MOD-003    surfboard modem*************** NET                .5     121.99                                            222.85
MOM-004    raspberry pi****************** BASE                6      65.99                                            222.85
POW-002    6in y internal power adapter 3 CBL              .188       1.19                                            222.85
PS-001     750 watt power supply********* POW                 3      59.97                                            222.85
SFT-003    home attorney software******** SFTW              .25       6.99                                            222.85
SFT-007    internet security************* SFTW            1.375       5.99                                            222.85
SP-003     dual serial single parallel ec                   .75      41.97                                            222.85

PARTNUMBER RPAD(LOWER(PARTDESCRIPTION),30 CATEGORYID     WEIGHT STOCKPRICE ROUND((SELECTAVG(STOCKPRICE)FROMINVENTORYPART),2)
---------- ------------------------------ ---------- ---------- ---------- -------------------------------------------------
CS-001     security camera*************** HOME             2.75      55.97                                            222.85
CS-002     internet security************* HOME            10.75     199.97                                            222.85
CS-003     pc lock*********************** HOME             1.75      21.67                                            222.85

14 rows selected. 
*/

/*Question 8*/
SELECT FIRSTNAME || ' ' || LASTNAME AS EMPLOYEE_NAME, 
        TO_CHAR(SALARYWAGE, '$999,999.99') AS FORMATTED_SALARYWAGE,
        HIREDATE,
        BIRTHDATE, 
        TRUNC(MONTHS_BETWEEN(HIREDATE, BIRTHDATE) / 12) AS HIRED_AGE
FROM EMPLOYEE
WHERE TRUNC(MONTHS_BETWEEN(HIREDATE, BIRTHDATE) / 12) > 30
ORDER BY HIRED_AGE;
/* Results:
EMPLOYEE_NAME                        FORMATTED_SA HIREDATE  BIRTHDATE  HIRED_AGE
------------------------------------ ------------ --------- --------- ----------
Maria Guiomar                         $115,600.00 01-DEC-11 01-DEC-79         32
Rita Gomez                             $85,700.00 30-JAN-12 01-APR-77         34
Laura Rodgers                              $23.95 05-MAY-15 02-JUN-80         34
Kayla Underwood                            $24.45 10-OCT-17 03-SEP-82         35
Kristen Gustavel                       $78,800.00 10-SEP-15 06-OCT-76         38
*/

/*Question 9a*/
SELECT STATUS, 
    COUNT(*) AS ORDER_COUNT,
    ROUND(SUM(ORDERQUANTITY*UNITPRICE), 2) AS SUBTOTAL
FROM CUSTORDERLINE
GROUP BY STATUS;
/* Results:
STATUS          ORDER_COUNT   SUBTOTAL
--------------- ----------- ----------
PENDING                  43   38171.03
PART SHIP                 3   21076.67
PACKED                    8    4973.04
SHIPPED                2225  2974080.4
PICKED                   13   10984.79
*/

/*Question 9b*/
SELECT UNITPRICE,
    ORDERQUANTITY,
    UNITPRICE*ORDERQUANTITY AS ORDER_SUBTOTAL,
    ORDERID
FROM CUSTORDERLINE
WHERE STATUS = 'PACKED';

/*Results: 
 UNITPRICE ORDERQUANTITY ORDER_SUBTOTAL ORDERID   
---------- ------------- -------------- ----------
     12.99             1          12.99 3001000667
     69.99             1          69.99 3001000667
     31.95             3          95.85 3001000703
      5.99             1           5.99 3001000703
     44.99             2          89.98 3001000703
     14.99            29         434.71 3001000797
   1856.79             2        3713.58 3001000810
    109.99             5         549.95 3001000810

8 rows selected. 
*/

/*Question 9c*/
SELECT STATUS, 
    COUNT(*) AS ORDER_COUNT,
    ROUND(SUM(ORDERQUANTITY*UNITPRICE), 2) AS SUBTOTAL
FROM CUSTORDERLINE
HAVING ROUND(SUM(ORDERQUANTITY*UNITPRICE), 2) <= 30000
GROUP BY STATUS;

/*Results: 
STATUS          ORDER_COUNT   SUBTOTAL
--------------- ----------- ----------
PART SHIP                 3   21076.67
PACKED                    8    4973.04
PICKED                   13   10984.79
*/

/*Question 10a*/
SELECT SYSDATE AS DEFAULT_DATE, 
    TO_CHAR(SYSDATE, 'Month DD, YYYY') AS FORMATTED_DATE
FROM DUAL;
/* Results:
DEFAULT_D FORMATTED_DATE    
--------- ------------------
24-FEB-26 February  24, 2026
*/

/*Question 10b*/
SELECT SYSDATE AS DEFAULT_DATE,
    TO_CHAR(SYSDATE, 'Day') AS DAY_OF_WEEK
FROM DUAL;
/* Results:
DEFAULT_D DAY_OF_WE
--------- ---------
24-FEB-26 Tuesday  
*/

/*Question 10c*/
SELECT USER AS USERNAME, 
    TO_CHAR(TO_DATE('02-25-2004', 'mm-dd-yyyy'), 'Day') AS BIRTH_DAY
FROM DUAL;
/*Results:
USERNAME                                                                                                                         BIRTH_DAY
-------------------------------------------------------------------------------------------------------------------------------- ---------
LUUB                                                                                                                             Wednesday
*/

/*Question 11: Row functions alwayss operate on only one row at a time while column functions summarize data in an entire column in the table.*/

/* Question 12:  a nested subquery is a query inside another query. The inner query runs first and passes its result to the outer query

Example: 
SELECT EmployeeName
FROM Employee
WHERE HireDate = (SELECT MAX(HireDate) FROM Employee);

The inner query SELECT MAX(HireDate) finds the most recent date, then the outer query uses that result to find who matches it. Swap MAX for MIN to find the oldest hire date instead
*/

/*Question 13: WHERE filters rows before grouping/aggregating while HAVING filters after grouping on aggregated results*/
/*Question 14: Aggregate functions (COUNT, SUM, AVG, MIN, MAX) collapse multiple rows into a single value. We need GROUP BY whenever we need that calculation per group rather than across the whole table */
/*Question 15: TO_DATE converts a string to date while TO_CHAR converts a date to string*/

