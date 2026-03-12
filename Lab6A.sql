/*
Bao Luu
CNIT 27200 Spring 2026
Lab time: 9:30-11:30am Wednesday
Duration: 2 hours
********************************************************************************
Question 1A
*/
SELECT FS.SUPPLIER_ID, FS.SUPPLIER_NAME, F.PRODUCT_CODE, F.DESCRIPTION, F.PRICE
FROM FOOD_SUPPLIER FS INNER JOIN FOOD F
ON FS.SUPPLIER_ID = F.SUPPLIER_ID
WHERE FS.SUPPLIER_NAME LIKE '%Bakery%'
ORDER BY FS.SUPPLIER_ID;
/* Results:
SUP SUPPLIER_NAME                  PR DESCRIPTION               PRICE
--- ------------------------------ -- -------------------- ----------
Lak Lakeshore Bakery               Br Cheese Stick               2.35
Lak Lakeshore Bakery               Sd Spinach Salad              6.25
Lak Lakeshore Bakery               Sw Caprese                     5.5
*/

/* Question 1B */
SELECT FS.SUPPLIER_ID, FS.SUPPLIER_NAME, F.PRODUCT_CODE, F.DESCRIPTION, F.PRICE
FROM FOOD_SUPPLIER FS LEFT OUTER JOIN FOOD F
ON FS.SUPPLIER_ID = F.SUPPLIER_ID
WHERE FS.SUPPLIER_NAME LIKE '%Bakery%';
/*Results:
SUP SUPPLIER_NAME                  PR DESCRIPTION               PRICE
--- ------------------------------ -- -------------------- ----------
Lak Lakeshore Bakery               Sw Caprese                     5.5
Lak Lakeshore Bakery               Sd Spinach Salad              6.25
Lak Lakeshore Bakery               Br Cheese Stick               2.35
Rby Rosemont Bakery                                                  
Har Harold Bakery                                                    
*/

/*Question 1C*/
SELECT FS.SUPPLIER_ID, FS.SUPPLIER_NAME, F.PRODUCT_CODE, F.DESCRIPTION, F.PRICE
FROM FOOD_SUPPLIER FS LEFT JOIN FOOD F
ON FS.SUPPLIER_ID = F.SUPPLIER_ID
WHERE FS.SUPPLIER_NAME LIKE '%Bakery%' AND F.SUPPLIER_ID IS NULL;
/* Results: 
SUP SUPPLIER_NAME                  PR DESCRIPTION               PRICE
--- ------------------------------ -- -------------------- ----------
Rby Rosemont Bakery                                                  
Har Harold Bakery                                                    
*/

/* Question 2ABC */
SELECT F.PRODUCT_CODE, F.DESCRIPTION, SUM(F.PRICE*LI.QUANTITY) AS TOTAL_PURCHASE
FROM FOOD F LEFT JOIN LUNCH_ITEM LI
ON F.SUPPLIER_ID = LI.SUPPLIER_ID AND F.PRODUCT_CODE = LI.PRODUCT_CODE
GROUP BY F.PRODUCT_CODE, F.DESCRIPTION;

/*Results:
PR DESCRIPTION          TOTAL_PURCHASE
-- -------------------- --------------
Cp Chips                           5.6
Sw Turkey Club                     7.5
Br Dinner Roll                       8
Sw Chicken Avocado Wrap               
Ps Philly Melt                   103.2
Sw Grilled Cheese                60.55
Vr Mango Smoothie                     
Cs Chef Salad                     80.5
Ds Yellow Cake                      27
Vr Iced Tea                       28.5
Br Wheat Bagel                       4

PR DESCRIPTION          TOTAL_PURCHASE
-- -------------------- --------------
Vt Broccoli Salad                    4
Sp Chicken Soup                  55.25
Ds Brownie                        34.5
Pz Cheese Pizza                     34
Ff French Fries                   16.5
Cf Coffee                          9.3
Pz Mushroom Pizza                   24
Ds Apple Pie                      13.5
Sp Barley Soup                      19
Ds Sugar Cookie                   31.5
Pp Protein Box                      18

PR DESCRIPTION          TOTAL_PURCHASE
-- -------------------- --------------
Hb Ham Melt                         72
Vr Soda                          56.25
Sp Potato Soup                    6.25
Sp Veggie Soup                     9.7
Ds PB Cookie                          
Pz Veggie Pizza                     25
Br Breadstick                     1.25
Vt Cole Slaw                          
Br Cheese Stick                  11.75
Sd Spinach Salad                  12.5
Sc Cheese Sauce                    1.5

PR DESCRIPTION          TOTAL_PURCHASE
-- -------------------- --------------
Sw Caprese                          11

34 rows selected. 
*/

