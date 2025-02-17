use lesson2;

create table photo
(
	id int identity(1,1) primary key,
	photo varbinary(max)
);

insert into photo(photo)
select Bulkcolumn from openrowset(
BULK 'D:\ML\SQL\lesson-2\homework\image.jpg' , SINGLE_BLOB
) as img;

select * from photo ;

select @@SERVERNAME;

