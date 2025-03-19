use lesson12

--Task1

declare @temp table(
	DatabaseName nvarchar(255),
	SchemaName nvarchar(255),
	TableName nvarchar(255),
	ColumnName nvarchar(255),
	DataType nvarchar(255)
);


declare @name varchar(255);
declare @i int = 1;

declare @count int;
select @count = count(1)
from sys.databases 
where name not in ('master','model','msdb', 'tempdb');
	

while @i <= @count
begin 
	;with cte
	as(
		select name, row_number() over(order by name) as rn
		from sys.databases 
		where name not in ('master','model','msdb', 'tempdb')
	)
	select @name = name from cte
	where rn = @i 

	declare @sql_cmd nvarchar(max) =' SELECT         
            TABLE_CATALOG AS DatabaseName,
            TABLE_SCHEMA AS SchemaName,
            TABLE_NAME AS TableName,
            COLUMN_NAME AS ColumnName,
            CONCAT(
                DATA_TYPE, ''('' + 
                CASE WHEN CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR) = ''-1'' 
                     THEN ''max'' 
                     ELSE CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR) END
                + '')''
            ) AS DataType
        FROM ' + QUOTENAME(@name) + '.INFORMATION_SCHEMA.COLUMNS;';
		insert into @temp
	    EXEC (@sql_cmd);




	set @i = @i +1


end

SELECT * FROM @temp;
