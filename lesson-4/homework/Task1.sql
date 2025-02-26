use lesson4;

--DDL
CREATE TABLE [dbo].[TestMultipleZero]
(
    [A] [int] NULL,
    [B] [int] NULL,
    [C] [int] NULL,
    [D] [int] NULL
);
GO

INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);

--display
SELECT * FROM TestMultipleZero

--Task: If all the columns having zero value then don't show that row.
SELECT *
FROM TestMultipleZero
WHERE NOT (A=0 and B=0 and C=0 and D=0)
