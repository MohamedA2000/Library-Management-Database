--
-- File generated with SQLiteStudio v3.4.1 on Sat Mar 25 16:42:23 2023
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Books
CREATE TABLE IF NOT EXISTS Books (Book_ID INTEGER PRIMARY KEY NOT NULL UNIQUE, Title TEXT NOT NULL, Author TEXT NOT NULL, Publisher TEXT (255) NOT NULL, Publication_Date INTEGER NOT NULL, Aisle_number INTEGER NOT NULL, Book_Type TEXT NOT NULL, Genre TEXT NOT NULL, available BOOLEAN DEFAULT true);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (1024, 'The Lord of the Rings', 'J. R. R. Tolkien', 'George Allen & Unwin', 1954, 6, 'E-Book', 'Fantasy', 0);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (1254, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, 1, 'Paperback', 'Classic', 1);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (2568, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', 1813, 5, 'E-book', 'Romance', 0);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (3456, 'Animal Farm', 'George Orwell', 'Secker and Warburg', 1945, 3, 'Hard Cover', 'Satire', 1);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (4521, 'The Catcher in the Rye', 'J. D. Salinger', 'Little, Brown and Company', 1951, 4, 'E-Book', 'Coming-of-age', 1);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (6234, 'The Hobbit', 'J. R. R. Tolkien', 'George Allen & Unwin', 1937, 1, 'Paperback', 'Fantasy', 1);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (7382, 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', 1960, 4, 'Paperback', 'Classic', 1);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (7891, 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', 1932, 3, 'Paperback', 'Dystopian', 1);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (8913, 'The Hunger Games', 'Suzanne Collins', 'Scholastic', 2008, 7, 'E-Book', 'Dystopian', 1);
INSERT INTO Books (Book_ID, Title, Author, Publisher, Publication_Date, Aisle_number, Book_Type, Genre, available) VALUES (9120, '1984', 'George Orwell', 'Secker and Warburg', 1949, 3, 'Hard Cover', 'Dystopian', 1);

-- Table: Borrows
CREATE TABLE IF NOT EXISTS Borrows (Borrow_ID INTEGER PRIMARY KEY NOT NULL UNIQUE, Book_ID INTEGER NOT NULL REFERENCES Books (Book_ID), Customer_ID INTEGER NOT NULL REFERENCES Customers (Customer_ID), Librarian_ID INTEGER NOT NULL REFERENCES Librarians (Librarian_ID), Date_Borrowed TEXT NOT NULL, Due_Date TEXT NOT NULL, Date_Returned TEXT, FOREIGN KEY (Book_ID) REFERENCES Books (Book_ID), FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID), FOREIGN KEY (Librarian_ID) REFERENCES Librarians (Librarian_ID));
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (189532071, 7382, 123, 678901, '2022-02-05', '2022-03-05', '2022-03-10');
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (244157726, 2568, 567, 678901, '2022-06-10', '2022-06-30', NULL);
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (360308767, 1024, 345, 901234, '2021-12-15', '2022-01-15', '2022-01-20');
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (461388982, 7891, 789, 432109, '2022-04-01', '2022-05-01', '2022-05-05');
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (486459660, 1024, 123, 678901, '2022-09-01', '2022-09-30', NULL);
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (759655876, 1254, 234, 432109, '2022-08-15', '2022-09-15', '2022-09-20');
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (759658876, 1254, 234, 432109, '2022-08-15', '2022-09-15', '2022-09-20');
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (802250395, 8913, 890, 890123, '2022-03-15', '2022-04-15', '2022-04-20');
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (837187719, 4521, 901, 345678, '2022-05-20', '2022-06-20', '2022-06-25');
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (859339403, 1254, 345, 901234, '2022-07-05', '2022-08-05', '2022-08-10');
INSERT INTO Borrows (Borrow_ID, Book_ID, Customer_ID, Librarian_ID, Date_Borrowed, Due_Date, Date_Returned) VALUES (948302316, 7891, 234, 890123, '2022-01-10', '2022-02-10', '2022-02-15');

