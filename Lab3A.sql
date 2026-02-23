/*
Bao Luu
CNIT 27200 Spring 2026
Lab Time: Wednesday 9:30am
Duration: 2 hours
********************************************************************************
Question 1
*/

SELECT * FROM FOOD_SUPPLIER;

/* Results:
SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Ard Arnoldo Deli                   Glencoe                       
Hsd Harper Street Deli             Chicago                       
Crm Crystal Market                 Hinsdale                      
Foi Fontinas Italian               Chicago                       
Fas Framer and Samson              Orland Park                   
Jd6 Justin's Deli at 652           Oak Brook                     
Jmd Jebston Montrose Deli          Chicago                       
Rby Rosemont Bakery                Glencoe                       
Lss Lucias Sub Shop                Aurora                        
Har Harold Bakery                  Hinsdale                      
Dpz Downtowner Pizza               Chicago                       

SUP SUPPLIER_NAME                  SUPPLIER_CITY                 
--- ------------------------------ ------------------------------
Gls Great Lakes Station            Wilmette                      
Gio Giovana and Sons               Chicago                       
Blu Blue Sky Deli                  Oak Brook                     
Lak Lakeshore Bakery               Chicago                       
Met Under the Metra                Chicago                       
Fdv Fresh Daily Vegetables         Aurora                        

17 rows selected. 

    Explanation: In this query, we searched for all values of the table FOOD_SUPPLIER
*/


/*
********************************************************************************
Question 2
*/

DESC WORKER;
SELECT FIRST_NAME, LAST_NAME, DEPT_CODE, HIRE_DATE FROM WORKER;

/* Results:
FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Dane       Shreve               Exe 18-MAR-04
Carole     Sumner               Tch 17-JUL-16
Rita       Gradle               Leg 23-MAR-14
Melody     Campbell             Hmn 24-MAY-18
Tom        Neal                 Srv 01-APR-13
Jared      Ridgeman             Aud 01-OCT-12
Maria      Bensen                   15-SEP-07
Jose       Sanchez              Com 01-JUL-12
Trey       Vought               Acc 01-NOV-13
James      Kingman              Sal 17-DEC-06
Latesha    Cross                Tch 15-FEB-04

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Tami       Tevona               Hmn 21-AUG-19
Darius     Richards             Leg 12-JAN-14
Taylor     Young                    12-NOV-07
Blair      Reynolds             Fin 07-FEB-13
Avery      Trance               Aud 19-JUN-18
Skyler     Harris               Hmn 28-MAR-05
Chase      Johnson                  11-DEC-12
Cleo       White                Aud 22-MAY-11
Cassie     Irwin                    13-SEP-03
Shawn      Smith                Fin 19-APR-12
Keyanna    Jones                Tch 15-MAR-19

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Carey      Martin               Sal 19-NOV-19
Katelynn   Rayner               Tch 07-OCT-11
Yvonne     Rivera                   13-NOV-15
Roy        Gonzalez             Acc 19-DEC-11
Brooks     Walsh                Srv 21-APR-07
Angie      Templeton            Acc 19-JUN-07
Tonya      Montre                   07-MAR-12
Tyler      Harney               Tch 07-MAR-18
Sam        Frank                Srv 22-JUL-16
Jodie      Williams                 16-MAR-19
Kerry      Alveral              Leg 22-MAY-18

FIRST_NAME LAST_NAME            DEP HIRE_DATE
---------- -------------------- --- ---------
Gail       Walsh                    22-MAR-21

34 rows selected.

    Explanation: In this query, we searched for all values in the WORKER table, but 
    only display their first name, last name, department code, and hire date.
*/

/*
Question 3A
*/

SELECT WORKER_ID, LAST_NAME, DEPT_CODE, CITY 
FROM WORKER
WHERE DEPT_CODE = 'Fin' OR CITY = 'Chicago';

/* Results:
WOR LAST_NAME            DEP CITY                          
--- -------------------- --- ------------------------------
560 Ridgeman             Aud Chicago                       
564 Kingman              Sal Chicago                       
569 Reynolds             Fin Evanston                      
571 Harris               Hmn Chicago                       
575 Smith                Fin Glencoe                       
584 Harney               Tch Chicago                       
588 Walsh                    Chicago                       

7 rows selected. 

    Explanation: In this query, we searched for the Worker ID, last name, department code,
    and city of all the values in the WORKER table that either from the Finance 
    department or the city of Chicago
*/

