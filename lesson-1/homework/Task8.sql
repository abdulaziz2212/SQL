use lesson1;

drop table if exists books;
create table books
(
	book_id int primary key identity(1,1),
	title varchar(255) not null,
	price decimal(10,2) constraint ch_price check(price>0),
	genre varchar(50) constraint df_genre DEFAULT 'Unknown',
);

insert into books(title,price,genre)
values('Sherlock',12.5, 'Detective');

--it doen't work because of title is not given
--insert into books(price,genre)
--values(15,'Utopia');

insert into books(title,price,genre)
values('1985',15,'Utopia');

insert into books(title,price)
values ('1984', 10);

select * from books ;