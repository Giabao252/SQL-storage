/*
Bao Luu
CNIT 27200 Spring 2026
Lab Time: Wednesday 9:30am
Duration: 2 hours
********************************************************************************
Question 1A
*/
DESCRIBE USER_TABLES;

/* Results:
Name                      Null?    Type           
------------------------- -------- -------------- 
TABLE_NAME                NOT NULL VARCHAR2(128)  
TABLESPACE_NAME                    VARCHAR2(30)   
CLUSTER_NAME                       VARCHAR2(128)  
IOT_NAME                           VARCHAR2(128)  
STATUS                             VARCHAR2(8)    
PCT_FREE                           NUMBER         
PCT_USED                           NUMBER         
INI_TRANS                          NUMBER         
MAX_TRANS                          NUMBER         
INITIAL_EXTENT                     NUMBER         
NEXT_EXTENT                        NUMBER         
MIN_EXTENTS                        NUMBER         
MAX_EXTENTS                        NUMBER         
PCT_INCREASE                       NUMBER         
FREELISTS                          NUMBER         
FREELIST_GROUPS                    NUMBER         
LOGGING                            VARCHAR2(3)    
BACKED_UP                          VARCHAR2(1)    
NUM_ROWS                           NUMBER         
BLOCKS                             NUMBER         
EMPTY_BLOCKS                       NUMBER         
AVG_SPACE                          NUMBER         
CHAIN_CNT                          NUMBER         
AVG_ROW_LEN                        NUMBER         
AVG_SPACE_FREELIST_BLOCKS          NUMBER         
NUM_FREELIST_BLOCKS                NUMBER         
DEGREE                             VARCHAR2(10)   
INSTANCES                          VARCHAR2(10)   
CACHE                              VARCHAR2(5)    
TABLE_LOCK                         VARCHAR2(8)    
SAMPLE_SIZE                        NUMBER         
LAST_ANALYZED                      DATE           
PARTITIONED                        VARCHAR2(3)    
IOT_TYPE                           VARCHAR2(12)   
TEMPORARY                          VARCHAR2(1)    
SECONDARY                          VARCHAR2(1)    
NESTED                             VARCHAR2(3)    
BUFFER_POOL                        VARCHAR2(7)    
FLASH_CACHE                        VARCHAR2(7)    
CELL_FLASH_CACHE                   VARCHAR2(7)    
ROW_MOVEMENT                       VARCHAR2(8)    
GLOBAL_STATS                       VARCHAR2(3)    
USER_STATS                         VARCHAR2(3)    
DURATION                           VARCHAR2(15)   
SKIP_CORRUPT                       VARCHAR2(8)    
MONITORING                         VARCHAR2(3)    
CLUSTER_OWNER                      VARCHAR2(128)  
DEPENDENCIES                       VARCHAR2(8)    
COMPRESSION                        VARCHAR2(8)    
COMPRESS_FOR                       VARCHAR2(30)   
DROPPED                            VARCHAR2(3)    
READ_ONLY                          VARCHAR2(3)    
SEGMENT_CREATED                    VARCHAR2(3)    
RESULT_CACHE                       VARCHAR2(7)    
CLUSTERING                         VARCHAR2(3)    
ACTIVITY_TRACKING                  VARCHAR2(23)   
DML_TIMESTAMP                      VARCHAR2(25)   
HAS_IDENTITY                       VARCHAR2(3)    
CONTAINER_DATA                     VARCHAR2(3)    
INMEMORY                           VARCHAR2(8)    
INMEMORY_PRIORITY                  VARCHAR2(8)    
INMEMORY_DISTRIBUTE                VARCHAR2(15)   
INMEMORY_COMPRESSION               VARCHAR2(17)   
INMEMORY_DUPLICATE                 VARCHAR2(13)   
DEFAULT_COLLATION                  VARCHAR2(100)  
DUPLICATED                         VARCHAR2(1)    
SHARDED                            VARCHAR2(1)    
EXTERNAL                           VARCHAR2(3)    
HYBRID                             VARCHAR2(3)    
CELLMEMORY                         VARCHAR2(24)   
CONTAINERS_DEFAULT                 VARCHAR2(3)    
CONTAINER_MAP                      VARCHAR2(3)    
EXTENDED_DATA_LINK                 VARCHAR2(3)    
EXTENDED_DATA_LINK_MAP             VARCHAR2(3)    
INMEMORY_SERVICE                   VARCHAR2(12)   
INMEMORY_SERVICE_NAME              VARCHAR2(1000) 
CONTAINER_MAP_OBJECT               VARCHAR2(3)    
MEMOPTIMIZE_READ                   VARCHAR2(8)    
MEMOPTIMIZE_WRITE                  VARCHAR2(8)    
HAS_SENSITIVE_COLUMN               VARCHAR2(3)    
ADMIT_NULL                         VARCHAR2(3)    
DATA_LINK_DML_ENABLED              VARCHAR2(3)    
LOGICAL_REPLICATION                VARCHAR2(8)

Explanation: In this query, we review the data dictionary view maintained by Oracle
*/
/* Question 1B
*/
SELECT table_name FROM USER_TABLES;

