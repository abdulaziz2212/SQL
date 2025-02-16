use lesson1;
-- Drop table if it exists
drop table if exists invoice;
-- Create invoice table with IDENTITY column
create table invoice
(
	invoice_id int primary key identity(1,1),
	amount decimal(10,2)
)
insert into invoice(amount)
values
	(10),
	(23.2343),
	(20),
	(12.453),
	(100.0);

-- Enable manual identity insertion
SET IDENTITY_INSERT invoice ON;
-- Insert a row with a specific invoice_id
insert into invoice(invoice_id,amount)
values (100, 343222.234);
-- Disable manual identity insertion
SET IDENTITY_INSERT invoice OFF;

-- View the table
select * from invoice