-- Table: Customer Reviews
CREATE TABLE IF NOT EXISTS "Customer Reviews" (Review_ID INTEGER PRIMARY KEY UNIQUE NOT NULL, Book_ID INTEGER REFERENCES Books (Book_ID) NOT NULL, Customer_ID INTEGER REFERENCES Customers (Customer_ID) NOT NULL, Star_Rating INTEGER NOT NULL, Review_Text NOT NULL);
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (2, 8913, 456, 3, 'This book was pretty good, but it didn''t quite live up to the hype for me.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (3, 3456, 789, 5, 'Absolutely brilliant. George Orwell was a genius.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (4, 2568, 234, 4, 'A classic for a reason. Jane Austen is a master of her craft.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (5, 7382, 567, 2, 'I don''t understand why people like this book so much. The plot was predictable and the characters were flat.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (6, 1254, 901, 5, 'One of the best books I''ve ever read. The writing is beautiful and the story is timeless.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (7, 6234, 123, 3, 'This book was fine, but it didn''t really grab me. I probably wouldn''t read it again.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (8, 4521, 456, 1, 'I hated this book. I found the protagonist to be insufferable and the writing to be pretentious.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (9, 1024, 789, 4, 'An absolute masterpiece. J.R.R. Tolkien''s imagination is unmatched.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (10, 7891, 234, 3, 'I liked this book, but I didn''t love it. The dystopian genre isn''t really my thing.');
INSERT INTO "Customer Reviews" (Review_ID, Book_ID, Customer_ID, Star_Rating, Review_Text) VALUES (11, 7891, 234, 3, 'I liked this book, but I didn''t love it. The dystopian genre isn''t really my thing.');

-- Table: Customers
CREATE TABLE IF NOT EXISTS Customers (
  Customer_ID INTEGER PRIMARY KEY NOT NULL,
  First_Name TEXT NOT NULL,
  Last_Name TEXT NOT NULL,
  Email TEXT NOT NULL,
  Phone TEXT NOT NULL,
  UNIQUE(Customer_ID),
  UNIQUE(Email)
);
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (123, 'Samantha', 'Lee', 'samanthalee@example.com', '555-2345');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (234, 'John', 'Doe', 'johndoe@example.com', '555-1234');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (345, 'Michael', 'Wilson', 'michaelwilson@example.com', '555-4567');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (456, 'William', 'Davis', 'williamdavis@example.com', '555-6789');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (567, 'Jane', 'Smith', 'janesmith@example.com', '555-5678');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (678, 'Megan', 'Taylor', 'megantaylor@example.com', '555-7890');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (789, 'Emma', 'Garcia', 'emmagarcia@example.com', '555-0123');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (890, 'Bob', 'Johnson', 'bobjohnson@example.com', '555-8901');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (901, 'David', 'Brown', 'davidbrown@example.com', '555-2345');
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone) VALUES (935, 'Ashley', 'Jones', 'ashleyjones@example.com', '555-6789');

-- Table: Fines
CREATE TABLE IF NOT EXISTS Fines (Fine_ID INTEGER PRIMARY KEY NOT NULL, Customer_ID INTEGER NOT NULL REFERENCES Customers (Customer_ID), Fine_Amount REAL NOT NULL, Fine_Status TEXT NOT NULL, Book_ID INTEGER NOT NULL, FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID), FOREIGN KEY (Book_ID) REFERENCES Books (Book_ID), UNIQUE (Fine_ID));
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (2, 234, 1.75, 'Paid', 1254);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (3, 345, 3.0, 'Unpaid', 2568);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (4, 456, 1.0, 'Paid', 3456);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (5, 567, 2.25, 'Unpaid', 4521);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (6, 678, 1.5, 'Paid', 6234);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (7, 789, 3.75, 'Unpaid', 7382);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (8, 890, 2.0, 'Paid', 7891);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (9, 901, 4.5, 'Unpaid', 8913);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (10, 935, 2.75, 'Paid', 9120);
INSERT INTO Fines (Fine_ID, Customer_ID, Fine_Amount, Fine_Status, Book_ID) VALUES (11, 935, 2.75, 'Paid', 9120);

-- Table: Librarians
CREATE TABLE IF NOT EXISTS Librarians (Librarian_ID INTEGER PRIMARY KEY NOT NULL UNIQUE, First_Name TEXT NOT NULL, Last_Name TEXT NOT NULL, Email TEXT NOT NULL, Department_ID INTEGER NOT NULL, UNIQUE (Email));
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (123456, 'John', 'Doe', 'johndoe@example.com', 56789);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (234567, 'Jane', 'Smith', 'janesmith@example.com', 45678);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (345678, 'Bob', 'Johnson', 'bobjohnson@example.com', 36456);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (432109, 'Ashley', 'Jones', 'ashleyjones@example.com', 78901);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (456789, 'Samantha', 'Lee', 'samanthalee@example.com', 23456);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (567890, 'William', 'Davis', 'williamdavis@example.com', 12345);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (567891, 'Drake', 'Drakeson', 'drake@example.com', 23456);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (678901, 'Emma', 'Garcia', 'emmagarcia@example.com', 34567);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (789012, 'Michael', 'Wilson', 'michaelwilson@example.com', 45678);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (890123, 'Megan', 'Taylor', 'megantaylor@example.com', 56789);
INSERT INTO Librarians (Librarian_ID, First_Name, Last_Name, Email, Department_ID) VALUES (901234, 'David', 'Brown', 'davidbrown@example.com', 67890);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
