use lesson4;

create table letters
(letter char(1));
go
insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');

SELECT letter
FROM letters
ORDER BY
    CASE
        WHEN letter = 'b' THEN 0  -- 'b' comes first
        ELSE 1                    -- Other letters come after
    END,
    letter;  -- Orders the rest alphabetically
	------------------------------------------
SELECT letter
FROM letters
ORDER BY
    CASE
        WHEN letter = 'b' THEN 1  -- 'b' goes last
        ELSE 0                    -- Others come first
    END,
    letter;
--------------------------
WITH NumberedLetters AS (
    SELECT letter, ROW_NUMBER() OVER (ORDER BY letter) AS rn
    FROM letters
)
SELECT letter
FROM NumberedLetters
ORDER BY
    CASE
        WHEN rn < 3 THEN 1   -- First two letters stay in place
        WHEN letter = 'b' THEN 2  -- 'b' is forced to the 3rd position
        ELSE 3               -- Other letters come after
    END,
    letter; -- Ensure remaining letters are sorted naturally