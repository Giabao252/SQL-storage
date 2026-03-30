/*
Bao Luu
CNIT 27200 Spring 2026
Lab time: 9:30-11:30am Wednesday
Duration: 2 hours
********************************************************************************
Question 1
*/
CREATE TABLE F21TOOL (
    ToolID      CHAR(6) CONSTRAINT F21TOOL_PK PRIMARY KEY,
    PartName    VARCHAR2(50),
    Condition   VARCHAR2(20),
    Model       VARCHAR2(30),
    PurchaseDate DATE
);

ALTER TABLE F21TOOL
ADD Supplier VARCHAR2(30);

DESCRIBE F21TOOL;

DROP TABLE F21TOOL CASCADE CONSTRAINTS;

/* Results:
Table F21TOOL created.


Table F21TOOL altered.

Name         Null?    Type         
------------ -------- ------------ 
TOOLID       NOT NULL CHAR(6)      
PARTNAME              VARCHAR2(50) 
CONDITION             VARCHAR2(20) 
MODEL                 VARCHAR2(30) 
PURCHASEDATE          DATE         
SUPPLIER              VARCHAR2(30) 

Table F21TOOL dropped.
*/

/*QUESTION 2*/
CREATE TABLE F21ZIPCODE AS
SELECT POSTALCODE AS ZipCode, City, State FROM SUPPLIER
UNION
SELECT POSTALCODE AS ZipCode, City, State FROM EMPLOYEE
UNION
SELECT POSTALCODE AS ZipCode, City, State FROM CUSTOMER
UNION
SELECT SHIPPOSTALCODE AS ZipCode, ShipCity, ShipState FROM SHIPMENT;

-- B) Count rows (should be 301)
SELECT COUNT(*) FROM F21ZIPCODE;

-- C) List NY rows (should be 13)
SELECT ZipCode, City, State
FROM F21ZIPCODE
WHERE State = 'NY';

/* Results:
Table F21ZIPCODE created.


  COUNT(*)
----------
       301


ZIPCODE    CITY                 ST
---------- -------------------- --
10013      New York             NY
10044      New York City        NY
10131      New York             NY
10131      New York City        NY
12182      Troy                 NY
12211      Albany               NY
12553      Newburgh             NY
13261      Syracuse             NY
13442      Rome                 NY
13504      Utica                NY
13699      Potsdam              NY

ZIPCODE    CITY                 ST
---------- -------------------- --
14206      Buffalo              NY
14895      Wellsville           NY

13 rows selected. 
*/

/*Question 3*/
CREATE TABLE F21ROOM (
    RoomNum         CHAR(4)         CONSTRAINT F21ROOM_PK PRIMARY KEY,
    LastRemodel     DATE,
    MaxOccupany     INTEGER         NOT NULL,
    SquareFootage   NUMBER(5,2),
    RoomType        VARCHAR2(10),
    Amenities       VARCHAR2(50),
    FloorNum        INTEGER,
    NetworkPort     CHAR(7)         UNIQUE
);

DESCRIBE F21ROOM;

SELECT Constraint_Name, Constraint_Type, Status, Search_Condition
FROM USER_CONSTRAINTS
WHERE Table_Name = 'F21ROOM';

/* Results:
Table F21ROOM created.

Name          Null?    Type         
------------- -------- ------------ 
ROOMNUM       NOT NULL CHAR(4)      
LASTREMODEL            DATE         
MAXOCCUPANY   NOT NULL NUMBER(38)   
SQUAREFOOTAGE          NUMBER(5,2)  
ROOMTYPE               VARCHAR2(10) 
AMENITIES              VARCHAR2(50) 
FLOORNUM               NUMBER(38)   
NETWORKPORT            CHAR(7)      

CONSTRAINT_NAME                                                                                                                  C STATUS   SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - -------- --------------------------------------------------------------------------------
SYS_C00332667                                                                                                                    C ENABLED  "MAXOCCUPANY" IS NOT NULL                                                       
F21ROOM_PK                                                                                                                       P ENABLED                                                                                  
SYS_C00332669                                                                                                                    U ENABLED                                                                                  
*/

