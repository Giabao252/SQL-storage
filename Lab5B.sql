/*
Bao Luu
CNIT 27200 Spring 2026
Lab time: 9:30-11:30am Wednesday
Duration: 2 hours
********************************************************************************
Question 1
*/
SELECT PARTNUMBER, PARTDESCRIPTION, STOCKPRICE, STOCKLEVEL, EOQ
FROM INVENTORYPART
WHERE PARTNUMBER NOT IN (
    SELECT PARTNUMBER
    FROM CUSTORDERLINE
)
ORDER BY STOCKPRICE;
/* Results:
PARTNUMBER PARTDESCRIPTION                                    STOCKPRICE STOCKLEVEL        EOQ
---------- -------------------------------------------------- ---------- ---------- ----------
POW-001    P819 POWER EXTENSION CABLE SET                           4.17         23         15
SFT-009    DESKTOP PUBLISHER                                        5.99         15         10
CAB-019    12FT USB A MALE TO B MALE PRINTER CABLE                  7.99         45         30
CAB-004    10FT USB HUB EXTENSION CABLE                             8.79         35         25
BRK-006    BLANK BRACKET                                           11.79         75         45
CAB-014    25FT HDMI AND MINI DVI TO HDMI ADAPTER                  20.99         55         35
CAB-002    6FT MONITOR CABLE                                       21.19         35         25
CS-003     PC LOCK                                                 21.67          4          4
C-004      LAPTOP PLASTIC CASE                                     21.93         10         10
CAB-024    DVID CABLE LENOVO TO SINGLE DVID                        29.99         30         20
CS-001     SECURITY CAMERA                                         55.97          4          8

PARTNUMBER PARTDESCRIPTION                                    STOCKPRICE STOCKLEVEL        EOQ
---------- -------------------------------------------------- ---------- ---------- ----------
ADT-002    THUNDERBOLT 3 TO 2 ADAPTER                              63.88         30         20
PRT-005    COLOR INKJET PRINTER                                     89.4          9          6
CS-002     INTERNET SECURITY                                      199.97          4          3
SCN-003    SCANJET PROFESSIONAL SERIES COLOR SCANNER               239.4         15         10
CTR-020    FLY XPSB                                              1218.15          3          1
CTR-010    Basic ATHLON II                                       1399.67          3          1

17 rows selected. 
*/

