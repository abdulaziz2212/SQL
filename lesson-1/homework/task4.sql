use lesson1;

-- Create table with explicit NOT NULL on category_id

drop table if exists category;
create table category
(
	category_id int not null constraint pk_category_id primary key,
	category_name varchar(50)
);

-- Create table with explicit NOT NULL on item_id
-- Drop table if it exists

drop table if exists item ;
create table item
(
	item_id int not null constraint pk_item_id primary key,
	item_name varchar(50),
	category_id int constraint fk_category_id foreign key references category(category_id)
)
-- Drop the foreign key constraint
alter table item
drop constraint fk_category_id ;

--Add foreign key back
alter table item
add constraint fk_category_id foreign key(category_id) references category(category_id);