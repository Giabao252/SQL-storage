/*
Bao Luu
CNIT 27200 Spring 2026
Lab Time: Wednesday 9:30am
Duration: 2 hours
********************************************************************************
Question 1A
*/
DESCRIBE CUSTOMER;

/*Results:
Name          Null?    Type         
------------- -------- ------------ 
CUSTOMERID    NOT NULL VARCHAR2(10) 
COMPANYNAME            VARCHAR2(40) 
CUSTFIRSTNAME          VARCHAR2(15) 
CUSTLASTNAME           VARCHAR2(20) 
CUSTTITLE              VARCHAR2(5)  
ADDRESS                VARCHAR2(40) 
CITY                   VARCHAR2(20) 
STATE                  CHAR(2)      
POSTALCODE             CHAR(10)     
PHONE                  CHAR(12)     
CELLPHONE              CHAR(12)     
EMAILADDR              VARCHAR2(50) 
*/

/*Question 1B*/
SELECT CUSTOMERID, CUSTLASTNAME, STATE FROM CUSTOMER
WHERE STATE = 'IN';

/*Results:
CUSTOMERID CUSTLASTNAME         ST
---------- -------------------- --
C-310016   Bending              IN
I-310030   Quintero             IN
I-310108   Davis                IN
I-310115   Fazal                IN
I-310147   Yaun                 IN
*/

/*Question 2A*/
SELECT UNIQUE MANUFACTURERNAME FROM MACHINE;

/*Results:
MANUFACTURERNAME         
-------------------------
NORTHWEST CONVEYER
SHIPSTATION
TRIGO
GATEWAY PRINT SYSTEMS
READY ONE RFID
*/

/*Question 2B*/
SELECT UNIQUE MANUFACTURERNAME, MODEL FROM MACHINE;

/* Results:

MANUFACTURERNAME          MODEL                    
------------------------- -------------------------
NORTHWEST CONVEYER        STAINLESS STEEL          
SHIPSTATION               DPT90000                 
READY ONE RFID            ZR33D0                   
TRIGO                     XL                       
SHIPSTATION               304T-851                 
GATEWAY PRINT SYSTEMS     IP9320                   
SHIPSTATION               UE6A                     

7 rows selected. 
*/

/*Question 3A*/
SELECT CUSTOMERID, EMAILADDR, CITY, STATE 
FROM CUSTOMER
WHERE CITY = 'Jacksonville' AND STATE = 'FL';

/* Results:
CUSTOMERID EMAILADDR                                          CITY                 ST
---------- -------------------------------------------------- -------------------- --
C-310069   supplycrafts@gmail.com                             Jacksonville         FL
C-310070   cellcall@live.com                                  Jacksonville         FL
*/

/*Question 3B*/
SELECT CUSTOMERID, EMAILADDR, CITY, STATE 
FROM CUSTOMER
WHERE CITY IN ('Jacksonville', 'Sebring') AND STATE = 'FL';

/* Results:
CUSTOMERID EMAILADDR                                          CITY                 ST
---------- -------------------------------------------------- -------------------- --
C-310069   supplycrafts@gmail.com                             Jacksonville         FL
C-310070   cellcall@live.com                                  Jacksonville         FL
C-310081   sales@gansys.com                                   Sebring              FL
I-310015   karenm122@outlook.com                              Sebring              FL
I-310052   ayelnick@icloud.com                                Sebring              FL
*/

/*Question 4*/
SELECT EMPLOYEEID, FIRSTNAME || ' ' || LASTNAME AS EMPLOYEE_NAME, BIRTHDATE, JOBTITLE
FROM EMPLOYEE
WHERE BIRTHDATE BETWEEN '01-JAN-1960' AND '31-DEC-1985' 
AND JOBTITLE IN ('Assembly', 'Engineer')
AND RELEASEDATE IS NULL;

