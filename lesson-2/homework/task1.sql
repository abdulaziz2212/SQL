use lesson2;

-- Create table with identity column
create table test_identity
(
	id int identity(1,1),
	name varchar(50)
)
-- Insert rows
insert into test_identity
values ('Math'),('Physics'),('Chemistry'), ('PI'), ('SAP');

-- Show current data
select * from test_identity;	

-- DELETE operation
delete from test_identity ;

select * from test_identity;	

--What happens to the identity column when you use DELETE?
--Answer: Removes all rows but does not reset the identity column.
--The next inserted row continues from the last used identity value.


-- TRUNCATE operation
truncate table test_identity;

-- Insert new row after TRUNCATE to demonstrate identity reset
insert into test_identity
values ('Math'),('Physics'),('Chemistry'), ('PI'), ('SAP');
select * from test_identity;	

--What happens to the identity column when you use TRUNCATE?
-- Answer:  Removes all rows and resets the identity column to the initial seed value.
--The next inserted row starts from 1 again.

-- DROP operation
IF OBJECT_ID('test_identity', 'U') IS NOT NULL
	DROP TABLE test_identity;
select * from test_identity;	

--What happens to the table when you use DROP?
--Answer: Completely removes the table structure along with the data.

