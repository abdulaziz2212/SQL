use lesson2;
-- Drop table if it already exists to avoid errors when rerunning the script
drop table if exists students;

-- Creating the students table with a computed column
create table students
(	
	student_id INT IDENTITY(1,1) PRIMARY KEY,
	classes int NOT NULL,
	tuition_per_class float NOT NULL,
	total_tuition as (classes * tuition_per_class), -- Computed column: total cost of tuition
	CHECK (classes >= 0 AND tuition_per_class >= 0) -- Ensures number of classes and tuition are non-negative
);

-- Inserting valid sample data
insert into students(classes, tuition_per_class)
values (5,100), (123, 20), (12, 0), (100000, 999.99);

-- Attempting to insert invalid data
insert into students(classes, tuition_per_class)
values (-3, 100);

-- Retrieve and verify the computed column values
SELECT 
    student_id,
    classes,
    tuition_per_class,
    total_tuition AS computed_tuition
FROM students;