/* Results:
EMPLOYEEID EMPLOYEE_NAME                        BIRTHDATE JOBTITLE                           
---------- ------------------------------------ --------- -----------------------------------
250104     Trevon Blair                         28-SEP-85 Engineer                           
250204     Todd Vigus                           07-FEB-81 Assembly                           
250209     Trinidad Reyes                       01-MAY-82 Engineer                           
250399     Ronald Day                           01-JAN-83 Assembly                           
250475     Steve Hess                           27-JUN-84 Assembly                           
250559     Carmen Romilda                       23-JUN-82 Engineer                           
250989     Xavier Deagen                        04-JUN-83 Assembly                           
251030     Jaylen Moore                         06-MAY-82 Assembly                           
251088     Kayla Underwood                      03-SEP-82 Assembly                           
251135     David Gostler                        04-JUN-84 Assembly                           

10 rows selected. 
*/

/*Question 5*/
SELECT CUSTOMERID, CUSTLASTNAME, CUSTFIRSTNAME, CITY, STATE 
FROM CUSTOMER
WHERE EMAILADDR IS NULL
    AND STATE NOT IN ('IN', 'IL', 'KY', 'MI', 'OH')
ORDER BY CITY;

/*Results:
 CUSTOMERID CUSTLASTNAME         CUSTFIRSTNAME   CITY                 ST
---------- -------------------- --------------- -------------------- --
I-310057   Owens                Tonya           Abbeville            SC
I-310090   Laake                James           Aladdin              WY
I-310071   Zissa                Ted             Ardmore              OK
I-310016   Austin               Peter           Barnwell             SC
I-310050   Schilling            James           Cedar Rapids         IA
I-310107   Basham               Nancy           Dexter               ME
I-310076   Carlton              Tim             Enfield              CT
I-310101   Dunlap               Chris           Gillette             WY
I-310086   McGrew               Zach            Globe                AZ
I-310044   Cool                 Louise          Hailey               ID
I-310081   Price                Bryan           Hampton              VA

CUSTOMERID CUSTLASTNAME         CUSTFIRSTNAME   CITY                 ST
---------- -------------------- --------------- -------------------- --
I-310123   Bowen                Linda           Huron                SD
I-310075   Cortez               Robert          Keene                NH
I-310140   Webb                 Jim             Lowell               MA
I-310129   Vanderhoff           Rosemary        Macon                GA
I-310040   Gunderson            Kathy           Marianna             FL
I-310151   Huegel               Howard          Milford              DE
I-310139   Malady               Frank           Nahunta              GA
I-310067   Camargo              Travis          Neosho               MO
I-310082   Ziekart              Helene          New Haven            CT
I-310012   Jackson              Kevin           New Orleans          LA
I-310091   Stabnik              Daniel          Perryville           MO

CUSTOMERID CUSTLASTNAME         CUSTFIRSTNAME   CITY                 ST
---------- -------------------- --------------- -------------------- --
I-310073   Eagon                Dean            Peublo               CO
I-310079   Wilson               Christina       Pratt                KS
I-310029   Baldocchio           Tammi           Slatersville         RI
I-310024   Hedden               Joan            Springdale           AR
I-310066   Ball                 Ruth            St. Cloud            MN
I-310013   Osborne              Shirley         Swainsboro           GA
I-310036   Montgomery           Andrea          Thurmont             MD
I-310064   Jacko                Jo              Tucson               AZ
I-310055   Clute                Jon             Tucson               AZ
I-310160   Hill                 Andy            Winston              OR
I-310056   Henderson            Elizabeth       Zeona                SD

33 rows selected. 
*/

/*Question 6*/
SELECT CUSTOMERID, CUSTTITLE || ' ' || CUSTLASTNAME AS GREETING, PHONE, EMAILADDR
FROM CUSTOMER
WHERE EMAILADDR LIKE '%gmail%' AND COMPANYNAME IS NULL;