/*Question 2 */
col total format $999.99;
SELECT I.CATEGORYID, I.PARTNUMBER, I.PARTDESCRIPTION, C.UNITPRICE, C.ORDERQUANTITY, I.WEIGHT
FROM INVENTORYPART I INNER JOIN CUSTORDERLINE C
ON I.PARTNUMBER = C.PARTNUMBER
WHERE C.STATUS = 'PENDING' AND UNITPRICE < 100;
/* RESULTS:
CATEGORYID PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY     WEIGHT
---------- ---------- -------------------------------------------------- ---------- ------------- ----------
PROC       CF-009     CPU COOLING FAN FOR HP                                   5.95             1         .5
BASE       MOM-001    X370 ATX MOTHERBOARD                                    99.88             1          5
CBL        BRK-004    MOUNT IR MICROSENSOR                                     7.99             2       .375
           CAB-028    3FT DVID TO DVID MALE TO MALE                           31.95             2         .5
SFTW       SFT-006    CARD GAMES                                               9.99             6       .313
           CRD-008    2GB 64 BIT GDDR5 PCI EXPRESS                            39.99             8       .375
BASE       MIC-001    RGB TUNABLE GAMING MOUSE                                69.95            12      1.188
BASE       MIC-009    OPTICAL PURPLE LED 6 MOUSE                               29.5            15       1.25
ACS        PRT-006    SINGLEHEAD THERMAL INKJET PRINTER                          99             4          9
BASE       C-003      MINI TOWER CASE                                         69.95             1        2.5
PROC       CF-001     HIGH AIRFLOW FAN TWIN PACK                              32.95             1         .5

CATEGORYID PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY     WEIGHT
---------- ---------- -------------------------------------------------- ---------- ------------- ----------
KEY        KEY-001    NATURAL KEYBOARD PRO                                    68.95            30          2
BASE       MIC-004    WIRELESS OPTICAL MOUSE                                  37.95            12       .188
NET        MOD-002    CABLE MODEM                                             87.99            16        .75
           CAB-012    12FT WHITE MINI DVI TO FEMALE MINI DVI                  14.99             3       .813
CBL        ICAB-005   MOTHERBOARD 20 PIN F TO 2 USB3 F                        12.99             5       .438
CBL        BRK-002    1X4 USB CABLE AND BRACKET                                8.99             5       .375
           CAB-027    16FT HDMI TO DVID CABLE                                 44.79             3          1
           CRD-004    2GB RADEON R5 230 VIDEO CARD                            89.99             2       .313
SFTW       SFT-001    ANTIVIRUS SOFTWARE                                       7.99             2       .188
SFTW       SFT-002    HOME FINANCE SOFTWARE                                    8.85             1      1.375
SFTW       SFT-004    HOME AND GARDEN                                          8.49             1       .313

CATEGORYID PARTNUMBER PARTDESCRIPTION                                     UNITPRICE ORDERQUANTITY     WEIGHT
---------- ---------- -------------------------------------------------- ---------- ------------- ----------
SFTW       SFT-007    INTERNET SECURITY                                        8.49             2      1.375
SFTW       SFT-008    PHOTO EDITING                                            6.99             1        .25

24 rows selected. 
*/

/* Question 3A */

SELECT PO.DATEDELIVERED, 
    MAX(POL.ORDEREDUNITCOST) AS MAX_COST, 
    MIN(POL.ORDEREDUNITCOST) AS MIN_COST, 
    AVG(POL.ORDEREDUNITCOST) AS AVG_COST, 
    COUNT(POL.UNITQUANTITY) AS UNITS_COUNTED
FROM PURCHASEORDER PO INNER JOIN PURCHORDERLINE POL
ON PO.PURCHORDERID = POL.PURCHORDERID AND
PO.SUPPLIERID = POL.SUPPLIERID
GROUP BY PO.DATEDELIVERED
ORDER BY PO.DATEDELIVERED;
/* RESULTS:
DATEDELIV   MAX_COST   MIN_COST   AVG_COST UNITS_COUNTED
--------- ---------- ---------- ---------- -------------
29-APR-20    5399.82     210.33 1530.69571             7
30-APR-20    7539.64     225.82    2108.04             5
22-MAY-20   12351.33     174.28 3347.53167             6
24-MAY-20    5459.73     265.46   1686.062             5
26-MAY-20     7549.2     242.87   3896.035             2
28-MAY-20    2475.85      21.42 737.097778             9
29-JUL-20     2153.6     815.92    1534.68             3
01-AUG-20    6047.37      21.42   1006.207            10
02-AUG-20    3003.82      98.93 1030.38333            12
10-AUG-20     648.92     164.73    382.006             5
11-AUG-20    3219.64     328.87  1254.4925             4

DATEDELIV   MAX_COST   MIN_COST   AVG_COST UNITS_COUNTED
--------- ---------- ---------- ---------- -------------
17-AUG-20     648.92     225.64     375.37             4
07-SEP-20     1514.6      71.42     794.79             4
08-SEP-20    8622.38     145.32 2954.87385            13
09-SEP-20     5507.7      64.62 1273.03846            13
10-SEP-20    1895.16     215.91   1055.535             2
11-SEP-20    3239.73       65.7    1258.15             5
12-SEP-20    6244.22      64.62 1801.63933            15
13-SEP-20    6479.73       80.6 1617.59083            12
14-SEP-20    1079.91      92.25     391.01            14

20 rows selected. 
*/