/*
Question 3B
*/

SELECT WORKER_ID, LAST_NAME, DEPT_CODE, CITY 
FROM WORKER
WHERE DEPT_CODE = 'Aud' OR DEPT_CODE = 'Sal';

/* Results:
WOR LAST_NAME            DEP CITY                          
--- -------------------- --- ------------------------------
560 Ridgeman             Aud Chicago                       
564 Kingman              Sal Chicago                       
570 Trance               Aud Aurora                        
573 White                Aud                               
577 Martin               Sal Wilmette                  

    Explanation: In this query, we searched for the Worker ID, last name, department code,
    and city of all the values in the WORKER table that either from the Auditing
    or the Sales department
*/

/*
Question 4A
*/

SELECT DEPT_CODE FROM WORKER;
SELECT DEPT_CODE FROM DEPARTMENT;

/* Results:
DEP
---
Exe
Tch
Leg
Hmn
Srv
Aud

Com
Acc
Sal
Tch

DEP
---
Hmn
Leg

Fin
Aud
Hmn

Aud

Fin
Tch

DEP
---
Sal
Tch

Acc
Srv
Acc

Tch
Srv

Leg

DEP
---


34 rows selected. 


DEP
---
Acc
Aud
Com
Eng
Exe
Fac
Fin
Hmn
Leg
Mkt
Pur

DEP
---
Sal
Shp
Srv
Tch

15 rows selected. 

    Explanation: In this query, the number of values are not the same because the
    department table has each of the department unique, unlike the previous query 
    with larger number of rows due to us searching for ALL VALUES in the table but
    just list the department code. 

*/

/*
Question 4B
*/

SELECT DISTINCT DEPT_CODE FROM WORKER;

/* Results:
DEP
---
Aud
Sal
Leg
Hmn
Acc
Tch

Fin
Exe
Com
Srv

11 rows selected. 

    Explanation: The query now has 11 rows, smaller than 15 rows in the department 
    table because the worker table does not have enough workers from ALL departments 
    available.
*/

/*
Question 5
*/

SELECT SUPPLIER_NAME 
FROM FOOD_SUPPLIER
WHERE SUPPLIER_NAME LIKE '%B%' OR SUPPLIER_NAME LIKE '%b%';

/* Results:
SUPPLIER_NAME                 
------------------------------
Jebston Montrose Deli
Rosemont Bakery
Lucias Sub Shop
Harold Bakery
Blue Sky Deli
Lakeshore Bakery
Fresh Daily Vegetables

7 rows selected. 

    Explanation: In this query, we searched for all values but only show the supplier 
    name but only if the supplier name value contains a B or b.
*/

/*
Question 6
*/

SELECT WORKER_ID, LAST_NAME, HIRE_DATE, DEPT_CODE
FROM WORKER
WHERE HIRE_DATE >= '01-JAN-2015' AND HIRE_DATE <= '31-DEC-2020';

SELECT WORKER_ID, LAST_NAME, HIRE_DATE, DEPT_CODE
FROM WORKER
WHERE HIRE_DATE BETWEEN '01-JAN-2015' AND '31-DEC-2020';

/* Results: 
WOR LAST_NAME            HIRE_DATE DEP
--- -------------------- --------- ---
556 Sumner               17-JUL-16 Tch
558 Campbell             24-MAY-18 Hmn
566 Tevona               21-AUG-19 Hmn
570 Trance               19-JUN-18 Aud
576 Jones                15-MAR-19 Tch
577 Martin               19-NOV-19 Sal
579 Rivera               13-NOV-15    
584 Harney               07-MAR-18 Tch
585 Frank                22-JUL-16 Srv
586 Williams             16-MAR-19    
587 Alveral              22-MAY-18 Leg

11 rows selected. 


WOR LAST_NAME            HIRE_DATE DEP
--- -------------------- --------- ---
556 Sumner               17-JUL-16 Tch
558 Campbell             24-MAY-18 Hmn
566 Tevona               21-AUG-19 Hmn
570 Trance               19-JUN-18 Aud
576 Jones                15-MAR-19 Tch
577 Martin               19-NOV-19 Sal
579 Rivera               13-NOV-15    
584 Harney               07-MAR-18 Tch
585 Frank                22-JUL-16 Srv
586 Williams             16-MAR-19    
587 Alveral              22-MAY-18 Leg

11 rows selected. 

    Explanation: In this query, we searched for all values in the WORKER table 
    with hire date between january 1, 2015 to december 31, 2020 but only show the 
    Worker ID, last name, hire date and department code. The query was done in 2 ways: 
    using comparison operators and using BETWEEN.
*/

