/*
Bao Luu
CNIT 27200 Spring 2026
Lab time: 9:30-11:30am Wednesday
Duration: 2 hours
********************************************************************************
Question 1
*/
SELECT SUPPLIER_ID, PRODUCT_CODE, PRICE, DESCRIPTION
FROM FOOD
WHERE SUPPLIER_ID IN (SELECT SUPPLIER_ID FROM FOOD_SUPPLIER WHERE SUPPLIER_NAME LIKE '%Bakery%');

/* Results:
SUP PR      PRICE DESCRIPTION         
--- -- ---------- --------------------
Lak Sw        5.5 Caprese             
Lak Sd       6.25 Spinach Salad       
Lak Br       2.35 Cheese Stick        
*/

/* Question 2*/
SET LINESIZE 200;
SELECT SUPPLIER_ID, SUPPLIER_NAME, SUPPLIER_CITY
FROM FOOD_SUPPLIER
WHERE SUPPLIER_ID NOT IN (SELECT SUPPLIER_ID FROM FOOD)
ORDER BY SUPPLIER_CITY;

/* Results:
SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Fdv Fresh Daily Vegetables         Aurora                        
Met Under the Metra                Chicago                       
Gio Giovana and Sons               Chicago                       
Rby Rosemont Bakery                Glencoe                       
Har Harold Bakery                  Hinsdale                      
Fas Framer and Samson              Orland Park                   

*/

/*Question 3*/
SET LINESIZE 200;

SELECT FS.SUPPLIER_ID, FS.SUPPLIER_NAME, F.DESCRIPTION, F.PRICE 
FROM FOOD_SUPPLIER FS INNER JOIN FOOD F
ON FS.SUPPLIER_ID = F.SUPPLIER_ID
WHERE FS.SUPPLIER_CITY = 'Chicago' AND F.Price < 6;

/* Results:
SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Hsd Harper Street Deli             Chef Salad                 5.75
Hsd Harper Street Deli             Chicken Soup               4.25
Hsd Harper Street Deli             Yellow Cake                 4.5
Foi Fontinas Italian               Broccoli Salad                4
Foi Fontinas Italian               French Fries                1.5
Foi Fontinas Italian               Barley Soup                4.75
Foi Fontinas Italian               Apple Pie                   4.5
Jmd Jebston Montrose Deli          Iced Tea                   2.85
Jmd Jebston Montrose Deli          Cole Slaw                   1.5
Dpz Downtowner Pizza               Dinner Roll                   1
Dpz Downtowner Pizza               Cheese Sauce                .75

SUP SUPPLIER_NAME                  DESCRIPTION               PRICE
--- ------------------------------ -------------------- ----------
Lak Lakeshore Bakery               Caprese                     5.5
Lak Lakeshore Bakery               Cheese Stick               2.35
*/

/*Question 4A*/
SELECT W.LAST_NAME, W.FIRST_NAME, W.HIRE_DATE, W.DEPT_CODE, W.CREDIT_LIMIT, L.LUNCH_ID, L.LUNCH_DATE
FROM WORKER W INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
WHERE TO_CHAR(L.LUNCH_DATE, 'MON-YYYY') = 'MAY-2021'
ORDER BY L.LUNCH_DATE, L.LUNCH_ID;

/* Results:
LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT
-------------------- ---------- --------- --- ------------ ---------- ---------
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21
Young                Taylor     12-NOV-07               25          3 22-MAY-21
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21
Williams             Jodie      16-MAR-19               25          7 27-MAY-21
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT
-------------------- ---------- --------- --- ------------ ---------- ---------
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21
Young                Taylor     12-NOV-07               25         13 27-MAY-21
*/

