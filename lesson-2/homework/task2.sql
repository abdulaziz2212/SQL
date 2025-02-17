use lesson2;

-- Creating table with data types we learned 

CREATE TABLE data_types_demo 
(
	age TINYINT not null, -- Valid range 0-255
	gpa DECIMAL(3,2),     -- Allows decimal values
	letter varchar(255),  -- accepts 255 characters
	birth_date DATE,      -- Stores date values
	created_at DATETIME DEFAULT GETDATE(), -- Stores date and time
	is_active BIT, -- Boolean values (0 or 1)
	id UNIQUEIDENTIFIER DEFAULT NEWID()  --accepts only unique id
);

-- Insert valid data
INSERT INTO data_types_demo (age, gpa, letter, birth_date, is_active)
VALUES (20, 3.75, 'I am learning SQL as much as I can', '1666-12-22', 1);
-- Select all data
select * from data_types_demo;