/* Question 2EF */
SELECT F.PRODUCT_CODE, F.DESCRIPTION, SUM(F.PRICE*LI.QUANTITY) AS TOTAL_PURCHASE
FROM FOOD F INNER JOIN LUNCH_ITEM LI
ON F.SUPPLIER_ID = LI.SUPPLIER_ID AND F.PRODUCT_CODE = LI.PRODUCT_CODE
GROUP BY F.PRODUCT_CODE, F.DESCRIPTION;
/* Results:
PR DESCRIPTION          TOTAL_PURCHASE
-- -------------------- --------------
Cp Chips                           5.6
Sw Turkey Club                     7.5
Br Dinner Roll                       8
Ps Philly Melt                   103.2
Sw Grilled Cheese                60.55
Cs Chef Salad                     80.5
Ds Yellow Cake                      27
Vr Iced Tea                       28.5
Br Wheat Bagel                       4
Vt Broccoli Salad                    4
Sp Chicken Soup                  55.25

PR DESCRIPTION          TOTAL_PURCHASE
-- -------------------- --------------
Ds Brownie                        34.5
Pz Cheese Pizza                     34
Ff French Fries                   16.5
Cf Coffee                          9.3
Pz Mushroom Pizza                   24
Ds Apple Pie                      13.5
Sp Barley Soup                      19
Ds Sugar Cookie                   31.5
Pp Protein Box                      18
Hb Ham Melt                         72
Vr Soda                          56.25

PR DESCRIPTION          TOTAL_PURCHASE
-- -------------------- --------------
Sp Potato Soup                    6.25
Sp Veggie Soup                     9.7
Pz Veggie Pizza                     25
Br Breadstick                     1.25
Br Cheese Stick                  11.75
Sd Spinach Salad                  12.5
Sc Cheese Sauce                    1.5
Sw Caprese                          11

30 rows selected. 
*/

/* Question 3A */
SET LINESPACE 200;
SELECT W.WORKER_ID, W.LAST_NAME, W.PHONE_NUMBER, W.DEPT_CODE, D.DEPARTMENT_NAME
FROM WORKER W INNER JOIN DEPARTMENT D
ON W.DEPT_CODE = D.DEPT_CODE
ORDER BY W.LAST_NAME;
/* RESULTS:
WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
587 Alveral              7667 Leg Legal                         
558 Campbell             7591 Hmn Human Resources               
565 Cross                2974 Tch Technology                    
585 Frank                7655 Srv Service                       
580 Gonzalez             4455 Acc Accounting                    
557 Gradle               8438 Leg Legal                         
584 Harney               2349 Tch Technology                    
571 Harris               5543 Hmn Human Resources               
576 Jones                3359 Tch Technology                    
564 Kingman              3357 Sal Sales                         
577 Martin               2977 Sal Sales                         

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
559 Neal                 6830 Srv Service                       
578 Rayner               2347 Tch Technology                    
569 Reynolds             3830 Fin Finance                       
567 Richards             4446 Leg Legal                         
560 Ridgeman             5286 Aud Auditing                      
562 Sanchez              5799 Com Compliance                    
555 Shreve               3484 Exe Executive                     
575 Smith                3831 Fin Finance                       
556 Sumner               8722 Tch Technology                    
582 Templeton            4465 Acc Accounting                    
566 Tevona               2346 Hmn Human Resources               

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
570 Trance               3358 Aud Auditing                      
563 Vought               1752 Acc Accounting                    
581 Walsh                4460 Srv Service                       
573 White                2976 Aud Auditing                      

26 rows selected. 
*/