/*Question 4B*/
SELECT W.LAST_NAME, W.FIRST_NAME, W.HIRE_DATE, W.DEPT_CODE, W.CREDIT_LIMIT, L.LUNCH_ID, L.LUNCH_DATE, LI.ITEM_NUMBER
FROM WORKER W INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
INNER JOIN LUNCH_ITEM LI
ON L.LUNCH_ID = LI.LUNCH_ID
WHERE TO_CHAR(L.LUNCH_DATE, 'MON-YYYY') = 'MAY-2021'
ORDER BY L.LUNCH_DATE, L.LUNCH_ID, LI.ITEM_NUMBER;
/* Results:
LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           1
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           2
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           3
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           1
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           2
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           3
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           4
Young                Taylor     12-NOV-07               25          3 22-MAY-21           1
Young                Taylor     12-NOV-07               25          3 22-MAY-21           2
Young                Taylor     12-NOV-07               25          3 22-MAY-21           3
Young                Taylor     12-NOV-07               25          3 22-MAY-21           4

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Young                Taylor     12-NOV-07               25          3 22-MAY-21           5
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           1
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           2
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           3
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           4
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           1
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           2
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           3
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           4
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           5
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           1

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           2
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           3
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           4
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           5
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           1
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           2
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           3
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           1
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           2
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           3
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           4

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           5
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           6
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           1
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           2
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           3
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           4
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           1
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           2
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           3
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           4
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           1

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           2
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           3
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           4
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           1
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           2
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           3
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           4
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           5
Young                Taylor     12-NOV-07               25         13 27-MAY-21           1
Young                Taylor     12-NOV-07               25         13 27-MAY-21           2
Young                Taylor     12-NOV-07               25         13 27-MAY-21           3

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER
-------------------- ---------- --------- --- ------------ ---------- --------- -----------
Young                Taylor     12-NOV-07               25         13 27-MAY-21           4
Young                Taylor     12-NOV-07               25         13 27-MAY-21           5
*/

/* Question 4C */
SELECT W.LAST_NAME, W.FIRST_NAME, W.HIRE_DATE, W.DEPT_CODE, W.CREDIT_LIMIT, L.LUNCH_ID, L.LUNCH_DATE, LI.ITEM_NUMBER, F.PRICE
FROM WORKER W INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
INNER JOIN LUNCH_ITEM LI
ON L.LUNCH_ID = LI.LUNCH_ID
INNER JOIN FOOD F
ON LI.SUPPLIER_ID = F.SUPPLIER_ID
AND LI.PRODUCT_CODE = F.PRODUCT_CODE
WHERE TO_CHAR(L.LUNCH_DATE, 'MON-YYYY') = 'MAY-2021'
ORDER BY L.LUNCH_DATE, L.LUNCH_ID, LI.ITEM_NUMBER;

/* Results:
LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           1       5.75
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           2       4.25
Harney               Tyler      07-MAR-18 Tch           27          1 22-MAY-21           3       2.25
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           1          8
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           2        1.5
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           3       2.25
Gradle               Rita       23-MAR-14 Leg           32          2 22-MAY-21           4        4.5
Young                Taylor     12-NOV-07               25          3 22-MAY-21           1       5.75
Young                Taylor     12-NOV-07               25          3 22-MAY-21           2        8.6
Young                Taylor     12-NOV-07               25          3 22-MAY-21           3        1.5
Young                Taylor     12-NOV-07               25          3 22-MAY-21           4       2.85

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Young                Taylor     12-NOV-07               25          3 22-MAY-21           5        4.5
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           1       4.75
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           2        7.2
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           3          4
Sanchez              Jose       01-JUL-12 Com           22          4 22-MAY-21           4       3.45
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           1       4.25
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           2        7.2
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           3       4.75
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           4       1.55
Templeton            Angie      19-JUN-07 Acc           24          5 22-MAY-21           5        4.5
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           1       5.75

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           2       4.25
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           3        8.6
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           4       2.25
Kingman              James      17-DEC-06 Sal           33          6 22-MAY-21           5       2.25
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           1       5.75
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           2        8.6
Williams             Jodie      16-MAR-19               25          7 27-MAY-21           3       3.45
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           1       5.75
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           2       4.25
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           3        7.2
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           4        1.5

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           5       2.25
Shreve               Dane       18-MAR-04 Exe           45          8 27-MAY-21           6       3.45
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           1       5.75
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           2        8.6
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           3       1.55
Neal                 Tom        01-APR-13 Srv           26          9 27-MAY-21           4        3.5
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           1       4.25
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           2       5.25
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           3        1.5
Kingman              James      17-DEC-06 Sal           33         10 27-MAY-21           4       3.45
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           1       4.25

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           2       5.95
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           3        1.5
White                Cleo       22-MAY-11 Aud           22         11 27-MAY-21           4        3.5
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           1       5.75
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           2       5.25
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           3        7.2
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           4       2.25
Sumner               Carole     17-JUL-16 Tch           35         12 27-MAY-21           5        4.5
Young                Taylor     12-NOV-07               25         13 27-MAY-21           1       4.25
Young                Taylor     12-NOV-07               25         13 27-MAY-21           2        8.6
Young                Taylor     12-NOV-07               25         13 27-MAY-21           3        1.5

LAST_NAME            FIRST_NAME HIRE_DATE DEP CREDIT_LIMIT   LUNCH_ID LUNCH_DAT ITEM_NUMBER      PRICE
-------------------- ---------- --------- --- ------------ ---------- --------- ----------- ----------
Young                Taylor     12-NOV-07               25         13 27-MAY-21           4       2.25
Young                Taylor     12-NOV-07               25         13 27-MAY-21           5        4.5

57 rows selected.
*/