/* Results:
TABLE_NAME                                                                                                                      
--------------------------------------------------------------------------------------------------------------------------------
DEPARTMENT
FOOD
FOOD_SUPPLIER
LUNCH
LUNCH_ITEM
WORKER

Explanation: in this query, we display the names of all the tables within the USER_TABLES table

*/
/*Question 2A*/
SELECT ROUND(265.73788, 2) AS TWO_DECIMAL,
ROUND(265.73788, 0) AS NO_DECIMAL,
ROUND(265.73788, -1) AS NEAREST_TENTH 
FROM DUAL;

/* Results:
TWO_DECIMAL NO_DECIMAL NEAREST_TENTH
----------- ---------- -------------
     265.74        266           270

Explanation: In this query, we create 3 extra rows for the rounding of 265.73788, with 1 column storing its form in two decimal place, 1
 for no decimal place, 1 for nearest 10th place
*/
/*Question 2B*/
SELECT TRUNC(265.73788, 2) AS TWO_DECIMAL,
TRUNC(265.73788, 0) AS NO_DECIMAL,
TRUNC(265.73788, -1) AS NEAREST_TENTH 
FROM DUAL;
/* Results:
TWO_DECIMAL NO_DECIMAL NEAREST_TENTH
----------- ---------- -------------
     265.73        265           260

Explanation: In this query, we create 3 extra rows for the truncation of 265.73788, with 1 column storing its form but down two decimal place, 1
 for down no decimal place, 1 for down to the nearest 10th place
*/
/*Question 3*/
COL desc_length FORMAT a11;
SELECT description,
       LENGTH(description) AS DESC_LENGTH,
       UPPER(PRODUCT_CODE) AS PRODUCT_CODE
FROM FOOD
WHERE PRODUCT_CODE IN ('Pz', 'Sp', 'Ds')
ORDER BY description;
/* Results:
DESCRIPTION          DESC_LENGTH PR
-------------------- ----------- --
Apple Pie                      9 DS
Barley Soup                   11 SP
Brownie                        7 DS
Cheese Pizza                  12 PZ
Chicken Soup                  12 SP
Mushroom Pizza                14 PZ
PB Cookie                      9 DS
Potato Soup                   11 SP
Sugar Cookie                  12 DS
Veggie Pizza                  12 PZ
Veggie Soup                   11 SP

DESCRIPTION          DESC_LENGTH PR
-------------------- ----------- --
Yellow Cake                   11 DS

Explanation: In this query, we list the food description, and then the length of the food only if their product code matches Pz, Sp, or Ds

*/
/*Question 4*/
SELECT FIRST_NAME, LAST_NAME, NVL(DEPT_CODE, 'Xxx') AS DEPT_CODE     
FROM WORKER
WHERE CREDIT_LIMIT > 25
ORDER BY DEPT_CODE;
/*Results: 
FIRST_NAME LAST_NAME            DEP
---------- -------------------- ---
Trey       Vought               Acc
Dane       Shreve               Exe
Blair      Reynolds             Fin
Melody     Campbell             Hmn
Kerry      Alveral              Leg
Rita       Gradle               Leg
James      Kingman              Sal
Tom        Neal                 Srv
Brooks     Walsh                Srv
Sam        Frank                Srv
Tyler      Harney               Tch

FIRST_NAME LAST_NAME            DEP
---------- -------------------- ---
Carole     Sumner               Tch
Cassie     Irwin                Xxx
Gail       Walsh                Xxx

14 rows selected.

Explanation: In this query, we searched for the first name, last name and department code of workers with credit limit greater than 25, sorted by 
dept code. Also, if the dept code is null, then replace it with Xxx and display them also
/*
/*Question 5*/
COL MIN_DATE FORMAT a25;
COL MAX_DATE FORMAT a25;
SELECT TO_CHAR(MIN(LUNCH_DATE), 'Month DD, YYYY, Day') AS MIN_DATE, 
    TO_CHAR(MAX(LUNCH_DATE), 'Month DD, YYYY, Day') AS MAX_DATE
