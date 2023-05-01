--Search for a book by the title or its author:
SELECT * FROM books 
WHERE title LIKE 'Book_Title_Here' OR author LIKE 'Author_Name';

--Display the current fines a customer has posted on their account:
SELECT Fine_ID, Fine_Amount, Fine_Status, Book_ID 
FROM Fines 
WHERE Customer_ID = 345 AND Fine_Status = 'Unpaid';

--Display all available books in the library:
SELECT * FROM Borrows
WHERE date_returned IS NOT NULL;

--Search when a book will be returned:
SELECT due_date FROM borrows 
WHERE book_id = [book_id] AND date_returned IS NULL;

--Display specific customer information (their name, email, what books they have checked out):
SELECT customers.customer_id, customers.first_name, customers.last_name, customers.email, books.title 
FROM borrows 
INNER JOIN customers ON borrows.customer_id = customers.customer_id 
INNER JOIN books ON borrows.book_id = books.book_id;

--Search for books by publication date (search for newer/older books):
SELECT * FROM books 
WHERE publication_date > '2000';

--Searching for books in a specific genre:
SELECT * FROM Books 
WHERE genre = 'Dystopian';

--Search for books that are available in an e-book genre:
SELECT * FROM books 
WHERE Book_Type = 'E-Book';

--Find the location of a book in the library (row number):
SELECT aisle_number 
FROM books 
WHERE title = 'The Lord of the Rings';

--Search whether a specific book is currently checked out or not:
SELECT title, available 
FROM Books 
WHERE title = 'The Great Gatsby';