/*
Question 7
*/

SELECT WORKER_ID, 
LAST_NAME, 
DEPT_CODE, 
CREDIT_LIMIT, 
CREDIT_LIMIT * 1.15 AS NEW_LIMIT
FROM WORKER;

/* Results:
WOR LAST_NAME            DEP CREDIT_LIMIT  NEW_LIMIT
--- -------------------- --- ------------ ----------
555 Shreve               Exe           45      51.75
556 Sumner               Tch           35      40.25
557 Gradle               Leg           32       36.8
558 Campbell             Hmn           28       32.2
559 Neal                 Srv           26       29.9
560 Ridgeman             Aud           22       25.3
561 Bensen                             25      28.75
562 Sanchez              Com           22       25.3
563 Vought               Acc           30       34.5
564 Kingman              Sal           33      37.95
565 Cross                Tch           25      28.75

WOR LAST_NAME            DEP CREDIT_LIMIT  NEW_LIMIT
--- -------------------- --- ------------ ----------
566 Tevona               Hmn           21      24.15
567 Richards             Leg           22       25.3
568 Young                              25      28.75
569 Reynolds             Fin           28       32.2
570 Trance               Aud           25      28.75
571 Harris               Hmn           17      19.55
572 Johnson                            20         23
573 White                Aud           22       25.3
574 Irwin                              32       36.8
575 Smith                Fin           20         23
576 Jones                Tch           25      28.75

WOR LAST_NAME            DEP CREDIT_LIMIT  NEW_LIMIT
--- -------------------- --- ------------ ----------
577 Martin               Sal           20         23
578 Rayner               Tch           25      28.75
579 Rivera                             23      26.45
580 Gonzalez             Acc           18       20.7
581 Walsh                Srv           33      37.95
582 Templeton            Acc           24       27.6
583 Montre                             25      28.75
584 Harney               Tch           27      31.05
585 Frank                Srv           30       34.5
586 Williams                           25      28.75
587 Alveral              Leg           33      37.95

WOR LAST_NAME            DEP CREDIT_LIMIT  NEW_LIMIT
--- -------------------- --- ------------ ----------
588 Walsh                              27      31.05

34 rows selected. 

    Explanation: In this query, we list all values in the WORKER table but only show 
    Worker ID, last name, department code, credit limit and a new limit that represents 
    a 15% increase from the current credit limit
*/

/*
Question 8
*/

SELECT WORKER_ID, FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, CITY
FROM WORKER
WHERE CITY NOT IN ('Oak Brook', 'Evanston', 'Chicago');

/* Results: 
WOR FULL_NAME                       CITY                          
--- ------------------------------- ------------------------------
555 Dane Shreve                     Aurora                        
556 Carole Sumner                   Hinsdale                      
557 Rita Gradle                     Wilmette                      
559 Tom Neal                        Hinsdale                      
561 Maria Bensen                    Wilmette                      
562 Jose Sanchez                    Glencoe                       
568 Taylor Young                    Wilmette                      
570 Avery Trance                    Aurora                        
572 Chase Johnson                   Hinsdale                      
575 Shawn Smith                     Glencoe                       
576 Keyanna Jones                   Hinsdale                      

WOR FULL_NAME                       CITY                          
--- ------------------------------- ------------------------------
577 Carey Martin                    Wilmette                      
582 Angie Templeton                 Hinsdale                      
583 Tonya Montre                    Aurora                        
586 Jodie Williams                  Glencoe                       

15 rows selected. 

    Explanation: In this query, we search for all values in the WORKER table but only 
    show the Worker ID, full name (concatenation of first and last name), and city but 
    exclude the values with city being either Oak Brook, Evanston, or Chicago
*/