/* Question 4*/
ALTER TABLE F21ROOM
ADD Condition VARCHAR2(20);

DESCRIBE F21ROOM;

/* Results:

Table F21ROOM altered.

Name          Null?    Type         
------------- -------- ------------ 
ROOMNUM       NOT NULL CHAR(4)      
LASTREMODEL            DATE         
MAXOCCUPANY   NOT NULL NUMBER(38)   
SQUAREFOOTAGE          NUMBER(5,2)  
ROOMTYPE               VARCHAR2(10) 
AMENITIES              VARCHAR2(50) 
FLOORNUM               NUMBER(38)   
NETWORKPORT            CHAR(7)      
CONDITION              VARCHAR2(20) 
*/

/* Question 5 */
CREATE TABLE F21HOUSEKEEP (
    HKeepID      CHAR(7)         CONSTRAINT F21HK_PK PRIMARY KEY,
    Name         VARCHAR2(50),
    Email        VARCHAR2(50)    UNIQUE,
    ContractDate DATE
);

DESCRIBE F21HOUSEKEEP;
/* Results:
Table F21HOUSEKEEP created.

Name         Null?    Type         
------------ -------- ------------ 
HKEEPID      NOT NULL CHAR(7)      
NAME                  VARCHAR2(50) 
EMAIL                 VARCHAR2(50) 
CONTRACTDATE          DATE         
*/

/* Question 6 */
CREATE TABLE F21CLEANING (
    HKeepID         CHAR(7),
    RoomNum         CHAR(4),
    CleaningDate    DATE,
    CleaningFee     NUMBER(8,2),
    WorkHours       NUMBER(5,2),
    StatementofWork VARCHAR2(100),
    CONSTRAINT F21CLEAN_PK PRIMARY KEY (HKeepID, RoomNum, CleaningDate)
);


ALTER TABLE F21CLEANING
ADD CONSTRAINT F21HK_FK FOREIGN KEY (HKeepID)
REFERENCES F21HOUSEKEEP(HKeepID);

ALTER TABLE F21CLEANING
ADD CONSTRAINT F21RM_FK FOREIGN KEY (RoomNum)
REFERENCES F21ROOM(RoomNum);

DESCRIBE F21CLEANING;

/* Results: 
Table F21CLEANING altered.

Name            Null?    Type          
--------------- -------- ------------- 
HKEEPID         NOT NULL CHAR(7)       
ROOMNUM         NOT NULL CHAR(4)       
CLEANINGDATE    NOT NULL DATE          
CLEANINGFEE              NUMBER(8,2)   
WORKHOURS                NUMBER(5,2)   
STATEMENTOFWORK          VARCHAR2(100) 
*/

/* Question 7 */
CREATE TABLE F21CATEGORY (
    CleanType   CHAR(6)         CONSTRAINT F21CAT_PK PRIMARY KEY,
    Description VARCHAR2(50),
    Chemical    VARCHAR2(50)
);

DESCRIBE F21CATEGORY;

ALTER TABLE F21CLEANING
ADD CleanType CHAR(6);

ALTER TABLE F21CLEANING
ADD CONSTRAINT F21CAT_FK FOREIGN KEY (CleanType)
REFERENCES F21CATEGORY(CleanType);

DESCRIBE F21CLEANING;

/* Results:
Table F21CLEANING altered.

Name            Null?    Type          
--------------- -------- ------------- 
HKEEPID         NOT NULL CHAR(7)       
ROOMNUM         NOT NULL CHAR(4)       
CLEANINGDATE    NOT NULL DATE          
CLEANINGFEE              NUMBER(8,2)   
WORKHOURS                NUMBER(5,2)   
STATEMENTOFWORK          VARCHAR2(100) 
CLEANTYPE                CHAR(6)       
*/