/*Question 3B */
SELECT W.WORKER_ID, W.LAST_NAME, W.PHONE_NUMBER, W.DEPT_CODE, D.DEPARTMENT_NAME
FROM DEPARTMENT D RIGHT JOIN WORKER W
ON W.DEPT_CODE = D.DEPT_CODE
ORDER BY W.LAST_NAME;
/* Results:
WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
587 Alveral              7667 Leg Legal                         
561 Bensen               3829                                   
558 Campbell             7591 Hmn Human Resources               
565 Cross                2974 Tch Technology                    
585 Frank                7655 Srv Service                       
580 Gonzalez             4455 Acc Accounting                    
557 Gradle               8438 Leg Legal                         
584 Harney               2349 Tch Technology                    
571 Harris               5543 Hmn Human Resources               
574 Irwin                5800                                   
572 Johnson              5544                                   

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
576 Jones                3359 Tch Technology                    
564 Kingman              3357 Sal Sales                         
577 Martin               2977 Sal Sales                         
583 Montre               3832                                   
559 Neal                 6830 Srv Service                       
578 Rayner               2347 Tch Technology                    
569 Reynolds             3830 Fin Finance                       
567 Richards             4446 Leg Legal                         
560 Ridgeman             5286 Aud Auditing                      
579 Rivera               4450                                   
562 Sanchez              5799 Com Compliance                    

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
555 Shreve               3484 Exe Executive                     
575 Smith                3831 Fin Finance                       
556 Sumner               8722 Tch Technology                    
582 Templeton            4465 Acc Accounting                    
566 Tevona               2346 Hmn Human Resources               
570 Trance               3358 Aud Auditing                      
563 Vought               1752 Acc Accounting                    
588 Walsh                2350                                   
581 Walsh                4460 Srv Service                       
573 White                2976 Aud Auditing                      
586 Williams             5801                                   

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
568 Young                2975                                   

34 rows selected. 
*/

/* Question 3C*/
SELECT W.WORKER_ID, W.LAST_NAME, W.PHONE_NUMBER, W.DEPT_CODE, D.DEPARTMENT_NAME
FROM DEPARTMENT D LEFT JOIN WORKER W
ON D.DEPT_CODE = W.DEPT_CODE
ORDER BY W.LAST_NAME;

/*Results:
WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
587 Alveral              7667 Leg Legal                         
558 Campbell             7591 Hmn Human Resources               
565 Cross                2974 Tch Technology                    
585 Frank                7655 Srv Service                       
580 Gonzalez             4455 Acc Accounting                    
557 Gradle               8438 Leg Legal                         
584 Harney               2349 Tch Technology                    
571 Harris               5543 Hmn Human Resources               
576 Jones                3359 Tch Technology                    
564 Kingman              3357 Sal Sales                         
577 Martin               2977 Sal Sales                         

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
559 Neal                 6830 Srv Service                       
578 Rayner               2347 Tch Technology                    
569 Reynolds             3830 Fin Finance                       
567 Richards             4446 Leg Legal                         
560 Ridgeman             5286 Aud Auditing                      
562 Sanchez              5799 Com Compliance                    
555 Shreve               3484 Exe Executive                     
575 Smith                3831 Fin Finance                       
556 Sumner               8722 Tch Technology                    
582 Templeton            4465 Acc Accounting                    
566 Tevona               2346 Hmn Human Resources               

WOR LAST_NAME            PHON DEP DEPARTMENT_NAME               
--- -------------------- ---- --- ------------------------------
570 Trance               3358 Aud Auditing                      
563 Vought               1752 Acc Accounting                    
581 Walsh                4460 Srv Service                       
573 White                2976 Aud Auditing                      
                                  Shipping                      
                                  Engineering                   
                                  Purchasing                    
                                  Marketing                     
                                  Facilities                    

31 rows selected. 
*/