FROM LUNCH;

/*Results
MIN_DATE                  MAX_DATE                 
------------------------- -------------------------
May       22, 2021, Satur June      23, 2021, Wedne
day                       sday                     

Explanation: in this query, we search and reformat the latest and oldest lunch dates in the LUNCH table and then use them to form the new corresponding 
columns: MIN_DATE and MAX_DATEa
*/
/*QUESTION 6A*/
SELECT SUPPLIER_ID,
       COUNT(*) AS ITEM_COUNT,
       TO_CHAR(SUM(PRICE), '$999.99') AS TOTAL_PRICE,
       TO_CHAR(AVG(PRICE), '$999.99') AS AVG_PRICE
FROM FOOD
GROUP BY SUPPLIER_ID;
/* Results:
SUP ITEM_COUNT TOTAL_PR AVG_PRIC
--- ---------- -------- --------
Lss          2   $10.80    $5.40
Gls          3    $9.70    $3.23
Blu          2   $10.30    $5.15
Crm          4   $25.05    $6.26
Dpz          3   $10.25    $3.42
Lak          3   $14.10    $4.70
Hsd          4   $23.50    $5.88
Foi          4   $14.75    $3.69
Ard          3   $12.75    $4.25
Jd6          3    $7.25    $2.42
Jmd          4   $18.60    $4.65

11 rows selected. 
*/
/*Question 6B*/
SELECT SUPPLIER_ID,
       COUNT(SUPPLIER_ID) AS ITEM_COUNT,
       TO_CHAR(SUM(PRICE), '$999.99') AS TOTAL_PRICE,
       TO_CHAR(AVG(PRICE), '$999.99') AS AVG_PRICE
FROM FOOD
GROUP BY SUPPLIER_ID;

/*Results: 
SUP ITEM_COUNT TOTAL_PR AVG_PRIC
--- ---------- -------- --------
Lss          2   $10.80    $5.40
Gls          3    $9.70    $3.23
Blu          2   $10.30    $5.15
Crm          4   $25.05    $6.26
Dpz          3   $10.25    $3.42
Lak          3   $14.10    $4.70
Hsd          4   $23.50    $5.88
Foi          4   $14.75    $3.69
Ard          3   $12.75    $4.25
Jd6          3    $7.25    $2.42
Jmd          4   $18.60    $4.65

11 rows selected. 
*/
/*Question 6C*/
SELECT SUPPLIER_ID,
       COUNT(PRICE_UPCHARGE) AS ITEM_COUNT,
       TO_CHAR(SUM(PRICE), '$999.99') AS TOTAL_PRICE,
       TO_CHAR(AVG(PRICE), '$999.99') AS AVG_PRICE
FROM FOOD
GROUP BY SUPPLIER_ID;
/*Results: 
SUP ITEM_COUNT TOTAL_PR AVG_PRIC
--- ---------- -------- --------
Lss          0   $10.80    $5.40
Gls          1    $9.70    $3.23
Blu          1   $10.30    $5.15
Crm          4   $25.05    $6.26
Dpz          1   $10.25    $3.42
Lak          1   $14.10    $4.70
Hsd          3   $23.50    $5.88
Foi          2   $14.75    $3.69
Ard          0   $12.75    $4.25
Jd6          3    $7.25    $2.42
Jmd          3   $18.60    $4.65

11 rows selected. 
*/

