use lesson1;
-- drop table if it exists
drop table if exists customer;
-- Create account table with NOT NULL primary key and DEFAULT constraint
create table customer
(
	customer_id int not null primary key,
	name varchar(255),
	city varchar(100) constraint df_city DEFAULT 'Unknown'
);
-- Drop the DEFAULT constraint
alter table customer
drop constraint df_city;


-- Add the DEFAULT constraint again
alter table customer
add constraint df_city
DEFAULT 'Unknown' FOR City;