/* Question 5 */
col total format $999.99;

SELECT L.LUNCH_ID, L.LUNCH_DATE, SUM(F.PRICE) AS TOTAL
FROM LUNCH L
INNER JOIN LUNCH_ITEM LI
ON L.LUNCH_ID = LI.LUNCH_ID
INNER JOIN FOOD F
ON LI.SUPPLIER_ID = F.SUPPLIER_ID AND LI.PRODUCT_CODE = F.PRODUCT_CODE
WHERE L.LUNCH_DATE BETWEEN '01-JUN-2021' AND '15-JUN-2021'
GROUP BY L.LUNCH_ID, L.LUNCH_DATE
ORDER BY L.LUNCH_DATE, L.LUNCH_ID;

/* Results:
  LUNCH_ID LUNCH_DAT    TOTAL
---------- --------- --------
        14 01-JUN-21   $23.55
        15 01-JUN-21   $16.25
        16 01-JUN-21   $20.30
        17 01-JUN-21    $9.55
        18 01-JUN-21    $8.60
        19 01-JUN-21   $12.25
        20 03-JUN-21   $10.30
        25 07-JUN-21   $16.20
        28 10-JUN-21    $8.50
        30 10-JUN-21   $13.45
        32 10-JUN-21    $9.50

  LUNCH_ID LUNCH_DAT    TOTAL
---------- --------- --------
        34 15-JUN-21   $10.80
        35 15-JUN-21    $5.75
        36 15-JUN-21   $10.95
        37 15-JUN-21   $14.05
        38 15-JUN-21    $6.50
        39 15-JUN-21   $12.35
        40 15-JUN-21    $8.60
        41 15-JUN-21   $11.75

19 rows selected. 
*/

/* Question 6A */
SELECT TO_CHAR(L.LUNCH_DATE, 'fmMONTH-YYYY') AS MONTH, 
       COUNT(L.LUNCH_ID) AS LUNCH_COUNT
FROM WORKER W INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
WHERE DEPT_CODE <> 'Tch'
GROUP BY TO_CHAR(L.LUNCH_DATE, 'fmMONTH-YYYY')
ORDER BY TO_CHAR(L.LUNCH_DATE, 'fmMONTH-YYYY');

/* Results: 
MONTH          LUNCH_COUNT
-------------- -----------
JUNE-2021               28
MAY-2021                 8

*/

/*Question 6B*/
SELECT TO_CHAR(L.LUNCH_DATE, 'fmMONTH-YYYY') AS MONTH, COUNT(L.LUNCH_ID) AS LUNCH_COUNT
FROM WORKER W INNER JOIN LUNCH L
ON W.WORKER_ID = L.WORKER_ID
WHERE W.DEPT_CODE != 'Tch'
GROUP BY TO_CHAR(L.LUNCH_DATE, 'fmMONTH-YYYY')
HAVING COUNT(L.LUNCH_ID) <= 10
ORDER BY TO_CHAR(L.LUNCH_DATE, 'fmMONTH-YYYY');

/* Results:
MONTH          LUNCH_COUNT
-------------- -----------
MAY-2021                 8
*/