/*Question 7*/
SELECT SUPPLIER_ID,
       PRICE_UPCHARGE,
       COUNT(*) AS ITEM_COUNT,
       TO_CHAR(SUM(PRICE), '$999.99') AS TOTAL_PRICE,
       TO_CHAR(AVG(PRICE), '$999.99') AS AVG_PRICE
FROM FOOD
GROUP BY SUPPLIER_ID, PRICE_UPCHARGE
ORDER BY SUPPLIER_ID, PRICE_UPCHARGE;

/*Results:
SUP PRICE_UPCHARGE ITEM_COUNT TOTAL_PR AVG_PRIC
--- -------------- ---------- -------- --------
Ard                         3   $12.75    $4.25
Blu             .5          1    $7.50    $7.50
Blu                         1    $2.80    $2.80
Crm            .25          1    $4.00    $4.00
Crm             .3          1    $7.20    $7.20
Crm             .4          1    $5.25    $5.25
Crm             .7          1    $8.60    $8.60
Dpz            .25          1    $1.00    $1.00
Dpz                         2    $9.25    $4.63
Foi            .05          1    $4.00    $4.00
Foi             .2          1    $4.75    $4.75

SUP PRICE_UPCHARGE ITEM_COUNT TOTAL_PR AVG_PRIC
--- -------------- ---------- -------- --------
Foi                         2    $6.00    $3.00
Gls             .5          1    $3.50    $3.50
Gls                         2    $6.20    $3.10
Hsd            .25          1    $5.75    $5.75
Hsd             .5          2   $13.50    $6.75
Hsd                         1    $4.25    $4.25
Jd6            .15          1    $1.55    $1.55
Jd6            .25          2    $5.70    $2.85
Jmd            .15          2   $10.85    $5.43
Jmd             .5          1    $1.50    $1.50
Jmd                         1    $6.25    $6.25

SUP PRICE_UPCHARGE ITEM_COUNT TOTAL_PR AVG_PRIC
--- -------------- ---------- -------- --------
Lak             .5          1    $5.50    $5.50
Lak                         2    $8.60    $4.30
Lss                         2   $10.80    $5.40

25 rows selected. 
*/

/*Question 8A*/
SELECT DEPT_CODE,
       SUM(CREDIT_LIMIT) AS TOTAL_CREDIT
FROM WORKER
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE;

/*Results:
DEP TOTAL_CREDIT
--- ------------
Acc           72
Aud           69
Com           22
Exe           45
Fin           48
Hmn           66
Leg           87
Sal           53
Srv           89
Tch          137
             202

11 rows selected. 
*/

/*Question 8B*/
SELECT DEPT_CODE,
       CITY,
       SUM(CREDIT_LIMIT) AS TOTAL_CREDIT
FROM WORKER
GROUP BY DEPT_CODE, CITY
ORDER BY DEPT_CODE, CITY;

/*Results:

DEP CITY                           TOTAL_CREDIT
--- ------------------------------ ------------
Acc Hinsdale                                 24
Acc Oak Brook                                30
Acc                                          18
Aud Aurora                                   25
Aud Chicago                                  22
Aud                                          22
Com Glencoe                                  22
Exe Aurora                                   45
Fin Evanston                                 28
Fin Glencoe                                  20
Hmn Chicago                                  17

DEP CITY                           TOTAL_CREDIT
--- ------------------------------ ------------
Hmn Oak Brook                                49
Leg Oak Brook                                55
Leg Wilmette                                 32
Sal Chicago                                  33
Sal Wilmette                                 20
Srv Evanston                                 30
Srv Hinsdale                                 26
Srv Oak Brook                                33
Tch Chicago                                  27
Tch Evanston                                 25
Tch Hinsdale                                 60

DEP CITY                           TOTAL_CREDIT
--- ------------------------------ ------------
Tch                                          25
    Aurora                                   25
    Chicago                                  27
    Glencoe                                  25
    Hinsdale                                 20
    Wilmette                                 50
                                             55

29 rows selected. 
*/

/* Question 8C */
SELECT dept_code,
       city,
       COUNT(*) AS WORKER_COUNT,
       SUM(credit_limit) AS TOTAL_CREDIT
FROM WORKER
GROUP BY dept_code, city
ORDER BY dept_code, city;

