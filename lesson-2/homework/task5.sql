use lesson2;

-- Drop the table if it already exists
drop table if exists worker;

-- Create the worker table

create table worker
(
	id int,
	name varchar(50)
);

-- Enable advanced options to allow BULK INSERT
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

-- Perform BULK INSERT with improved settings
BULK INSERT worker
FROM 'D:\ML\SQL\lesson-2\homework\sample.csv'
WITH (
	firstrow = 2,
	fieldterminator = ',',
	rowterminator = '\n'
);

select * from worker;

