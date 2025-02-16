use lesson1;
drop table if exists book;
create table book
(
	book_id int not null primary key identity(1,1),
	title varchar(255) not null,
	author varchar(255) not null,
	published_year int CHECK (published_year > 0)  
);

drop table if exists member;
create table member
(
	member_id int not null primary key identity(1,1),
	name varchar(100) NOT NULL,
	email varchar(100) UNIQUE NOT NULL,
	phone_number varchar(255)NOT NULL
);

drop table if exists loan;
create table loan
(
	loan_id int not null primary key identity(1,1),
	book_id int not null foreign key references book(book_id),
	member_id int not null foreign key references member(member_id),
	loan_date date not null,
	return_date date null
)

-- Insert Books
INSERT INTO book (title, author, published_year) VALUES
('1984', 'George Orwell', 1949),
('To Kill a Mockingbird', 'Harper Lee', 1960),
('The Great Gatsby', 'F. Scott Fitzgerald', 1925),
('The Catcher in the Rye', 'J.D. Salinger', 1951);

-- Insert Members
INSERT INTO member (name, email, phone_number) VALUES
('Alice Johnson', 'alice@example.com', '123-456-7890'),
('Bob Smith', 'bob@example.com', '987-654-3210'),
('Charlie Brown', 'charlie@example.com', '555-555-5555');

-- Insert Loans
INSERT INTO loan (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2024-02-01', '2024-02-15'),
(2, 2, '2024-02-03', NULL),  -- Not returned yet
(3, 3, '2024-01-20', '2024-02-01'),
(4, 1, '2024-02-10', NULL);  -- Not returned yet

INSERT INTO loan (book_id, member_id, loan_date) VALUES (2, 3, '2024-02-10');

--checking the constraints
-- this queries fail
--INSERT INTO book (title, author, published_year) VALUES ('Fake Book', 'Unknown', -200);
--INSERT INTO member (name, email, phone_number) VALUES ('Dave', 'alice@example.com', '111-222-3333');
--INSERT INTO loan (book_id, member_id, loan_date) VALUES (100, 1, '2024-02-10');

select * from book;
select * from member;
select * from loan;