/* Question 3D*/
SELECT DEPT_CODE, DEPARTMENT_NAME
FROM DEPARTMENT
WHERE DEPT_CODE NOT IN (
    SELECT DEPT_CODE FROM WORKER
    WHERE DEPT_CODE IS NOT NULL
)
ORDER BY DEPT_CODE;
/* Results: 
DEP DEPARTMENT_NAME               
--- ------------------------------
Eng Engineering                   
Fac Facilities                    
Mkt Marketing                     
Pur Purchasing                    
Shp Shipping                      
*/
/* Question 4A */
SELECT SUPPLIER_NAME, SUPPLIER_CITY
FROM FOOD_SUPPLIER
WHERE SUPPLIER_CITY IN ('Chicago', 'Naperville', 'Aurora')
UNION
SELECT FIRST_NAME || ' ' || LAST_NAME, CITY
FROM WORKER
WHERE CITY IN ('Chicago', 'Naperville', 'Aurora')
ORDER BY SUPPLIER_CITY;

/* Results:
SUPPLIER_NAME                   SUPPLIER_CITY                 
------------------------------- ------------------------------
Avery Trance                    Aurora                        
Dane Shreve                     Aurora                        
Fresh Daily Vegetables          Aurora                        
Lucias Sub Shop                 Aurora                        
Tonya Montre                    Aurora                        
Downtowner Pizza                Chicago                       
Fontinas Italian                Chicago                       
Gail Walsh                      Chicago                       
Giovana and Sons                Chicago                       
Harper Street Deli              Chicago                       
James Kingman                   Chicago                       

SUPPLIER_NAME                   SUPPLIER_CITY                 
------------------------------- ------------------------------
Jared Ridgeman                  Chicago                       
Jebston Montrose Deli           Chicago                       
Lakeshore Bakery                Chicago                       
Skyler Harris                   Chicago                       
Tyler Harney                    Chicago                       
Under the Metra                 Chicago                       

17 rows selected. 
*/

/* Question 5 */
SELECT CITY FROM WORKER
INTERSECT
SELECT SUPPLIER_CITY FROM FOOD_SUPPLIER;

/* Results:
CITY                          
------------------------------
Aurora
Chicago
Glencoe
Hinsdale
Oak Brook
Wilmette

6 rows selected. 
*/

/* Question 6A */
SELECT DISTINCT NVL(SUPPLIER_CITY, 'Missing City') AS CITY
FROM FOOD_SUPPLIER;
/* Results:
CITY                          
------------------------------
Oak Brook
Aurora
Orland Park
Chicago
Wilmette
Glencoe
Hinsdale

7 rows selected. 
*/

/* Question 6B */
SELECT DISTINCT NVL(CITY, 'Missing City') AS CITY
FROM WORKER;
/* Results:
CITY                          
------------------------------
Aurora
Oak Brook
Missing City
Chicago
Wilmette
Evanston
Hinsdale
Glencoe

8 rows selected. 
*/

/* Question 6C */
SELECT DISTINCT NVL(SUPPLIER_CITY, 'Missing City') AS CITY
FROM FOOD_SUPPLIER
MINUS
SELECT DISTINCT NVL(CITY, 'Missing City') AS CITY
FROM WORKER;
/* Results:
CITY                          
------------------------------
Orland Park
*/

/* Question 6D */
SELECT DISTINCT NVL(CITY, 'Missing City') AS CITY
FROM WORKER
MINUS
SELECT DISTINCT NVL(SUPPLIER_CITY, 'Missing City') AS CITY
FROM FOOD_SUPPLIER;
/* Results:
CITY                          
------------------------------
Evanston
Missing City
*/