/* Question 8 */
ALTER TABLE F21CLEANING
ADD CONSTRAINT CLEAN_CK CHECK (WorkHours > 0);
/* Results:
Name            Null?    Type          
--------------- -------- ------------- 
HKEEPID         NOT NULL CHAR(7)       
ROOMNUM         NOT NULL CHAR(4)       
CLEANINGDATE    NOT NULL DATE          
CLEANINGFEE              NUMBER(8,2)   
WORKHOURS                NUMBER(5,2)   
STATEMENTOFWORK          VARCHAR2(100) 
CLEANTYPE                CHAR(6)       

Table F21CLEANING altered.
*/

/* Question 9 */

SELECT Constraint_Name, Table_Name, Status
FROM USER_CONSTRAINTS
WHERE Constraint_Type = 'P'
ORDER BY Table_Name;

SELECT Constraint_Name, Table_Name, R_Constraint_Name, Status
FROM USER_CONSTRAINTS
WHERE Constraint_Type = 'R'
ORDER BY Table_Name;

/* Results:
CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BILLOFMATERIALS_PK                                                                                                               BILLOFMATERIALS                                                                                                                  ENABLED 
BIN$SxxRD3hy+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3h0+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3h1+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3h3+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3h4+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3h6+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3h7+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3h9+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3hX+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3hZ+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3ha+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3hc+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3hd+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3hf+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3hg+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3hi+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3hj+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3hl+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3hm+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3ho+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$SxxRD3hp+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3hr+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3hs+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3hu+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3hv+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3hx+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3i9+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3i/+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3i0+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3i2+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3i3+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3i5+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3i6+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3i8+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3h++mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iA+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iB+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iD+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iE+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iG+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iH+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iJ+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$SxxRD3iK+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iM+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iN+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iP+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iQ+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iS+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iT+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iV+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iW+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iY+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iZ+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3ib+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3ic+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3ie+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3if+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3ih+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3ii+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3ik+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3il+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3in+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3io+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iq+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$SxxRD3ir+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3it+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3iu+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iw+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3ix+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3iz+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3j8+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3j++mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jz+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3j1+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3j2+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3j4+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3j5+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3j7+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jA+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jC+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jD+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jF+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jG+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jI+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jJ+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jL+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$SxxRD3jM+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jO+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jP+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jR+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jS+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jU+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jV+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jX+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jY+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3ja+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jb+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jd+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3je+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jg+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jh+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jj+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jk+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jm+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jn+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jp+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jq+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3js+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$SxxRD3jt+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jv+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SxxRD3jw+mrgYy0ELoDoOg==$0                                                                                                   BIN$SxxRD3jy+mrgYy0ELoDoOg==$0                                                                                                   ENABLED 
BIN$SyXY6YKy1azgYy0ELoBiQw==$0                                                                                                   BIN$SyXY6YK01azgYy0ELoBiQw==$0                                                                                                   ENABLED 
BIN$SyXY6YK11azgYy0ELoBiQw==$0                                                                                                   BIN$SyXY6YK31azgYy0ELoBiQw==$0                                                                                                   ENABLED 
BIN$SyXY6YK41azgYy0ELoBiQw==$0                                                                                                   BIN$SyXY6YK61azgYy0ELoBiQw==$0                                                                                                   ENABLED 
BIN$SyXY6YK71azgYy0ELoBiQw==$0                                                                                                   BIN$SyXY6YK91azgYy0ELoBiQw==$0                                                                                                   ENABLED 
BIN$SyXY6YK+1azgYy0ELoBiQw==$0                                                                                                   BIN$SyXY6YLA1azgYy0ELoBiQw==$0                                                                                                   ENABLED 
BIN$SyXY6YLB1azgYy0ELoBiQw==$0                                                                                                   BIN$SyXY6YLD1azgYy0ELoBiQw==$0                                                                                                   ENABLED 
BIN$TDVAGDd9/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDd//FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDd0/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDd2/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDd3/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDd5/FHgYy0ELoDorg==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$TDVAGDd6/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDd8/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDdl/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDdn/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDdo/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDdq/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDdr/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDdt/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDdu/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDdw/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDdx/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDdz/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeA/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeC/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeD/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeF/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeG/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeI/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeJ/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeL/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeM/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeO/FHgYy0ELoDorg==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$TDVAGDeP/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeR/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeS/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeU/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeV/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeX/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeY/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDea/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeb/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDed/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDee/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDeg/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TDVAGDeh/FHgYy0ELoDorg==$0                                                                                                   BIN$TDVAGDej/FHgYy0ELoDorg==$0                                                                                                   ENABLED 
BIN$TMvE/zizWjXgYy0ELoCUmw==$0                                                                                                   BIN$TMvE/zi1WjXgYy0ELoCUmw==$0                                                                                                   ENABLED 
BIN$TMvE/zi2WjXgYy0ELoCUmw==$0                                                                                                   BIN$TMvE/zi4WjXgYy0ELoCUmw==$0                                                                                                   ENABLED 
BIN$TMvE/zi5WjXgYy0ELoCUmw==$0                                                                                                   BIN$TMvE/zi7WjXgYy0ELoCUmw==$0                                                                                                   ENABLED 
BIN$TMvE/ziqWjXgYy0ELoCUmw==$0                                                                                                   BIN$TMvE/zisWjXgYy0ELoCUmw==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$TMvE/zitWjXgYy0ELoCUmw==$0                                                                                                   BIN$TMvE/zivWjXgYy0ELoCUmw==$0                                                                                                   ENABLED 
BIN$TMvE/ziwWjXgYy0ELoCUmw==$0                                                                                                   BIN$TMvE/ziyWjXgYy0ELoCUmw==$0                                                                                                   ENABLED 
BIN$Tds+pV+yc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+0c67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+1c67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+3c67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+4c67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+6c67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+7c67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+9c67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+dc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+fc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+gc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+ic67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+jc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+lc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+mc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+oc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+pc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+rc67gYy0ELoB26A==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$Tds+pV+sc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+uc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV+vc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV+xc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV++c67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Ac67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/Bc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Dc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/Ec67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Gc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/Hc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Jc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/Kc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Mc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/Nc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Pc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/Qc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Sc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/Tc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Vc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/Wc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/Yc67gYy0ELoB26A==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$Tds+pV/Zc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/bc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/cc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/ec67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tds+pV/fc67gYy0ELoB26A==$0                                                                                                   BIN$Tds+pV/hc67gYy0ELoB26A==$0                                                                                                   ENABLED 
BIN$Tdu8FG38uHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG3+uHbgYy0ELoAC1A==$0                                                                                                   ENABLED 
BIN$Tdu8FG3zuHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG31uHbgYy0ELoAC1A==$0                                                                                                   ENABLED 
BIN$Tdu8FG32uHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG34uHbgYy0ELoAC1A==$0                                                                                                   ENABLED 
BIN$Tdu8FG35uHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG37uHbgYy0ELoAC1A==$0                                                                                                   ENABLED 
BIN$Tdu8FG3quHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG3suHbgYy0ELoAC1A==$0                                                                                                   ENABLED 
BIN$Tdu8FG3tuHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG3vuHbgYy0ELoAC1A==$0                                                                                                   ENABLED 
BIN$Tdu8FG3wuHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG3yuHbgYy0ELoAC1A==$0                                                                                                   ENABLED 
BIN$Tdu8FG3/uHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG4BuHbgYy0ELoAC1A==$0                                                                                                   ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BIN$Tdu8FG4CuHbgYy0ELoAC1A==$0                                                                                                   BIN$Tdu8FG4EuHbgYy0ELoAC1A==$0                                                                                                   ENABLED 
CATEGORY_PK                                                                                                                      CATEGORY                                                                                                                         ENABLED 
CUSTOMER_PK                                                                                                                      CUSTOMER                                                                                                                         ENABLED 
CUSTORDER_PK                                                                                                                     CUSTORDER                                                                                                                        ENABLED 
CUSTORDERLINE_PK                                                                                                                 CUSTORDERLINE                                                                                                                    ENABLED 
EMPLOYEE_PK                                                                                                                      EMPLOYEE                                                                                                                         ENABLED 
F21CAT_PK                                                                                                                        F21CATEGORY                                                                                                                      ENABLED 
F21CLEAN_PK                                                                                                                      F21CLEANING                                                                                                                      ENABLED 
F21HK_PK                                                                                                                         F21HOUSEKEEP                                                                                                                     ENABLED 
F21ROOM_PK                                                                                                                       F21ROOM                                                                                                                          ENABLED 
INVENTORYPART_PK                                                                                                                 INVENTORYPART                                                                                                                    ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
MACHINE_PK                                                                                                                       MACHINE                                                                                                                          ENABLED 
MACHINEPROCESS_PK                                                                                                                MACHINEPROCESS                                                                                                                   ENABLED 
OPERATION_PK                                                                                                                     OPERATION                                                                                                                        ENABLED 
PACKINGSLIP_PK                                                                                                                   PACKINGSLIP                                                                                                                      ENABLED 
PROCESSING_PK                                                                                                                    PROCESS                                                                                                                          ENABLED 
PROCESSROUTING_PK                                                                                                                PROCESSROUTING                                                                                                                   ENABLED 
PURCHASE_ORDER_PK                                                                                                                PURCHASEORDER                                                                                                                    ENABLED 
PURCHORDERID_PK                                                                                                                  PURCHORDERLINE                                                                                                                   ENABLED 
SHIPMENT_PK                                                                                                                      SHIPMENT                                                                                                                         ENABLED 
SHIPPEDITEM_PK                                                                                                                   SHIPPEDITEM                                                                                                                      ENABLED 
SHIPPER_PK                                                                                                                       SHIPPER                                                                                                                          ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
SUPPLIEDPART_PK                                                                                                                  SUPPLIEDPART                                                                                                                     ENABLED 
SUPPLIER_PK                                                                                                                      SUPPLIER                                                                                                                         ENABLED 
TIMECARDLINE_PK                                                                                                                  TIMECARDLINE                                                                                                                     ENABLED 

146 rows selected. 


CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       R_CONSTRAINT_NAME                                                                                                                STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
BILLOFMATLS_INVENTORYPART_FK                                                                                                     BILLOFMATERIALS                                                                                                                  INVENTORYPART_PK                                                                                                                 ENABLED 
BOM_SUBINVENTORYPART_FK                                                                                                          BILLOFMATERIALS                                                                                                                  INVENTORYPART_PK                                                                                                                 ENABLED 
CUSTORDER_CUSTOMER_FK                                                                                                            CUSTORDER                                                                                                                        CUSTOMER_PK                                                                                                                      ENABLED 
CUSTORDERLINE_CUSTORDER_FK                                                                                                       CUSTORDERLINE                                                                                                                    CUSTORDER_PK                                                                                                                     ENABLED 
CUSTORDERLINE_INVENTORYPART_FK                                                                                                   CUSTORDERLINE                                                                                                                    INVENTORYPART_PK                                                                                                                 ENABLED 
SUPERVISOR_EMPLOYEE_FK                                                                                                           EMPLOYEE                                                                                                                         EMPLOYEE_PK                                                                                                                      ENABLED 
F21CAT_FK                                                                                                                        F21CLEANING                                                                                                                      F21CAT_PK                                                                                                                        ENABLED 
F21RM_FK                                                                                                                         F21CLEANING                                                                                                                      F21ROOM_PK                                                                                                                       ENABLED 
F21HK_FK                                                                                                                         F21CLEANING                                                                                                                      F21HK_PK                                                                                                                         ENABLED 
INVENTORYPART_CATEGORY_FK                                                                                                        INVENTORYPART                                                                                                                    CATEGORY_PK                                                                                                                      ENABLED 
MACHINEPROCESS_MACHINE_2FK                                                                                                       MACHINEPROCESS                                                                                                                   PROCESSING_PK                                                                                                                    ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       R_CONSTRAINT_NAME                                                                                                                STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
MACHINEPROCESS_MACHINE_FK                                                                                                        MACHINEPROCESS                                                                                                                   MACHINE_PK                                                                                                                       ENABLED 
OPERATION_PROCESS_FK                                                                                                             OPERATION                                                                                                                        PROCESSING_PK                                                                                                                    ENABLED 
PACKINGSLIP_EMPLOYEE_FK                                                                                                          PACKINGSLIP                                                                                                                      EMPLOYEE_PK                                                                                                                      ENABLED 
PACKINGSLIP_SHIPMENT_FK                                                                                                          PACKINGSLIP                                                                                                                      SHIPMENT_PK                                                                                                                      ENABLED 
PROCESS_PROCESSROUTING_FK                                                                                                        PROCESS                                                                                                                          PROCESSROUTING_PK                                                                                                                ENABLED 
PROCESSROUT_INVENTORYPART_FK                                                                                                     PROCESSROUTING                                                                                                                   INVENTORYPART_PK                                                                                                                 ENABLED 
PURCHASEORDER_SUPPLIER_FK                                                                                                        PURCHASEORDER                                                                                                                    SUPPLIER_PK                                                                                                                      ENABLED 
PURCHASEORDER_EMPLOYEE_FK                                                                                                        PURCHASEORDER                                                                                                                    EMPLOYEE_PK                                                                                                                      ENABLED 
PURCHORDERLINE_PURCHORDER_FK                                                                                                     PURCHORDERLINE                                                                                                                   PURCHASE_ORDER_PK                                                                                                                ENABLED 
PURCHORDERLINE_SUPPLIEDPART_FK                                                                                                   PURCHORDERLINE                                                                                                                   SUPPLIEDPART_PK                                                                                                                  ENABLED 
SHIPMENT_CUSTORDER_FK                                                                                                            SHIPMENT                                                                                                                         CUSTORDER_PK                                                                                                                     ENABLED 

CONSTRAINT_NAME                                                                                                                  TABLE_NAME                                                                                                                       R_CONSTRAINT_NAME                                                                                                                STATUS  
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------
SHIPMENT_SHIPPER_FK                                                                                                              SHIPMENT                                                                                                                         SHIPPER_PK                                                                                                                       ENABLED 
SHIPPEDITEM_PACKINGSLIP_FK                                                                                                       SHIPPEDITEM                                                                                                                      PACKINGSLIP_PK                                                                                                                   ENABLED 
SHIPPEDITEM_CUSTORDERLINE_FK                                                                                                     SHIPPEDITEM                                                                                                                      CUSTORDERLINE_PK                                                                                                                 ENABLED 
SUPPLIEDPART_INVENTORYPART_FK                                                                                                    SUPPLIEDPART                                                                                                                     INVENTORYPART_PK                                                                                                                 ENABLED 
SUPPLIEDPART_SUPPLIER_FK                                                                                                         SUPPLIEDPART                                                                                                                     SUPPLIER_PK                                                                                                                      ENABLED 
TIMECARDLINE_EMPLOYEE_FK                                                                                                         TIMECARDLINE                                                                                                                     EMPLOYEE_PK                                                                                                                      ENABLED 
TIMECARDLINE_MACHINEPROCESS_FK                                                                                                   TIMECARDLINE                                                                                                                     MACHINEPROCESS_PK                                                                                                                ENABLED 

29 rows selected. 
*/

/* Question 10 */

DROP TABLE F21ZIPCODE CASCADE CONSTRAINTS;
DROP TABLE F21CATEGORY CASCADE CONSTRAINTS;
DROP TABLE F21HOUSEKEEP CASCADE CONSTRAINTS;
DROP TABLE F21CLEANING CASCADE CONSTRAINTS;

/* Results:
Table F21ZIPCODE dropped.


Table F21CATEGORY dropped.


Table F21HOUSEKEEP dropped.


Table F21CLEANING dropped.
*/