/* Question 3B */
SELECT PO.SUPPLIERID, PO.DATEDELIVERED, 
    MAX(POL.ORDEREDUNITCOST) AS MAX_COST, 
    MIN(POL.ORDEREDUNITCOST) AS MIN_COST, 
    AVG(POL.ORDEREDUNITCOST) AS AVG_COST, 
    COUNT(POL.UNITQUANTITY) AS UNITS_COUNTED
FROM PURCHASEORDER PO INNER JOIN PURCHORDERLINE POL
ON PO.PURCHORDERID = POL.PURCHORDERID AND
PO.SUPPLIERID = POL.SUPPLIERID
WHERE PO.DATEDELIVERED BETWEEN '01-AUG-2020' AND '31-AUG-2020'
GROUP BY PO.SUPPLIERID, PO.DATEDELIVERED
ORDER BY PO.DATEDELIVERED;
/* Results:
SUPPLIERID DATEDELIV   MAX_COST   MIN_COST   AVG_COST UNITS_COUNTED
---------- --------- ---------- ---------- ---------- -------------
CA-103     01-AUG-20    1888.65      21.42     614.16             5
JLI-450    01-AUG-20    6047.37      64.62   1398.254             5
MY-450     02-AUG-20    3003.82     215.64 1299.30333             6
PA-450     02-AUG-20    2585.52      98.93 761.463333             6
LU-450     10-AUG-20     648.92     164.73    382.006             5
CV-104     11-AUG-20    3219.64     328.87  1254.4925             4
PA-455     17-AUG-20     648.92     225.64     375.37             4
*/

/* Question 3C */
SELECT PO.SUPPLIERID, PO.DATEDELIVERED, 
    MAX(POL.ORDEREDUNITCOST) AS MAX_COST, 
    MIN(POL.ORDEREDUNITCOST) AS MIN_COST, 
    AVG(POL.ORDEREDUNITCOST) AS AVG_COST, 
    COUNT(POL.UNITQUANTITY) AS UNITS_COUNTED
FROM PURCHASEORDER PO INNER JOIN PURCHORDERLINE POL
ON PO.PURCHORDERID = POL.PURCHORDERID AND
PO.SUPPLIERID = POL.SUPPLIERID
WHERE PO.DATEDELIVERED BETWEEN '01-AUG-2020' AND '31-AUG-2020'
GROUP BY PO.SUPPLIERID, PO.DATEDELIVERED
HAVING AVG(POL.ORDEREDUNITCOST) > 1000
ORDER BY PO.DATEDELIVERED;
/*Results:
SUPPLIERID DATEDELIV   MAX_COST   MIN_COST   AVG_COST UNITS_COUNTED
---------- --------- ---------- ---------- ---------- -------------
JLI-450    01-AUG-20    6047.37      64.62   1398.254             5
MY-450     02-AUG-20    3003.82     215.64 1299.30333             6
CV-104     11-AUG-20    3219.64     328.87  1254.4925             4
*/

/* Question 4 */
SELECT CO.ORDERID, 
    C.CUSTLASTNAME || ', ' || C.CUSTFIRSTNAME AS CONTACT, 
    NVL(C.EMAILADDR, '**missing email**'),
    CO.ORDERDATE, 
    S.SHIPMENTID
FROM CUSTORDER CO 
INNER JOIN CUSTOMER C
ON CO.CUSTOMERID = C.CUSTOMERID
INNER JOIN SHIPMENT S 
ON CO.ORDERID = S.ORDERID
WHERE S.SHIPMENTID NOT IN (SELECT SHIPMENTID FROM PACKINGSLIP) AND S.SHIPMENTID LIKE 'M%'
ORDER BY CO.ORDERID;