/*Results:
DEP CITY                           WORKER_COUNT TOTAL_CREDIT
--- ------------------------------ ------------ ------------
Acc Hinsdale                                  1           24
Acc Oak Brook                                 1           30
Acc                                           1           18
Aud Aurora                                    1           25
Aud Chicago                                   1           22
Aud                                           1           22
Com Glencoe                                   1           22
Exe Aurora                                    1           45
Fin Evanston                                  1           28
Fin Glencoe                                   1           20
Hmn Chicago                                   1           17

DEP CITY                           WORKER_COUNT TOTAL_CREDIT
--- ------------------------------ ------------ ------------
Hmn Oak Brook                                 2           49
Leg Oak Brook                                 2           55
Leg Wilmette                                  1           32
Sal Chicago                                   1           33
Sal Wilmette                                  1           20
Srv Evanston                                  1           30
Srv Hinsdale                                  1           26
Srv Oak Brook                                 1           33
Tch Chicago                                   1           27
Tch Evanston                                  1           25
Tch Hinsdale                                  2           60

DEP CITY                           WORKER_COUNT TOTAL_CREDIT
--- ------------------------------ ------------ ------------
Tch                                           1           25
    Aurora                                    1           25
    Chicago                                   1           27
    Glencoe                                   1           25
    Hinsdale                                  1           20
    Wilmette                                  2           50
                                              2           55

29 rows selected. 
*/

/*Question 8D*/
SELECT dept_code,
       city,
       COUNT(*) AS WORKER_COUNT,
       SUM(credit_limit) AS TOTAL_CREDIT
FROM WORKER
WHERE hire_date > TO_DATE('12/31/2013', 'MM/DD/YYYY')
GROUP BY dept_code, city
ORDER BY dept_code, city;

/*Results:
DEP CITY                           WORKER_COUNT TOTAL_CREDIT
--- ------------------------------ ------------ ------------
Aud Aurora                                    1           25
Hmn Oak Brook                                 2           49
Leg Oak Brook                                 2           55
Leg Wilmette                                  1           32
Sal Wilmette                                  1           20
Srv Evanston                                  1           30
Tch Chicago                                   1           27
Tch Hinsdale                                  2           60
    Chicago                                   1           27
    Glencoe                                   1           25
                                              1           23

11 rows selected. 
*/

/*Question 8E*/
SELECT dept_code,
       city,
       COUNT(*) AS WORKER_COUNT,
       SUM(credit_limit) AS TOTAL_CREDIT
FROM WORKER
WHERE hire_date > TO_DATE('12/31/2013', 'MM/DD/YYYY')
GROUP BY dept_code, city
HAVING SUM(credit_limit) > 30
ORDER BY dept_code, city;

/*Results:
DEP CITY                           WORKER_COUNT TOTAL_CREDIT
--- ------------------------------ ------------ ------------
Hmn Oak Brook                                 2           49
Leg Oak Brook                                 2           55
Leg Wilmette                                  1           32
Tch Hinsdale                                  2           60

*/

/*Question 9*/
SELECT supplier_id,
       product_code,
       description,
       price
FROM FOOD
WHERE price < (SELECT AVG(price) FROM FOOD);

/*Results:
SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Ard Ds PB Cookie                  1.25
Hsd Sp Chicken Soup               4.25
Crm Br Wheat Bagel                   4
Foi Vt Broccoli Salad                4
Foi Ff French Fries                1.5
Jd6 Vr Soda                       2.25
Jd6 Cf Coffee                     1.55
Jd6 Ds Brownie                    3.45
Jmd Vr Iced Tea                   2.85
Jmd Vt Cole Slaw                   1.5
Dpz Br Dinner Roll                   1

SUP PR DESCRIPTION               PRICE
--- -- -------------------- ----------
Dpz Sc Cheese Sauce                .75
Gls Ds Sugar Cookie                3.5
Gls Br Breadstick                 1.25
Blu Cp Chips                       2.8
Lak Br Cheese Stick               2.35

16 rows selected. 
*/

/*Question 9B*/
SELECT ROUND(AVG(price), 2) AS AVERAGE_PRICE
FROM FOOD;

/*Results:
AVERAGE_PRICE
-------------
         4.49
         
*/