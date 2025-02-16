use lesson1 ;

-- Drop table if it already exists

drop table if exists product;

-- Create table with explicitly named UNIQUE constraint

create table product
(	
	product_id int constraint unique_id	 unique,
	product_name varchar(255),
	price decimal(10,2)
);

-- Drop the unique constraint
alter table product
drop constraint unique_id;

-- Add UNIQUE constraint again for product_id

alter table product
add constraint unuque_id unique(product_id) ;

-- Extend UNIQUE constraint to include product_name as well
alter table product
add constraint unuque_id_name unique(product_id,product_name) ;