/* Results 
ORDERID    CONTACT                               NVL(C.EMAILADDR,'**MISSINGEMAIL**')                ORDERDATE SHIPMENTID
---------- ------------------------------------- -------------------------------------------------- --------- ----------
3001000667 Skadberg, John                        skad@comcast.net                                   23-FEB-20 M129      
3001000703 Hedden, Joan                          **missing email**                                  01-MAR-20 M137      
3001000750 Cool, Louise                          **missing email**                                  13-MAR-20 M147      
3001000796 Reece, Jill                           jreece1@comcast.net                                29-MAR-20 M159      
3001000799 Mangus, Karen                         karenm122@outlook.com                              29-MAR-20 M160      
3001000803 Osborne, Shirley                      **missing email**                                  30-MAR-20 M161      
3001000808 Huegel, Howard                        **missing email**                                  31-MAR-20 M162      

7 rows selected. 
*/

/*Question 5 */
SELECT S.SHIPPERID, S.SHIPPERNAME, S.EMAILADDR, S.PHONE, COUNT(SPMT.SHIPMENTID) AS CORNER_SHIPMENTS
FROM SHIPPER S INNER JOIN SHIPMENT SPMT
ON S.SHIPPERID = SPMT.SHIPPERID
WHERE SPMT.SHIPSTATE IN ('NY','NM', 'FL', 'WA')
GROUP BY S.SHIPPERID, S.SHIPPERNAME, S.EMAILADDR, S.PHONE
ORDER BY S.SHIPPERNAME;
/* RESULTS:
 SHIPPERID SHIPPERNAME               EMAILADDR                                          PHONE        CORNER_SHIPMENTS
---------- ------------------------- -------------------------------------------------- ------------ ----------------
         8 Bike Courier              tburke@bikec.com                                   972-534-9433                4
         1 Channel Express           gtrackner@chexpress.com                            303-434-8000               13
         2 Federal Express           emike@fedex.com                                    517-486-4643               23
         7 Mail Hub                  croush@mailhub.com                                 305-267-9966                2
         5 Next Day Air              lanab@nda.com                                      972-747-0747               13
         4 Shipping Experts          ghemmel@shipex.com                                 972-848-8396               15
         3 U.S. Postal Service       suzyc@usps.gov                                     919-486-4745               21
         6 United Parcel Service     juliar@ups.com                                     471-774-2527                7

8 rows selected. */

/* Question 6 */
SELECT 
    p.EMPLOYEEID,
    e.FIRSTNAME,
    e.LASTNAME,
    s.ORDERID,
    p.SHIPPEDDATE,
    COUNT(col.PARTNUMBER) AS ITEM_COUNT,
    TO_CHAR(SUM(col.UNITPRICE * col.ORDERQUANTITY), '$99,999.99') AS TOTALPRICE
FROM PACKINGSLIP p
INNER JOIN EMPLOYEE e ON p.EMPLOYEEID = e.EMPLOYEEID
INNER JOIN SHIPMENT s ON p.SHIPMENTID = s.SHIPMENTID
INNER JOIN CUSTORDERLINE col ON s.ORDERID = col.ORDERID
WHERE p.SHIPPEDDATE BETWEEN DATE '2020-03-01' AND DATE '2020-03-31'
GROUP BY p.EMPLOYEEID, e.FIRSTNAME, e.LASTNAME, s.ORDERID, p.SHIPPEDDATE
HAVING COUNT(col.PARTNUMBER) > 8
ORDER BY p.SHIPPEDDATE;
/*Results:
EMPLOYEEID FIRSTNAME       LASTNAME             ORDERID    SHIPPEDDA ITEM_COUNT TOTALPRICE 
---------- --------------- -------------------- ---------- --------- ---------- -----------
250550     Allison         Roland               3001000784 27-MAR-20         30 ###########
251088     Kayla           Underwood            3001000784 27-MAR-20         60 ###########
250967     Sandra          Daniels              3001000783 27-MAR-20          9     $869.79
250550     Allison         Roland               3001000786 28-MAR-20         24  $29,261.10
251097     Jack            Trale                3001000761 28-MAR-20         40 ###########
251088     Kayla           Underwood            3001000761 28-MAR-20         40 ###########
251088     Kayla           Underwood            3001000786 28-MAR-20         48  $58,522.20
251088     Kayla           Underwood            3001000776 29-MAR-20         24 ###########
251097     Jack            Trale                3001000795 31-MAR-20         14 ###########
251088     Kayla           Underwood            3001000795 31-MAR-20         12 ###########

32 rows selected.
*/

