use lesson4;
--DDL
CREATE TABLE TestMax
(
    Year1 INT
    ,Max1 INT
    ,Max2 INT
    ,Max3 INT
);
GO
 
INSERT INTO TestMax 
VALUES
    (2001,10,101,87)
    ,(2002,103,19,88)
    ,(2003,21,23,89)
    ,(2004,27,28,91);

--display
select * from Testmax

--Write a query which will find maximum value from multiple columns of the table.

SELECT Year1,GREATEST(Max1,Max2,Max3) AS MaxValue
FROM TestMax