use lesson1;
-- Drop table if it exists
drop table if exists orders;

-- Create table with explicit NOT NULL on order_id

create table orders
(	
	order_id int not null constraint pk_order primary key,
	customer_name varchar(50),
	order_date date
);
-- Drop the primary key constraint
alter table orders
drop constraint pk_order ;

-- Add the primary key back
alter table orders
add constraint pk_order primary key(order_id) ;