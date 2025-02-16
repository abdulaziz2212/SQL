use lesson1;
--dropping table if already exists to apply changes

drop table if exists student;
create table student
( 
	ID int,  --integer id
	NAME varchar(50), -- name string
	AGE int 	-- age integer
);

-- altering table student, so that ID column have a constraint not null
alter table student
alter column id int not null;

select * from student;
