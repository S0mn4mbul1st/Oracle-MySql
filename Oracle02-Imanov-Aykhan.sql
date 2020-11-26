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

/* TASK 17 */
SELECT catA.nickname "Hunts in the field",
       catA.mice_ration,
       band.name
FROM cats catA,
     Bands band
WHERE catA.band_no = band.band_no
  AND band.site IN ('FIELD',
                    'WHOLE AREA')
  AND catA.mice_ration > 50;

/* TASK 18 */
SELECT catA.name,
       TO_CHAR(catA.in_herd_since, 'YYYY-MM-DD') AS "Hunts since"
FROM cats catA
JOIN cats catB ON catB.NAME='JACEK'
WHERE catA.in_herd_since < catB.in_herd_since
ORDER BY catA.in_herd_since DESC;

/* TASK 19 */
SELECT catA.name,
       catA.function,
       catB.name "chief 1",
       NVL(catC.name, ' ')"chief 2",
       NVL(catD.name, ' ') "chief 3"
FROM cats catA
JOIN cats catB ON catB.nickname = catA.chief
LEFT OUTER JOIN cats catC ON catC.nickname = catB.chief
LEFT OUTER JOIN cats catD ON catD.nickname = catC.chief
WHERE catA.function IN ('CAT',
                        'NICE') ;


SELECT name "Name",
       FUNCTION,
       NVL(chief1, ' ')"Chief 1",
       NVL(chief2, ' ') "Chief 2",
       NVL(chief3, ' ')"Chief 3"
FROM
  (SELECT name,
          FUNCTION,
          LEVEL AS lvl,
                   CONNECT_BY_ROOT name AS roots
   FROM cats
   WHERE FUNCTION IN ('CAT',
                      'NICE') CONNECT BY chief =
     PRIOR nickname) PIVOT (MAX(roots)
                            FOR lvl IN (2 AS chief1, 3 AS chief2, 4 AS chief3));


SELECT tem.name,
       tem.function,
       tem.chiefs
FROM
  (SELECT name,
          FUNCTION,
          ' | ' || REVERSE(LTRIM(SYS_CONNECT_BY_PATH(REVERSE(name), ' | '), ' | ')) AS chiefs,
          LEVEL AS lvl
   FROM cats
   WHERE FUNCTION IN ('CAT',
                      'NICE') CONNECT BY
     PRIOR nickname = chief) tem
WHERE lvl =
    (SELECT MAX(lvl)
     FROM
       (SELECT name,
               FUNCTION,
               LEVEL AS lvl
        FROM cats
        WHERE FUNCTION IN ('CAT',
                           'NICE') CONNECT BY
          PRIOR nickname = chief)
     WHERE name = tem.name
     GROUP BY name);

/* TASK 21 */
SELECT DISTINCT bands.name "Band name",
                COUNT(*) "cats with enemies"
FROM cats catsA,
     Bands bands,

  (SELECT DISTINCT nickname
   FROM incidents) inci
WHERE catsA.band_no=bands.band_no
  AND catsA.nickname = inci.nickname
GROUP BY bands.name;

/* TASK 22 */
SELECT catsA.function,
       catsA.nickname,
       COUNT(inci.nickname) AS enemies
FROM cats catsA,
     Incidents inci
WHERE catsA.nickname = inci.nickname
GROUP BY catsA.function,
         catsA.nickname
HAVING COUNT(inci.nickname)> 1;

/* TASK 23 */
SELECT name,
       (mice_ration + mice_extra) * 12 Annual_dose,
       'above 864' "Dose"
FROM cats
WHERE (mice_ration + mice_extra) * 12 > 864
  AND mice_extra > 0
UNION
SELECT name,
       (mice_ration + mice_extra) * 12 Annual_dose,
       '864'
FROM cats
WHERE (mice_ration + mice_extra) * 12 = 864
  AND mice_extra > 0
UNION
SELECT name,
       (mice_ration + mice_extra) * 12 Annual_dose,
       'below 864'
FROM cats
WHERE (mice_ration + mice_extra) * 12 < 864
  AND mice_extra > 0
ORDER BY Annual_dose DESC;

/* TASK 24 */
SELECT band.band_no,
       band.name "Band name",
       band.site
FROM Bands band,
     cats catA MINUS
SELECT band.band_no,
       band.name "Band name",
       band.site
FROM Bands band,
     cats catA
WHERE catA.band_no=band.band_no;


SELECT band.band_no,
       band.name "Band name",
       band.site
FROM Bands band
LEFT JOIN cats catA ON band.band_no=catA.band_no
WHERE catA.band_no IS NULL;

/* TASK 25 */
SELECT catA.name,
       catA.function,
       mice_ration "Ration of mice"
