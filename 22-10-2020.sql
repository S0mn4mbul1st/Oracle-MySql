CREATE TABLE functions(FUNCTION VARCHAR2(10),
                                min_mice NUMBER(3) CHECK(min_mice > 5),
                                                   max_mice NUMBER(3) CHECK(200>max_mice),
                                                                      CONSTRAINT chk_max_mice CHECK (max_mice>=min_mice), PRIMARY KEY(FUNCTION));


CREATE TABLE enemies(enemy_name VARCHAR2(15),
                                hostility_degree NUMBER(2) CHECK(hostility_degree>=1
                                                                 AND hostility_degree<=10),
                                                           species VARCHAR2(15),
                                                                   bribe VARCHAR2(20),
                                                                         PRIMARY KEY(enemy_name));


CREATE TABLE bands(band_no NUMBER(2),
                           name VARCHAR2(20) NOT NULL,
                                             site VARCHAR2(15) UNIQUE,
                                                               band_chief VARCHAR2(15) UNIQUE,
                                                                                       PRIMARY KEY(band_no));


CREATE TABLE cats(name VARCHAR2(15) NOT NULL,
                                    gender VARCHAR2(1) CHECK(gender in('M', 'W')),
                                                       nickname VARCHAR2(15),
                                                                FUNCTION VARCHAR2(10),
                                                                         chief VARCHAR2(15),
                                                                               in_herd_since DATE DEFAULT SYSDATE,
                                                                                                          mice_ration NUMbER(3),
                                                                                                                      mice_extra NUMBER(3),
                                                                                                                                 band_no NUMBER(2),
                                                                                                                                         PRIMARY KEY(nickname),
                                                                                                                                                 CONSTRAINT cat_function
                  FOREIGN KEY(FUNCTION) REFERENCES functions(FUNCTION),
                                                   CONSTRAINT cat_chief
                  FOREIGN KEY(chief) REFERENCES cats(nickname),
                                                CONSTRAINT cat_bno
                  FOREIGN KEY(band_no) REFERENCES bands(band_no) DEFERRABLE INITIALLY DEFERRED);


ALTER TABLE bands ADD CONSTRAINT fk_cats_bands
FOREIGN KEY(band_chief) REFERENCES cats(nickname) DEFERRABLE INITIALLY DEFERRED;


CREATE TABLE incidents(nickname VARCHAR2(15),
                                enemy_name VARCHAR2(15),
                                           incident_date DATE NOT NULL,
                                                              incident_desc VARCHAR2(50),
                                                                            PRIMARY KEY(nickname, enemy_name),
                       FOREIGN KEY(nickname) REFERENCES cats(nickname),
                       FOREIGN KEY(enemy_name) REFERENCES enemies(enemy_name));

INSERT ALL
     
    INTO functions (function, min_mice, max_mice)
    VALUES ('BOSS',90,110)
    
    INTO functions (function, min_mice, max_mice)
    VALUES ('THUG',70,90)
    
    INTO functions (function, min_mice, max_mice)
    VALUES ('CATCHING',60,70)
    
    INTO functions (function, min_mice, max_mice)
    VALUES ('CATCHER',50,60)
    
    INTO functions (function, min_mice, max_mice)
    VALUES ('CAT',40,50)
    
    INTO functions (function, min_mice, max_mice)
    VALUES ('NICE',20,30)
    
    INTO functions (function, min_mice, max_mice)
    VALUES ('DIVISIVE',45,55)
    
    INTO functions (function, min_mice, max_mice)
    VALUES ('HONORARY',6,25)
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('KAZIO',10,'MAN','BOTTLE')
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('STUPID SOPHIA',1,'MAN','BEAD')
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('UNRULY DYZIO',7,'MAN','CHEWING GUM')
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('DUN',4,'DOG','BONE')
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('WILD BILL',10,'DOG',NULL)
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('REKS',2,'DOG','BONE')
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('BETHOVEN',1,'DOG','PEDIGRIPALL')
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('SLYBOOTS',5,'FOX','CHICKEN')
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('SLIM',1,'PINE',NULL)
    
    INTO enemies(enemy_name, hostility_degree, species, bribe)
    VALUES ('BASIL',3,'ROOSTER','HEN TO THE HERD')
