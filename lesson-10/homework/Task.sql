
use lesson10;
CREATE TABLE Shipments (
    N INT PRIMARY KEY,
    Num INT
);

INSERT INTO Shipments (N, Num) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1),
(9, 2), (10, 2), (11, 2), (12, 2), (13, 2), (14, 4), (15, 4), 
(16, 4), (17, 4), (18, 4), (19, 4), (20, 4), (21, 4), (22, 4), 
(23, 4), (24, 4), (25, 4), (26, 5), (27, 5), (28, 5), (29, 5), 
(30, 5), (31, 5), (32, 6), (33, 7);


;with cte
as(
	select 1 as day
	union all
	select day + 1 from cte
	where day < 40
),
cte2 as
(select  cte.day, ISNULL(s.num,0) as Num ,
		ROW_NUMBER() OVER(ORDER BY ISNULL(S.Num, 0)) rnk,
		COUNT(*) OVER() as TotalCount

from cte
left join Shipments s
on cte.day = s.N
)
select AVG(Num*1.0) as median
FROM cte2
WHERE rnk =(TotalCount+1)/2 or
	rnk = TotalCount/2 + 1 
