use lesson1;
-- drop table if it exists
drop table if exists account;

-- Create account table with NOT NULL primary key and CHECK constraint

create table account
(
	account_id int not null constraint pk_id primary key,
	balance decimal(10,2),
	account_type varchar(50),
	constraint chk_account 
	check (
	(account_type = 'Saving' OR account_type='Checking')
	AND
	(balance >= 0)
	)
);

-- Drop the CHECK constraint only if it exists
IF OBJECT_ID('chk_account', 'C') IS NOT NULL
BEGIN
   ALTER TABLE account DROP CONSTRAINT chk_account;
END;


-- Add the CHECK constraint again

alter table account
add constraint chk_account check (
	(account_type = 'Saving' OR account_type='Checking')
	AND
	(balance >= 0)
);