SELECT 1 FROM DUAL;
INSERT ALL
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('MRUCZEK','M','TIGER','BOSS',NULL,TO_DATE('2002-01-01', 'YYYY-MM-DD'),103,33,1)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no)
    VALUES ('MICKA','W','LOLA','NICE','TIGER',TO_DATE('2009-10-14', 'YYYY-MM-DD'),25,47,1)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('CHYTRY','M','BOLEK','DIVISIVE','TIGER',TO_DATE('2002-05-05', 'YYYY-MM-DD'),50,NULL,1)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('KOREK','M','ZOMBIES','THUG','TIGER',TO_DATE('2004-03-16', 'YYYY-MM-DD'),75,13,3)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('BOLEK','M','BALD','THUG','TIGER',TO_DATE('2006-08-15', 'YYYY-MM-DD'),72,21,2)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('RUDA','W','LITTLE','NICE','TIGER',TO_DATE('2006-09-17', 'YYYY-MM-DD'),22,42,1)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('PUCEK','M','REEF','CATCHING','TIGER',TO_DATE('2006-10-15', 'YYYY-MM-DD'),65,NULL,4)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('ZUZIA','W','FAST','CATCHING','BALD',TO_DATE('2006-07-21', 'YYYY-MM-DD'),65,NULL,2)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('JACEK','M','CAKE','CATCHING','BALD',TO_DATE('2008-12-01', 'YYYY-MM-DD'),67,NULL,2)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('BARI','M','TUBE','CATCHER','BALD',TO_DATE('2009-09-01', 'YYYY-MM-DD'),56,NULL,2)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('BELA','W','MISS','NICE','BALD',TO_DATE('2008-02-01', 'YYYY-MM-DD'),24,28,2)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('PUNIA','W','HEN','CATCHING','ZOMBIES',TO_DATE('2008-01-01', 'YYYY-MM-DD'),61,NULL,3)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('LUCEK','M','ZERO','CAT','HEN',TO_DATE('2010-03-01', 'YYYY-MM-DD'),43,NULL,3)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('SONIA','W','FLUFFY','NICE','ZOMBIES',TO_DATE('2010-11-18', 'YYYY-MM-DD'),20,35,3)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('LATKA','W','EAR','CAT','REEF',TO_DATE('2011-01-01', 'YYYY-MM-DD'),40,NULL,4)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('DUDEK','M','SMALL','CAT','REEF',TO_DATE('2011-05-15', 'YYYY-MM-DD'),40,NULL,4)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('KSAWERY','M','MAN','CATCHER','REEF',TO_DATE('2008-07-12', 'YYYY-MM-DD'),51,NULL,4)
    
    INTO cats(name, gender, nickname, function, chief, in_herd_since, mice_ration, mice_extra, band_no) 
    VALUES ('MELA','W','LADY','CATCHER','REEF',TO_DATE('2008-11-01', 'YYYY-MM-DD'),51,NULL,4)  
    
    INTO bands(band_no, name, site, band_chief) 
    VALUES (1,'SUPERIORS','WHOLE AREA','TIGER')
    
    INTO bands(band_no, name, site, band_chief) 
    VALUES (2,'BLACK KNIGHTS','FIELD','BALD')
    
    INTO bands(band_no, name, site, band_chief) 
    VALUES (3,'WHITE HUNTERS','ORCHARD','ZOMBIES')
    
    INTO bands(band_no, name, site, band_chief) 
    VALUES (4,'PINTO HUNTERS','HILLOCK','REEF')
    
    INTO bands(band_no, name, site, band_chief) 
    VALUES (5,'ROCKERS','FARM',NULL)
SELECT 1 FROM DUAL;
INSERT ALL    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('TIGER','KAZIO', DATE '2004-10-13','HE HAS TRYING TO STICK ON THE FORK')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('ZOMBIES', 'UNRULY DYZIO', DATE '2005-03-07','HE FOOTED AN EYE FROM PROCAST')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('BOLEK','KAZIO', DATE '2005-03-29','HE CLEANED DOG')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('FAST', 'STUPID SOPHIA', DATE '2006-09-12','SHE USED THE CAT AS A CLOTH')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('LITTLE','SLYBOOTS', DATE '2007-03-07','HE RECOMMENDED HIMSELF AS A HUSBAND')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('TIGER','WILD BILL', DATE '2007-06-12','HE TRIED TO KILL')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('BOLEK','WILD BILL', DATE '2007-11-10','HE BITE THE EAR')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('MISS','WILD BILL', DATE '2008-12-12','HE BITCHED')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('MISS','KAZIO', DATE '2009-01-07','HE CAUGHT THE TAIL AND MADE A WIND')
    
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('LADY','KAZIO', DATE '2009-02-07','HE WANTED TO SKIN OFF')
        
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('MAN','REKS', DATE '2009-04-14','HE BARKED EXTREMELY RUDELY')
        
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('BALD','BETHOVEN', DATE '2009-05-11','HE DID NOT SHARE THE PORRIDGE')
        
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('TUBE','WILD BILL', DATE '2009-09-03','HE TOOK THE TAIL')
        
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('CAKE','BASIL', DATE '2010-07-12','HE PREVENTED THE CHICKEN FROM BEING HUNTED')
        
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('FLUFFY','SLIM', DATE '2010-11-19','SHE THREW CONES')
         
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('HEN','DUN', DATE '2010-12-14','HE CHASED')
         
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('SMALL','SLYBOOTS', DATE '2011-07-13','HE TOOK THE STOLEN EGGS')
         
    INTO incidents(nickname, enemy_name, incident_date, incident_desc)
    VALUES ('EAR', 'UNRULY DYZIO', DATE '2011-07-14','HE THREW STONES')
    
SELECT * FROM DUAL;
COMMIT;