FROM cats catA
JOIN Bands band ON (catA.band_no = band.band_no)
WHERE mice_ration >=
    (SELECT *
     FROM
       (SELECT mice_ration
        FROM cats catA
        JOIN Bands band ON catA.band_no = band.band_no
        WHERE catA.function = 'NICE'
          AND band.site IN ('ORCHARD',
                            'WHOLE AREA')
        ORDER BY mice_ration DESC)
     WHERE ROWNUM = 1) *3;

/* TASK 26 */
SELECT catB.function,
       catB.AVG
FROM
  (SELECT MIN(AVG) "MINAVG",
          MAX(AVG) "MAXAVG"
   FROM
     (SELECT FUNCTION,
             CEIL(AVG(mice_ration + NVL(mice_extra, 0))) "AVG"
      FROM cats
      WHERE FUNCTION != 'BOSS'
      GROUP BY FUNCTION)) catA
JOIN
  (SELECT FUNCTION,
          CEIL(AVG(mice_ration + NVL(mice_extra, 0))) "AVG"
   FROM cats
   WHERE FUNCTION != 'BOSS'
   GROUP BY FUNCTION) catB ON catA.MINAVG = catB.AVG
OR catA.MAXAVG = catB.AVG
ORDER BY catB.AVG;

/* TASK 27 */
SELECT nickname,
       mice_ration + NVL(mice_extra, 0) "EATS"
FROM cats cat
WHERE
    (SELECT COUNT(mice_ration + NVL(mice_extra, 0))
     FROM cats
     WHERE mice_ration + NVL(mice_extra, 0) > cat.mice_ration + NVL(cat.mice_extra, 0)) < 6
ORDER BY 2 DESC;


SELECT nickname,
       mice_ration + NVL(mice_extra, 0) "EATS"
FROM cats
WHERE mice_ration + NVL(mice_extra, 0) IN
    (SELECT *
     FROM
       (SELECT DISTINCT mice_ration + NVL(mice_extra, 0)
        FROM cats
        ORDER BY 1 DESC)
     WHERE ROWNUM <= 6 );


SELECT catA.nickname,
       AVG(catA.mice_ration + NVL(catA.mice_extra, 0)) "EATS"
FROM cats catA
LEFT JOIN cats catB ON catA.mice_ration + NVL(catA.mice_extra, 0) < catB.mice_ration + NVL(catB.mice_extra, 0)
GROUP BY catA.nickname
HAVING COUNT(catB.nickname) <= 6
ORDER BY 2 DESC;

/* TASK 28 */
WITH all_years AS
  (SELECT TO_CHAR(Y) YEARS,
          COUNT(*) NUMBER_OF_ENTRIES
   FROM
     (SELECT EXTRACT(YEAR
                     FROM in_herd_since) Y
      FROM cats)
   GROUP BY Y),
                   average AS
  (SELECT 'Average',
          ROUND(AVG(NUMBER_OF_ENTRIES), 7) Av
   FROM all_years),
                   from_below AS
  (SELECT AllY.YEARS,
          AllY.NUMBER_OF_ENTRIES
   FROM all_years AllY,
        average AVG
   WHERE AllY.NUMBER_OF_ENTRIES < avg.Av
   ORDER BY 2 DESC FETCH NEXT 1 ROW WITH TIES),
                   from_above AS
  (SELECT AllY.YEARS,
          AllY.NUMBER_OF_ENTRIES
   FROM all_years AllY,
        average AVG
   WHERE AllY.NUMBER_OF_ENTRIES > avg.Av
   ORDER BY 2 FETCH NEXT 1 ROW WITH TIES),
                   show_result AS
  (SELECT *
   FROM from_above
   UNION SELECT *
   FROM from_below
   UNION SELECT *
   FROM average)
SELECT *
FROM show_result
ORDER BY 2;

/* TASK 29*/
SELECT catA.name,
       MIN(catA.mice_ration + NVL(catA.mice_extra, 0)) "EATS",
       catA.band_no,
       TO_CHAR(AVG(catB.mice_ration + NVL(catB.mice_extra, 0)), '99.99') "AVERAGE IN BAND"
FROM cats catA
JOIN cats catB ON catA.band_no= catB.band_no
WHERE catA.gender = 'M'
GROUP BY catA.name,
         catA.band_no
HAVING MIN(catA.mice_ration + NVL(catA.mice_extra, 0)) < AVG(catB.mice_ration + NVL(catB.mice_extra, 0))
ORDER BY catA.band_no DESC;


SELECT name,
       mice_ration + NVL(mice_extra, 0) "EATS",
       catA.band_no,
       TO_CHAR(AVG, '99.99') "AVERAGE IN BAND"
FROM cats catA
JOIN
  (SELECT band_no,
          AVG(mice_ration + NVL(mice_extra, 0)) "AVG"
   FROM cats
   GROUP BY band_no) catB ON catA.band_no= catB.band_no
AND mice_ration + NVL(mice_extra, 0) < AVG
WHERE gender = 'M'
ORDER BY catA.band_no DESC;


