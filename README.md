# The Book borrower 📚

## Project description

The book borrower is a web application meant to be used by small group of friends and aquintances who love to read and borrow their own books to each other. It works like library system, but in smaller scale, with book database that is visible to anyone and book exchange system which is accessable only to registered users. 

### Programming language

Application was made for school project with requirements of writting with ASP.NET and web forms, using C#, HTML, CSS and Javascript Databases were made in SQL. 

### Challenges

The biggest challenge was implementation of SQL databases and succesfully writing queries and their parameters. 

### Future improvements

Since this school project didn't required deployment of web application, there are no instructions for that, but it's one of the next steps for me. 

It is also one of the first versions of application, where I just now see what needs to be improved: 
- For book exchange you need username, but you can't find them anywhere, in book database are just user names and surnames.
- Book database and all the personal names are visible to anyone, I would correct it so that only registered users could see their names (and maybe even username).
- On My profile page user sees only books that other borrowed from him, but he can't see whose books he's got.

## How to Install and Run the Project

1. Download code & Library database, save database to location by your choice.
2. Open solution Izposoja.sln in Visual Studio.
3. Configure database as Data Source:
  - In Server Explorer add new connection, for Data Source choose Microsoft SQL Server Database File (SqlClient) and for data provider chose Microsof SqlClient Data Provider.
  - Browse files to find location of saved database and chose it.
  - Once you're connected to the database, open it's properties. In property Connection string copy whole line (Data Source=...)
6. In Solution Explorer open file Web.config, go to <connectionStrings> section, where all the properties about connection to database are. Replace existing Data source with the one you copied.
7. Installation of solution is now complete, all you need is to deploy it and share to friends.

## How to use it

Each registered user is welcomed to offer his own books for exchange. those books are then added to book database, with information who is the owner of each book in the database (along with other book informations like book ID, title, author, and optional information like publication year, description and picture). 

On the Borrow page, user can digitally borrow the book. By selecting username of book owner, book ID and date an exchange is made and seen in List of currently borrowed books, along wih all other exchanges. To return the book everything is the same, except at the end of form you click Return book. 

On My profile page user can edit his own data and see his books that are currently borrowed and by whom. 

Administrator is the one who can add, change or delete books from database and he can also add or delete users. 