/* Question 7 */
SELECT 
    c.CUSTOMERID,
    c.COMPANYNAME,
    co.ORDERDATE,
    sup.COMPANYNAME AS SUPPLIER_COMPANYNAME,
    col.PARTNUMBER
FROM CUSTORDER co
INNER JOIN CUSTOMER c ON co.CUSTOMERID = c.CUSTOMERID
INNER JOIN CUSTORDERLINE col ON co.ORDERID = col.ORDERID
INNER JOIN SUPPLIEDPART sp ON col.PARTNUMBER = sp.PARTNUMBER
INNER JOIN SUPPLIER sup ON sp.SUPPLIERID = sup.SUPPLIERID
WHERE co.ORDERDATE = DATE '2020-02-28'
AND c.COMPANYNAME IS NOT NULL
ORDER BY c.COMPANYNAME;
/* Results: 
CUSTOMERID COMPANYNAME                              ORDERDATE SUPPLIER_COMPANYNAME           PARTNUMBER
---------- ---------------------------------------- --------- ------------------------------ ----------
C-310052   Appliances Inc.                          28-FEB-20 Net Works                      KEY-006   
C-310052   Appliances Inc.                          28-FEB-20 Computer Surplus               P-007     
C-310052   Appliances Inc.                          28-FEB-20 Information Security           MEM-004   
C-310066   Bobs Repair Service                      28-FEB-20 Server Store                   MIC-012   
C-310066   Bobs Repair Service                      28-FEB-20 Beach Audio                    MON-006   
C-310066   Bobs Repair Service                      28-FEB-20 Monster Parts                  DVD-001   
C-310012   Photography Niche                        28-FEB-20 Electronics Cafe               KEY-009   
C-310012   Photography Niche                        28-FEB-20 Electronics Cafe               P-001     
C-310012   Photography Niche                        28-FEB-20 Computer Surplus               CF-006    
C-310024   Reflexions Manufacturing                 28-FEB-20 Cables and Kits                PRT-003   
C-310024   Reflexions Manufacturing                 28-FEB-20 Information Security           MEM-001   

CUSTOMERID COMPANYNAME                              ORDERDATE SUPPLIER_COMPANYNAME           PARTNUMBER
---------- ---------------------------------------- --------- ------------------------------ ----------
C-310024   Reflexions Manufacturing                 28-FEB-20 Tech Parts Mart                MOD-002   
C-310037   Store It Here                            28-FEB-20 Computer Surplus               P-003     
C-310037   Store It Here                            28-FEB-20 Limited Comp                   SFT-008   
C-310037   Store It Here                            28-FEB-20 Electronics Cafe               CRD-003   
C-310037   Store It Here                            28-FEB-20 Information Security           MEM-004   

16 rows selected. 
*/

/* Question 8 */
SELECT 
    pol.PURCHORDERID,
    po.DATEORDERED,
    pol.UNITQUANTITY,
    pol.ORDEREDUNITCOST,
    ip.STOCKLEVEL,
    ip.PARTDESCRIPTION
FROM PURCHORDERLINE pol
INNER JOIN PURCHASEORDER po ON pol.PURCHORDERID = po.PURCHORDERID
INNER JOIN SUPPLIEDPART sp ON pol.SUPPLIERID = sp.SUPPLIERID 
    AND pol.CATALOGNUMBER = sp.CATALOGNUMBER /* composite key*/