/*Task1*/
SELECT enemy_name "ENEMY",
        incident_desc "FAULT DESCRIPTION"
FROM incidents
WHERE EXTRACT(YEAR FROM incident_date) = 2009;

/*Task2*/
SELECT name "NAME",
       FUNCTION "FUNCTION",
                in_herd_since "WITH AS FROM"
FROM cats
WHERE in_herd_since BETWEEN TO_DATE('2005-09-01', 'YYYY-MM-DD') AND TO_DATE('2007-07-31', 'YYYY-MM-DD')
  AND gender = 'W'
ORDER BY in_herd_since;

/*Task3*/
SELECT enemy_name "ENEMY",
       species "SPECIES",
       hostility_degree "HOSTILITY DEGREE"
FROM enemies
WHERE bribe IS NULL
ORDER BY hostility_degree;

/*Task4*/
SELECT NAME || ' called ' || nickname || ' (fun. ' || FUNCTION || ') has been catching mice in band ' || band_no || ' since ' || in_herd_since
FROM cats
WHERE gender = 'M'
ORDER BY in_herd_since DESC,
         nickname ASC;

/*Task5*/
SELECT nickname "NICKNAME",
       REGEXP_REPLACE(REGEXP_REPLACE(nickname, 'A', '#', 1, 1), 'L', '%', 1, 1) "AFTER REPLACING A AND L"
FROM cats
WHERE nickname LIKE '%A%L%'
  OR nickname LIKE '%L%A%'
ORDER BY nickname;

/*Task6*/
SELECT name,
       in_herd_since "IN HERD",
       ROUND(0.9 * (mice_ration)) "ATE",
       ADD_MONTHS(in_herd_since, 6) "INCREASE",
       mice_ration "EAT"
FROM cats
WHERE ROUND(MONTHS_BETWEEN (SYSDATE, in_herd_since)) / 12 > 11
  AND (TO_CHAR(in_herd_since, 'MM-DD') BETWEEN '03-01' AND '09-30')
  ORDER BY mice_ration;

/*Task7*/
SELECT name,
       (mice_ration)*3 "MICE QUATERLY",
       (mice_extra)*3 "EXTRA QUATERLY"
FROM cats
WHERE mice_ration > (NVL(mice_extra, 0) * 2)
  AND mice_ration > 55
ORDER BY mice_ration DESC;

/*Task8*/
SELECT name,
       CASE WHEN((mice_ration) * 12 + NVL(mice_extra, 0) * 12) < 660 THEN 'BELOW 660' WHEN((mice_ration) * 12 + NVL(mice_extra, 0) * 12) = 660 THEN 'LIMIT'
           ELSE TO_CHAR((mice_ration) * 12 + NVL(mice_extra, 0) * 12)
       END "EATS ANNUALLY"
FROM cats;

/*Task10*/
SELECT CASE
           WHEN COUNT(nickname) = 1 THEN CONCAT(nickname, ' - UNIQUE')
           ELSE CONCAT(nickname, ' - NON-UNIQUE')
       END "Uniqueness of the nickname"
FROM cats
GROUP BY nickname
ORDER BY nickname ASC;

SELECT CASE
           WHEN COUNT(chief) = 1 THEN CONCAT(chief, ' - UNIQUE')
           ELSE CONCAT(chief, ' - NON-UNIQUE')
       END "UNIQUENESS OF THE CHIEF"
FROM CATS
WHERE chief IS NOT NULL
GROUP BY chief
ORDER BY chief;

/*Task11*/
SELECT nickname,
       COUNT(enemy_name) "NUMBER OF ENEMIES"
FROM incidents
GROUP BY nickname
HAVING COUNT(enemy_name) > 1
ORDER BY nickname;

/*Task13*/
SELECT band_no "BAND NO",
       gender,
       MIN(mice_ration) "MINIMUM RATION"
FROM cats
GROUP BY gender,
         band_no;

/*Task14*/
SELECT LEVEL,
       nickname "NICKNAME",
       FUNCTION,
       band_no
FROM cats
WHERE gender = 'M' CONNECT BY
  PRIOR nickname = chief
  START WITH FUNCTION = 'THUG'
ORDER BY band_no;

/*Task15*/
SELECT CONCAT(RPAD('===>',4*(LEVEL - 1), '===>'), LEVEL - 1) "HIERARCHY",
CONCAT(RPAD('    ',4*(LEVEL - 1), '    '), name) " ",
NVL(chief, 'MASTER YOURSELF') "NICKNAME OF THE CHIEF",
function
FROM cats WHERE mice_extra IS NOT NULL
CONNECT BY PRIOR nickname = chief
START WITH chief IS NULL;

/*Task16*/
SELECT LPAD(' ', 4 * (LEVEL - 1)) || nickname "PATH OF CHIEFS"
FROM cats
CONNECT BY PRIOR chief = nickname
START WITH mice_extra IS NULL
AND gender = 'M'
AND in_herd_since < ADD_MONTHS(SYSDATE, - 12 * 11)