/* Results:
CUSTOMERID GREETING                   PHONE        EMAILADDR                                         
---------- -------------------------- ------------ --------------------------------------------------
I-310002   Mr. Caldwell               606-901-1238 lcaldwell@gmail.com                               
I-310007   Ms. Cain                   517-901-2610 jcain@gmail.com                                   
I-310010   Dr. Gross                  908-879-8672 jgross@gmail.com                                  
I-310021   Mr. Smith                  719-822-8828 matsm@gmail.com                                   
I-310026   Ms. Xu                     417-546-2570 txu@gmail.com                                     
I-310027   Ms. Sharp                  360-650-5604 dsharp@gmail.com                                  
I-310034   Mr. Jones                  971-522-5851 jjones@gmail.com                                  
I-310042   Mr. Trenkle                856-267-7913 gtrenkle@gmail.com                                
I-310047   Dr. Yarian                 919-310-2224 syarian@gmail.com                                 
I-310048   Mr. Bollock                307-635-1692 pat@gmail.com                                     
I-310053   Mrs. Pearl                 660-447-8319 spearl@gmail.com                                  

CUSTOMERID GREETING                   PHONE        EMAILADDR                                         
---------- -------------------------- ------------ --------------------------------------------------
I-310077   Mrs. Hundley               304-713-3298 jenhund@gmail.com                                 
I-310080   Mr. Nugent                 802-352-8923 nugent@gmail.com                                  
I-310104   Mr. Gardiner               225-313-6268 lgardiner@gmail.com                               
I-310111   Mr. Manaugh                907-747-5603 jmanaugh@gmail.com                                
I-310114   Mr. Darling                860-684-1620 randolph@gmail.com                                
I-310126   Mr. Moore                  206-692-2845 chrismoore29@gmail.com                            
I-310127   Mrs. Watson                305-442-3031 mswatson@gmail.com                                
I-310131   Mr. Stahley                208-324-0783 rstahley@gmail.com                                
I-310142   Mr. Williams               806-739-1335 marcw332@gmail.com                                
I-310147   Mr. Yaun                   317-780-9804 stevenyaun@gmail.com                              
I-310157   Ms. Toldner                403-744-4677 mtoldner@gmail.com                                

CUSTOMERID GREETING                   PHONE        EMAILADDR                                         
---------- -------------------------- ------------ --------------------------------------------------
I-310158   Ms. Tennison               914-622-8633 jtennison@gmail.com                               

23 rows selected. 
*/

/*Question 7*/
SELECT * FROM CUSTORDER
WHERE REQUIREDDATE > ORDERDATE + 40;

/* Results: 
ORDERID    CUSTOMERID ORDERDATE REQUIREDD
---------- ---------- --------- ---------
3000000121 C-310033   25-AUG-19 21-OCT-19
3000000204 I-310063   29-SEP-19 13-NOV-19
3000000250 I-310085   20-OCT-19 01-DEC-19
3000000280 I-310098   02-NOV-19 15-DEC-19
3000000317 I-310135   16-NOV-19 27-DEC-19
3000000318 I-310133   16-NOV-19 27-DEC-19
3001000559 I-310126   26-JAN-20 13-MAR-20
3001000667 I-310120   23-FEB-20 04-APR-20

8 rows selected. 
*/

/*Question 8*/
SELECT SUPPLIERID,
       CATALOGNUMBER,
       UNITQUANTITY,
       ORDEREDUNITCOST,
       UNITQUANTITY * ORDEREDUNITCOST AS SUBTOTAL
FROM PURCHORDERLINE
WHERE SUPPLIERID LIKE 'MM%'
ORDER BY SUPPLIERID;
/* Results:
SUPPLIERID CATALOGNUM UNITQUANTITY ORDEREDUNITCOST   SUBTOTAL
---------- ---------- ------------ --------------- ----------
MM-103     800-7540              1           71.42      71.42
MM-103     800-5899              2           88.22     176.44
MM-103     800-2119              8         1504.92   12039.36
MM-103     800-9473              9          1514.6    13631.4
MM-104     900-6303              1          971.73     971.73
MM-104     900-7095              2          530.92    1061.84
MM-104     900-8260              7          357.73    2504.11
MM-104     900-6242              1         1519.87    1519.87
MM-104     900-6198              2         5373.73   10747.46
MM-104     900-8700              1          215.64     215.64
MM-104     900-4824              1          708.73     708.73

SUPPLIERID CATALOGNUM UNITQUANTITY ORDEREDUNITCOST   SUBTOTAL
---------- ---------- ------------ --------------- ----------
MM-104     900-6111              1           80.78      80.78

12 rows selected. 
*/

