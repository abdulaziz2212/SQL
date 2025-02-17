import pyodbc

con_str = r"DRIVER={SQL Server};SERVER=DESKTOP-B7OKICD\SQLEXPRESS;database=lesson2;Trusted_Connection=yes;"
try:
    # Establish connection
    con = pyodbc.connect(con_str)
    cursor = con.cursor()

    cursor.execute(
        '''
        SELECT * FROM photo;
        '''
    )
    # Fetch the first image
    row = cursor.fetchone()
    if row is not None:
        id, data = row

        with open("sql.jpg",'wb') as f:
            f.write(data)
        print(f"Image with ID {id} saved as 'sql.jpg'")
    else:
        print("No data found in the 'photo' table.")
except pyodbc.Error as e:
    print("Database error:", e)

finally:
    # Close connection
    if 'cursor' in locals():
        cursor.close()
    if 'con' in locals():
        con.close()