SELECT name,
       mice_ration + NVL(mice_extra, 0) "EATS",
       band_no,
       TO_CHAR(
                 (SELECT AVG(mice_ration + NVL(mice_extra, 0)) "AVG"
                  FROM cats cat
                  WHERE cats.band_no = cat.band_no), '99.99') "AVERAGE IN BAND"
FROM cats
WHERE gender = 'M'
  AND mice_ration + NVL(mice_extra, 0) <
    (SELECT AVG(mice_ration + NVL(mice_extra, 0)) "AVG"
     FROM cats cat
     WHERE cats.band_no= cat.band_no)
ORDER BY band_no DESC;

/* TASK 30 */
SELECT catA.name,
       in_herd_since "JOIN THE HERD",
       '<---SHORTEST TIME IN THE BAND '|| band.name " "
FROM cats catA
LEFT JOIN Bands band ON catA.band_no = band.band_no
WHERE in_herd_since =
    (SELECT MAX(in_herd_since)
     FROM cats
     WHERE catA.band_no = band_no)
UNION
SELECT catA.name,
       in_herd_since "JOIN THE HERD",
       '<---LONGEST TIME IN THE BAND '|| band.name " "
FROM cats catA
LEFT JOIN Bands band ON catA.band_no = band.band_no
WHERE catA.in_herd_since =
    (SELECT MIN(in_herd_since)
     FROM cats
     WHERE catA.band_no = band_no)
UNION
SELECT catA.name,
       in_herd_since "JOIN THE HERD",
       ' ' " "
FROM cats catA
WHERE in_herd_since !=
    (SELECT MIN(in_herd_since)
     FROM cats
     WHERE catA.band_no = band_no)
  AND in_herd_since !=
    (SELECT MAX(in_herd_since)
     FROM cats
     WHERE catA.band_no = band_no);

/* TASK 31 */
DROP VIEW STATISTICS;


CREATE VIEW Statistics(band_name, avg_cons, MAX_CONS, MIN_CONS, CAT, CAT_WITH_EXTRA) AS
SELECT band.name,
       AVG(mice_ration),
       MAX(mice_ration),
       MIN(mice_ration),
       COUNT(nickname),
       COUNT(mice_extra)
FROM Bands band
JOIN cats ON band.band_no = cats.band_no
GROUP BY band.name;


SELECT *
FROM STATISTICS;


SELECT cat.nickname "NICKNAME",
       cat.name,
       cat.function,
       cat.mice_ration "EATS",
       'OD ' || MIN_CONS || ' DO ' || MAX_CONS "CONSUMPTION LIMITS",
       TO_CHAR(cat.in_herd_since, 'YYYY-MM-DD') "HUNT FROM"
FROM (Bands band
      JOIN cats cat ON band.band_no = cat.band_no
      JOIN STATISTICS ON band.name = Statistics.band_name)
WHERE nickname = '&nickname';

/* TASK 32 */
SELECT nickname,
       gender,
       mice_ration "Mice before pay increase",
       NVL(mice_extra, 0) "Extra before pay increase"
FROM cats
LEFT JOIN Bands band ON cats.band_no = band.band_no
WHERE nickname IN
    (SELECT *
     FROM
       (SELECT nickname
        FROM cats catA
        LEFT JOIN Bands band ON catA.band_no = band.band_no
        WHERE band.name = 'BLACK KNIGHTS'
        ORDER BY in_herd_since)
     WHERE ROWNUM <= 3
     UNION ALL SELECT *
     FROM
       (SELECT nickname
        FROM cats catA
        LEFT JOIN Bands band ON catA.band_no = band.band_no
        WHERE band.name = 'PINTO HUNTERS'
        ORDER BY in_herd_since)
     WHERE ROWNUM <= 3 );


UPDATE cats
SET mice_ration = CASE gender
                      WHEN 'M' THEN mice_ration + 10
                      ELSE (mice_ration +
                              (SELECT MIN(mice_ration)
                               FROM cats) * 0.1)
                  END,
                  mice_extra = NVL(mice_extra, 0) + (
                                                       (SELECT AVG(NVL(mice_extra, 0))
                                                        FROM cats catB
                                                        WHERE cats.band_no = catB.band_no) * 0.15)
WHERE nickname IN
    (SELECT *
     FROM
       (SELECT nickname
        FROM cats catA
        LEFT JOIN Bands band ON catA.band_no = band.band_no
        WHERE band.name = 'BLACK KNIGHTS'
        ORDER BY in_herd_since)
     WHERE ROWNUM <= 3
     UNION ALL SELECT *
     FROM
       (SELECT nickname
        FROM cats catA
        LEFT JOIN Bands band ON catA.band_no = band.band_no
        WHERE band.name = 'PINTO HUNTERS'
        ORDER BY in_herd_since)
     WHERE ROWNUM <= 3);