/*Question 9*/
SELECT SUPPLIERID,
       PARTNUMBER,
       UNITCOST,
       UNITOFMEASURE,
       UNITCOST / UNITOFMEASURE AS PIECE_COST
FROM SUPPLIEDPART
WHERE UNITCOST BETWEEN 50 AND 150
  AND UNITCOST / UNITOFMEASURE <= 10
ORDER BY UNITCOST;

/* Results:
SUPPLIERID PARTNUMBER   UNITCOST UNITOFMEASURE PIECE_COST
---------- ---------- ---------- ------------- ----------
MC-455     ICAB-007        53.75            20     2.6875
WE-450     CF-006          62.16            12       5.18
LL-455     CF-005          63.82            12 5.31833333
NN-455     BRK-008          71.8            22 3.26363636
PP-103     CAB-009          71.8            24 2.99166667
PP-103     KEY-005         71.96            15 4.79733333
JLI-450    CAB-010          72.8            24 3.03333333
C-455      POW-001         75.75            20     3.7875
LL-455     MIC-012          75.8            14 5.41428571
TA-144     BRK-007         78.46            24 3.26916667
LL-455     BRK-006         80.55            60     1.3425

SUPPLIERID PARTNUMBER   UNITCOST UNITOFMEASURE PIECE_COST
---------- ---------- ---------- ------------- ----------
CA-105     CAB-016         82.65            24    3.44375
MM-103     CAB-008          83.8            24 3.49166667
MM-104     BRK-009         85.85            32  2.6828125
MC-455     CF-008          89.55            20     4.4775
JLI-450    CAB-006         89.85            20     4.4925
CCS-106    CF-007          91.88            17 5.40470588
PA-450     CAB-023         107.7            45 2.39333333
TA-144     BRK-011         107.7            45 2.39333333
GC-450     CAB-015         107.8            24 4.49166667
TA-144     KEY-008        107.88            16     6.7425
SS-455     CD-001         115.94            12 9.66166667

SUPPLIERID PARTNUMBER   UNITCOST UNITOFMEASURE PIECE_COST
---------- ---------- ---------- ------------- ----------
LU-450     SFT-001         117.8            24 4.90833333
CA-103     KEY-007        117.86            12 9.82166667
DE-450     CAB-011        118.85            20     5.9425
LU-450     SFT-002         119.8            26 4.60769231
RC-450     CF-002          119.9            12 9.99166667
MSN-105    BRK-010        124.65            41  3.0402439
TA-144     CAB-017        124.75            34 3.66911765
GC-450     BRK-005         125.7            45 2.79333333
MSN-105    MIC-010        134.85            20     6.7425
MY-450     CAB-005         139.8            26 5.37692308
PA-450     CAB-022        145.85            32  4.5578125

SUPPLIERID PARTNUMBER   UNITCOST UNITOFMEASURE PIECE_COST
---------- ---------- ---------- ------------- ----------
RC-450     KEY-009        147.88            19 7.78315789

34 rows selected. 
*/

/*Question 10:
The DESCRIBE command shows the structure of a table including all column names,
their data types, and whether they allow NULL values.
*/

/*Question 11:
AND requires ALL conditions to be true for a row to be included in the results,
while OR requires only ONE condition to be true.
*/

/*Question 12: 
NOT IN allows us to exclude multiple values at once without writing multiple
conditions with AND.
*/

/*Question 13: 
In Oracle, we can concatenate columns using the || operator between each column or
string you want to combine.
*/

/*Question 14:
LIKE is used for pattern matching with wildcards instead of exact matches. The %
wildcard matches any sequence of characters, while _ matches a single character.
*/

/*Question 15: 
Calculated fields in the SELECT clause allow us to perform mathematical operations
or transformations on data without changing the actual database values.
*/