INNER JOIN INVENTORYPART ip ON sp.PARTNUMBER = ip.PARTNUMBER
WHERE po.EMPLOYEEID = 250600
AND (pol.UNITQUANTITY > 10 OR ip.STOCKLEVEL < 10);
/* Results: 

PURCHORDER DATEORDER UNITQUANTITY ORDEREDUNITCOST STOCKLEVEL PARTDESCRIPTION                                   
---------- --------- ------------ --------------- ---------- --------------------------------------------------
EE99-012   27-JUL-20           12         2585.52          8 LASER JET 1999SE                                  
EE99-012   27-JUL-20           12          945.52          9 COLOR INKJET PRINTER                              
EE99-018   05-SEP-20            3          145.32          9 SLIM COOLING FAN LOW NOISE                        
EE99-018   05-SEP-20           10         1619.46          9 DVDRW SLIM EXTERNAL             
*/
/*Question 9 */
SELECT 
    s.SUPPLIERID,
    s.COMPANYNAME,
    s.PHONE,
    COUNT(sp.PARTNUMBER) AS SUPPLIEDPARTS,
    SUM(sp.UNITCOST) AS TOTAL_UNITCOST
FROM SUPPLIER s
INNER JOIN SUPPLIEDPART sp ON s.SUPPLIERID = sp.SUPPLIERID
GROUP BY s.SUPPLIERID, s.COMPANYNAME, s.PHONE
HAVING COUNT(sp.PARTNUMBER) > 10
ORDER BY s.SUPPLIERID;
/* Results:
SUPPLIERID COMPANYNAME                    PHONE        SUPPLIEDPARTS TOTAL_UNITCOST
---------- ------------------------------ ------------ ------------- --------------
CA-105     CompCom                        919-736-9458            11        3303.78
GC-450     Tech WorldWide                 207-634-1969            13        8604.98
MC-455     Discount Print                 505-660-9632            12       15583.97
PP-103     Toner Recyclers                303-967-1415            13       14151.87
TA-144     Computer Medic                 520-486-6025            12        6204.87
*/

/* Question 10 */
SELECT 
    co.ORDERID,
    co.ORDERDATE,
    c.COMPANYNAME,
    c.CELLPHONE,
    c.STATE
FROM CUSTORDER co
INNER JOIN CUSTOMER c ON co.CUSTOMERID = c.CUSTOMERID
WHERE EXTRACT(YEAR FROM co.ORDERDATE) = 2020
AND SUBSTR(c.CELLPHONE, 1, 3) = '727'
AND c.COMPANYNAME IS NOT NULL
ORDER BY co.ORDERDATE;
/*Results:
ORDERID    ORDERDATE COMPANYNAME                              CELLPHONE    ST
---------- --------- ---------------------------------------- ------------ --
3001000522 14-JAN-20 Cellular Services                        727-129-5545 FL
3001000620 14-FEB-20 Supplying Crafts                         727-951-9889 FL
3001000624 14-FEB-20 Cellular Services                        727-129-5545 FL
3001000684 25-FEB-20 Supplying Crafts                         727-951-9889 FL
3001000739 09-MAR-20 Supplying Crafts                         727-951-9889 FL
3001000800 30-MAR-20 Supplying Crafts                         727-951-9889 FL

6 rows selected. 
*/

/* 
Question 11: Nested queries operate by embedding an inner SQL statement within an outer query, allowing multi-step data retrieval in one command

Question 12: The inner join operation requires the INNER JOIN keyword with the outer table on the left and the joining table on the right, followed by the ON statement that requires 
the matching of PKs. For composite keys, the PKs are matched with a logical AND between each condition

Question 13: Keep chaining them. One join connects two tables, and the next join adds a third onto that result like a chain. 

Question 14: A table alias is a shorthand nickname for a table name, used to avoid retyping long table names. 
A column alias renames a column in the result set only, for readability or labeling

Question 15: If you only join on one part of a composite PK instead of both, you get a partial join — Oracle will still run it but match rows on just that one column. 
This causes a Cartesian-like explosion of duplicate rows because multiple rows share the same value in that one column.

*/