CREATE TABLE stugrade(sid  INT PRIMARY KEY ,Name VARCHAR(50) NOT NULL, Age INT,Gender VARCHAR(10),
 TotalScore INT,Grade CHAR(1) NULL );
INSERT INTO stugrade(sid,Name,Age,Gender,TotalScore,Grade) VALUES (1,'Alice',20,'Female',85,NULL);
INSERT INTO stugrade(sid,Name,Age,Gender,TotalScore,Grade) VALUES(2,'Bob',22,'Male',75,NULL);
INSERT INTO stugrade(sid,Name,Age,Gender,TotalScore,Grade) VALUES(3,'Charlie',21,'Male',92,NULL);
INSERT INTO stugrade(sid,Name,Age,Gender,TotalScore,Grade) VALUES(4,'Diana',19,'Female',45,NULL);
INSERT INTO stugrade(sid,Name,Age,Gender,TotalScore,Grade) VALUES(5,'Eve',NULL,'Female',NULL,NULL);
UPDATE stugrade SET Grade = 
    CASE 
        WHEN TotalScore IS NULL THEN 'N'
        WHEN TotalScore >= 90 THEN 'A'
        WHEN TotalScore >= 75 THEN 'B'
        WHEN TotalScore >= 50 THEN 'C'
        ELSE 'F'
    END;
SELECT sid,Name,Age,Gender,TotalScore,Grade,    
    CASE 
        WHEN Grade = 'A' THEN 'Excellent'
        WHEN Grade = 'B' THEN 'Good'
        WHEN Grade = 'C' THEN 'Average'
        WHEN Grade = 'F' THEN 'Fail'
        ELSE 'Not Graded'
    END AS PerformanceCategory,
    -- Use COALESCE to handle NULL values for Age and TotalScore
    COALESCE(Age, 18) AS AssumedAge, -- Default age is 18 if NULL
    COALESCE(TotalScore, 0) AS AssumedScore -- Default score is 0 if NULL
FROM stugrade;
SELECT  Name,TotalScore,Age,
  COALESCE(TotalScore / NULLIF(Age, 0), 0) AS ScorePerYear -- Avoid division by zero
FROM  stugrade;
-- Delete students with low scores (optional)
DELETE FROM stugrade WHERE TotalScore < 50;
SELECT * FROM stugrade;
/
